// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      json['id'] as String,
      (json['session_no'] as num).toInt(),
      (json['scheduled_appointment_start_time'] as num).toInt(),
      (json['scheduled_appointment_end_time'] as num).toInt(),
      json['therapist_booking_id'] as String,
      json['status'] as String,
      json['therapy_time'] as String,
      json['display_name'] as String,
      json['display_image'] as String,
      json['therapist_id'] as String,
      json['enable_start_validation'] as bool,
      json['enable_end_validation'] as bool,
      json['start_qr_token_session_validated_at'] as String?,
      json['can_therapy_session_be_rescheduled'] as bool?,
      json['can_therapy_session_be_cancelled'] as bool?,
      (json['alternate_start_otp'] as num?)?.toInt(),
      (json['alternate_end_otp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_no': instance.sessionNo,
      'scheduled_appointment_start_time':
          instance.scheduledAppointmentStartTime,
      'scheduled_appointment_end_time': instance.scheduledAppointmentEndTime,
      'therapist_booking_id': instance.therapistBookingId,
      'status': instance.status,
      'therapy_time': instance.therapyTime,
      'display_name': instance.displayName,
      'display_image': instance.displayImage,
      'therapist_id': instance.therapistId,
      'enable_start_validation': instance.enableStartValidation,
      'enable_end_validation': instance.enableEndValidation,
      'start_qr_token_session_validated_at':
          instance.startQrTokenSessionValidatedAt,
      'can_therapy_session_be_rescheduled':
          instance.canTherapySessionBeRescheduled,
      'can_therapy_session_be_cancelled': instance.canTherapySessionBeCancelled,
      'alternate_start_otp': instance.alternateStartOtp,
      'alternate_end_otp': instance.alternateEndOtp,
    };
