// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_booking_next_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyBookingNextRequest _$TherapyBookingNextRequestFromJson(
        Map<String, dynamic> json) =>
    TherapyBookingNextRequest(
      json['non_consultation_therapy_booking_id'] as String?,
      json['consultation_booking_id'] as String?,
      json['therapy_title'] as String,
      json['session_no'] as String,
      json['scheduled_at'] as String,
      (json['session_duration_in_min'] as num).toInt(),
      json['patient_gender'] as String,
    );

Map<String, dynamic> _$TherapyBookingNextRequestToJson(
    TherapyBookingNextRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('non_consultation_therapy_booking_id',
      instance.nonConsultationTherapyBookingId);
  writeNotNull('consultation_booking_id', instance.consultationBookingId);
  val['therapy_title'] = instance.therapyTitle;
  val['session_no'] = instance.sessionNo;
  val['scheduled_at'] = instance.scheduledAt;
  val['session_duration_in_min'] = instance.sessionDurationInMin;
  val['patient_gender'] = instance.patientGender;
  return val;
}
