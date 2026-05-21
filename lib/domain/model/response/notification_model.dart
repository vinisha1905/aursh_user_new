import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  final int isRead;
  final String title;
  final String body;
  final String timestamp;
  @JsonKey(name: 'booking_id')
  final String bookingId;


  NotificationModel(
      this.isRead, this.title, this.body, this.timestamp, this.bookingId);

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}