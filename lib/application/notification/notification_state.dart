part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState(
      {required LoadingState loadingState,
        required List<NotificationModel> notifications,
      required String? fcmToken}) = _NotificationState;

  factory NotificationState.initialize() =>
      NotificationState(loadingState: LoadingState.isInitial, notifications: [], fcmToken: null);
}
