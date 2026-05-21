// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_booking_cancel_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyBookingCancelRequest _$TherapyBookingCancelRequestFromJson(
        Map<String, dynamic> json) =>
    TherapyBookingCancelRequest(
      json['therapy_booking_session_id'] as String,
      json['therapist_booking_id'] as String?,
      json['cancel_reason'] as String,
    );

Map<String, dynamic> _$TherapyBookingCancelRequestToJson(
    TherapyBookingCancelRequest instance) {
  final val = <String, dynamic>{
    'therapy_booking_session_id': instance.therapyBookingSessionId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('therapist_booking_id', instance.therapistBookingId);
  val['cancel_reason'] = instance.cancelReason;
  return val;
}
