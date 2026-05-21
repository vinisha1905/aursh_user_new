// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reschedule_consultation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RescheduleConsultationRequest _$RescheduleConsultationRequestFromJson(
        Map<String, dynamic> json) =>
    RescheduleConsultationRequest(
      json['doctor_id'] as String,
      json['rescheduled_at'] as String,
      json['consultation_booking_id'] as String,
      json['doctor_booking_id'] as String,
    );

Map<String, dynamic> _$RescheduleConsultationRequestToJson(
        RescheduleConsultationRequest instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctorId,
      'rescheduled_at': instance.rescheduledAt,
      'consultation_booking_id': instance.consultationBookingId,
      'doctor_booking_id': instance.doctorBookingId,
    };
