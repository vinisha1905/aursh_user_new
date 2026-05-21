import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/notification_model.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:ayursh/domain/util/db_helper.dart';
import 'package:ayursh/domain/util/preference_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_bloc.freezed.dart';
part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final OnboardingRepository onboardingRepository;
  final PreferenceUtil preferenceUtil;
  final DbHelper dbHelper;

  NotificationBloc({required this.onboardingRepository, required this.dbHelper, required this.preferenceUtil})
      : super(NotificationState.initialize());

  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    yield* event.map(initialize: (e) async* {
      var notifications = await dbHelper.getNotifications();
      yield state.copyWith(notifications: notifications);
      yield* _handleFirebaseToken();
    }, setIsRead: (e) async* {
      var notification = e.notification;
      var readNotification = NotificationModel(1, notification.title,
          notification.body, notification.timestamp, notification.bookingId);
      List<NotificationModel> notifications = state.notifications;
      var newNotifications = <NotificationModel>[];
      notifications.forEach((notify) {
        if (notify == notification) {
          newNotifications.add(readNotification);
        } else {
          newNotifications.add(notify);
        }
      });
      await dbHelper.update(readNotification);
      yield state.copyWith(notifications: newNotifications);
    }, newNotification: (e) async* {
      var data = e.remoteMessage.data;
      var title = data['title'] ?? '';
      var body = data['body'] ?? '';
      var timestamp = data['timestamp'] ?? DateTime.now().toString();
      var bookingId = data['booking_id'] ?? '';
      var notification =
          NotificationModel(0, title, body, timestamp, bookingId);
      print('Notification ${notification.toString()}');
      var notifications = <NotificationModel>[]..addAll(state.notifications)..add(notification);
      await dbHelper.insert(notification);
      yield state.copyWith(notifications: notifications);
    }, fetchNotifications: (e) async* {
      var notifications = await dbHelper.getNotifications();
      yield state.copyWith(notifications: notifications);
    });
  }

  Stream<NotificationState> _handleFirebaseToken() async* {
    String? token = await FirebaseMessaging.instance.getToken();
    // Save the initial token to the database
    print('Init token $token');
    if (token != null) {
      yield state.copyWith(fcmToken: token);
      await preferenceUtil.saveFcmToken(token);
      await onboardingRepository.updateUserFcmToken(token);
    }
    // Any time the token refreshes, store this in the database too.
    FirebaseMessaging.instance.onTokenRefresh.listen((token) async* {
      print('Refresh token $token');
      yield state.copyWith(fcmToken: token);
      await preferenceUtil.saveFcmToken(token);
      await onboardingRepository.updateUserFcmToken(token);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      add(NotificationEvent.newNotification(message));
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }
}
