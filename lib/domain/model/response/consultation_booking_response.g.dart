// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultationBookingResponse _$ConsultationBookingResponseFromJson(
        Map<String, dynamic> json) =>
    ConsultationBookingResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      ConsultationBookingModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConsultationBookingResponseToJson(
        ConsultationBookingResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.consultationBookingModel,
    };
