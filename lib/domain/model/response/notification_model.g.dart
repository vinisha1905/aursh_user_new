// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      (json['isRead'] as num).toInt(),
      json['title'] as String,
      json['body'] as String,
      json['timestamp'] as String,
      json['booking_id'] as String,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'isRead': instance.isRead,
      'title': instance.title,
      'body': instance.body,
      'timestamp': instance.timestamp,
      'booking_id': instance.bookingId,
    };
