// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultationBookingRequest _$ConsultationBookingRequestFromJson(
        Map<String, dynamic> json) =>
    ConsultationBookingRequest(
      json['doctor_id'] as String,
      json['booking_for_name'] as String,
      json['booking_for_age'] as String,
      json['booking_for_gender'] as String,
      json['scheduled_at'] as String,
      (json['amount_payable'] as num).toDouble(),
      (json['membership_discount'] as num).toDouble(),
      (json['total_amount'] as num).toDouble(),
      (json['session_duration_in_min'] as num).toInt(),
      json['consultation_booking_id'] as String,
      json['ayursh_order_id'] as String,
    );

Map<String, dynamic> _$ConsultationBookingRequestToJson(
        ConsultationBookingRequest instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctorId,
      'booking_for_name': instance.bookingForName,
      'booking_for_age': instance.bookingForAge,
      'booking_for_gender': instance.bookingForGender,
      'scheduled_at': instance.scheduledAt,
      'amount_payable': instance.amountPayable,
      'membership_discount': instance.membershipDiscount,
      'total_amount': instance.totalAmount,
      'session_duration_in_min': instance.sessionDurationInMin,
      'consultation_booking_id': instance.consultationBookingId,
      'ayursh_order_id': instance.ayurshOrderId,
    };
