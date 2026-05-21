// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookAppointmentResponse _$BookAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    BookAppointmentResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      BookAppointmentModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookAppointmentResponseToJson(
        BookAppointmentResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.bookAppointmentModel,
    };
