// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_therapy_time_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookTherapyTimeResponse _$BookTherapyTimeResponseFromJson(
        Map<String, dynamic> json) =>
    BookTherapyTimeResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      BookTherapyTimeModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookTherapyTimeResponseToJson(
        BookTherapyTimeResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.bookTherapyTimeModel,
    };
