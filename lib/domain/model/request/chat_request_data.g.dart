// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRequestData _$ChatRequestDataFromJson(Map<String, dynamic> json) =>
    ChatRequestData(
      json['title'] as String,
      json['body'] as String,
      json['booking_id'] as String,
    );

Map<String, dynamic> _$ChatRequestDataToJson(ChatRequestData instance) =>
    <String, dynamic>{
      'title': instance.message,
      'body': instance.userName,
      'booking_id': instance.bookingId,
    };
