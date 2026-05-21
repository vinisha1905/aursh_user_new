// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_consultation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelConsultationRequest _$CancelConsultationRequestFromJson(
        Map<String, dynamic> json) =>
    CancelConsultationRequest(
      json['doctor_id'] as String,
      json['doctor_booking_id'] as String,
      (json['total_amount'] as num).toDouble(),
      (json['cancellation_fee'] as num).toDouble(),
      (json['refund_amount'] as num).toDouble(),
      json['cancellation_reason'] as String,
      (json['scheduled_at_db'] as num).toInt(),
    );

Map<String, dynamic> _$CancelConsultationRequestToJson(
        CancelConsultationRequest instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctorId,
      'doctor_booking_id': instance.doctorBookingId,
      'total_amount': instance.totalAmount,
      'cancellation_fee': instance.cancellationFee,
      'refund_amount': instance.refundAmount,
      'cancellation_reason': instance.cancellationReason,
      'scheduled_at_db': instance.scheduledAtDb,
    };
