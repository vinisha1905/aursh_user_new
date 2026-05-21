// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_call_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioCallRequestData _$AudioCallRequestDataFromJson(
        Map<String, dynamic> json) =>
    AudioCallRequestData(
      json['title'] as String,
      json['channel'] as String,
      json['toUser'] as String,
      json['user'] as String,
      json['booking_id'] as String,
      json['fcm'] as String,
      json['type'] as String,
      (json['time'] as num).toInt(),
    );

Map<String, dynamic> _$AudioCallRequestDataToJson(
        AudioCallRequestData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'channel': instance.channel,
      'toUser': instance.toUser,
      'user': instance.user,
      'booking_id': instance.bookingId,
      'fcm': instance.userToken,
      'type': instance.type,
      'time': instance.time,
    };
