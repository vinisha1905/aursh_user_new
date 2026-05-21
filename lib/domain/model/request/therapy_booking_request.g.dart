// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyBookingRequest _$TherapyBookingRequestFromJson(
        Map<String, dynamic> json) =>
    TherapyBookingRequest(
      json['is_non_consultation_therapy_booking'] as bool,
      json['consultation_booking_id'] as String?,
      json['doctor_booking_id'] as String?,
      json['therapy_title'] as String,
      json['total_sessions'] as String,
      json['session_no'] as String,
      json['scheduled_at'] as String,
      json['amount_payable'] as String,
      (json['membership_discount'] as num).toDouble(),
      (json['total_amount'] as num).toDouble(),
      json['address_flat_no_building'] as String,
      json['address_area_locality'] as String,
      json['address_landmark'] as String,
      json['address_city'] as String,
      (json['session_duration_in_min'] as num).toInt(),
      json['patient_name'] as String,
      json['patient_gender'] as String,
      json['patient_age'] as String,
      json['therapy_booking_session_id'] as String,
      json['ayursh_order_id'] as String,
      (json['add_on_therapies'] as List<dynamic>)
          .map((e) => AddOnTherapyPost.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['address_latitude'] as num).toDouble(),
      (json['address_longitude'] as num).toDouble(),
      json['clinic_id'] as String,
      (json['referral_discount'] as num).toInt(),
      (json['amount_before_discount'] as num).toInt(),
      (json['referrer_commission'] as num).toInt(),
      json['referrer_id'] as String,
      json['referrer_type'] as String,
    );

Map<String, dynamic> _$TherapyBookingRequestToJson(
    TherapyBookingRequest instance) {
  final val = <String, dynamic>{
    'is_non_consultation_therapy_booking':
        instance.isNonConsultationTherapyBooking,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('consultation_booking_id', instance.consultationBookingId);
  writeNotNull('doctor_booking_id', instance.doctorBookingId);
  val['therapy_title'] = instance.therapyTitle;
  val['total_sessions'] = instance.totalSessions;
  val['session_no'] = instance.sessionNo;
  val['scheduled_at'] = instance.scheduledAt;
  val['amount_payable'] = instance.amountPayable;
  val['membership_discount'] = instance.membershipDiscount;
  val['total_amount'] = instance.totalAmount;
  val['address_flat_no_building'] = instance.addressFlatNoBuilding;
  val['address_area_locality'] = instance.addressAreaLocality;
  val['address_landmark'] = instance.addressLandmark;
  val['address_city'] = instance.addressCity;
  val['session_duration_in_min'] = instance.sessionDurationInMin;
  val['patient_name'] = instance.patientName;
  val['patient_gender'] = instance.patientGender;
  val['patient_age'] = instance.patientAge;
  val['therapy_booking_session_id'] = instance.therapyBookingSessionId;
  val['ayursh_order_id'] = instance.ayurshOrderId;
  val['add_on_therapies'] = instance.addOnTherapies;
  val['address_latitude'] = instance.addressLat;
  val['address_longitude'] = instance.addressLong;
  val['clinic_id'] = instance.clinicId;
  val['referral_discount'] = instance.referralDiscount;
  val['referrer_type'] = instance.referralType;
  val['referrer_id'] = instance.referralId;
  val['referrer_commission'] = instance.referralCommission;
  val['amount_before_discount'] = instance.amountBeforeDiscount;
  return val;
}
