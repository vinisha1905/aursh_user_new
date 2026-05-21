part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.initialize() = _Initialize;
  const factory NotificationEvent.newNotification(RemoteMessage remoteMessage) = _NewNotification;
  const factory NotificationEvent.setIsRead(NotificationModel notification) = _SetIsRead;
  const factory NotificationEvent.fetchNotifications() = _FetchNotifications;
}