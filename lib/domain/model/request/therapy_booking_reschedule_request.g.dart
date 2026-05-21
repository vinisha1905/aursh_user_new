// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_booking_reschedule_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyBookingRescheduleRequest _$TherapyBookingRescheduleRequestFromJson(
        Map<String, dynamic> json) =>
    TherapyBookingRescheduleRequest(
      json['non_consultation_therapy_booking_id'] as String?,
      json['therapy_booking_session_id'] as String,
      json['therapist_booking_id'] as String?,
      json['therapist__id'] as String?,
      json['therapy_title'] as String,
      (json['session_no'] as num).toInt(),
      json['scheduled_at'] as String,
      (json['session_duration_in_min'] as num).toInt(),
      json['patient_gender'] as String,
      json['is_requested_by_operation_team'] as bool,
      json['modify_reason'] as String,
    );

Map<String, dynamic> _$TherapyBookingRescheduleRequestToJson(
    TherapyBookingRescheduleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('non_consultation_therapy_booking_id',
      instance.nonConsultationTherapyBookingId);
  val['therapy_booking_session_id'] = instance.therapyBookingSessionId;
  writeNotNull('therapist_booking_id', instance.therapistBookingId);
  writeNotNull('therapist__id', instance.therapistId);
  val['therapy_title'] = instance.therapyTitle;
  val['session_no'] = instance.sessionNo;
  val['scheduled_at'] = instance.scheduledAt;
  val['session_duration_in_min'] = instance.sessionDurationInMin;
  val['patient_gender'] = instance.patientGender;
  val['is_requested_by_operation_team'] = instance.isrequestedbyoperationteam;
  val['modify_reason'] = instance.modifyReason;
  return val;
}
