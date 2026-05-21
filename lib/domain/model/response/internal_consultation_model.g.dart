// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internal_consultation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InternalConsultationModel _$InternalConsultationModelFromJson(
        Map<String, dynamic> json) =>
    InternalConsultationModel(
      json['id'] as String,
      json['doctor_booking_id'] as String,
      json['scheduled_at'] as String,
      json['booking_for_name'] as String,
      json['booking_for_gender'] as String,
      json['booking_for_age'] as String,
      json['patient_name'] as String?,
      json['patient_gender'] as String?,
      json['patient_age'] as String?,
      (json['amount_payable'] as num).toDouble(),
      (json['membership_discount'] as num).toDouble(),
      (json['total_amount'] as num).toDouble(),
      json['cancelled_at'] as String?,
      json['is_external'] as bool,
      (json['booked_on_ts'] as num).toInt(),
      json['booked_on'] as String,
      json['appointment_date'] as String,
      json['follow_up_text'] as String,
      json['doctor_id'] as String,
      json['doctor_fcm_token'] as String?,
      json['display_name'] as String,
      json['display_image'] as String,
      json['qualification'] as String,
      json['status'] as String,
      (json['scheduled_at_db'] as num).toInt(),
      json['is_refund_processed'] as bool?,
      json['can_be_cancelled'] as bool,
      json['prescription_url'] as String?,
      json['is_follow_up_valid'] as bool,
      (json['assigned_therapy_total_sessions'] as num?)?.toInt(),
      json['assigned_therapy_title'] as String?,
      json['assigned_therapy_headline'] as String?,
      json['assigned_therapy_category'] as String?,
    );

Map<String, dynamic> _$InternalConsultationModelToJson(
        InternalConsultationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor_booking_id': instance.doctorBookingId,
      'scheduled_at': instance.scheduleAt,
      'booking_for_name': instance.bookingForName,
      'booking_for_gender': instance.bookingForGender,
      'booking_for_age': instance.bookingForAge,
      'patient_name': instance.patientName,
      'patient_gender': instance.patientGender,
      'patient_age': instance.patientAge,
      'amount_payable': instance.amountPayable,
      'membership_discount': instance.membershipDiscount,
      'total_amount': instance.totalAmount,
      'cancelled_at': instance.cancelledAt,
      'is_external': instance.isExternal,
      'booked_on_ts': instance.bookedOnTs,
      'booked_on': instance.bookedOn,
      'appointment_date': instance.appointmentDate,
      'follow_up_text': instance.followUpText,
      'doctor_id': instance.doctorId,
      'doctor_fcm_token': instance.doctorFcmToken,
      'display_name': instance.displayName,
      'display_image': instance.displayImage,
      'qualification': instance.qualification,
      'status': instance.status,
      'scheduled_at_db': instance.scheduledAtDb,
      'is_refund_processed': instance.isRefundProcessed,
      'can_be_cancelled': instance.canBeCancelled,
      'prescription_url': instance.prescriptionUrl,
      'is_follow_up_valid': instance.isFollowUpValid,
      'assigned_therapy_total_sessions': instance.assignedTherapyTotalSessions,
      'assigned_therapy_title': instance.assignedTherapyTitle,
      'assigned_therapy_headline': instance.assignedTherapyHeadline,
      'assigned_therapy_category': instance.assignedTherapyCategory,
    };
