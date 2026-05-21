import 'package:ayursh/domain/model/response/add_on_therapy_post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'therapy_booking_request.g.dart';

@JsonSerializable()
class TherapyBookingRequest {
  @JsonKey(name: 'is_non_consultation_therapy_booking')
  final bool isNonConsultationTherapyBooking;
  @JsonKey(name: 'consultation_booking_id', includeIfNull: false)
  final String? consultationBookingId;
  @JsonKey(name: 'doctor_booking_id', includeIfNull: false)
  final String? doctorBookingId;
  @JsonKey(name: 'therapy_title')
  final String therapyTitle;
  @JsonKey(name: 'total_sessions')
  final String totalSessions;
  @JsonKey(name: 'session_no')
  final String sessionNo;
  @JsonKey(name: 'scheduled_at')
  final String scheduledAt;
  @JsonKey(name: 'amount_payable')
  final String amountPayable;
  @JsonKey(name: 'membership_discount')
  final double membershipDiscount;
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @JsonKey(name: 'address_flat_no_building')
  final String addressFlatNoBuilding;
  @JsonKey(name: 'address_area_locality')
  final String addressAreaLocality;
  @JsonKey(name: 'address_landmark')
  final String addressLandmark;
  @JsonKey(name: 'address_city')
  final String addressCity;
  @JsonKey(name: 'session_duration_in_min')
  final int sessionDurationInMin;
  @JsonKey(name: 'patient_name')
  final String patientName;
  @JsonKey(name: 'patient_gender')
  final String patientGender;
  @JsonKey(name: 'patient_age')
  final String patientAge;
  @JsonKey(name: 'therapy_booking_session_id')
  final String therapyBookingSessionId;
  @JsonKey(name: 'ayursh_order_id')
  final String ayurshOrderId;
  @JsonKey(name: 'add_on_therapies')
  final List<AddOnTherapyPost> addOnTherapies;
  @JsonKey(name: 'address_latitude')
  final double addressLat;
  @JsonKey(name: 'address_longitude')
  final double addressLong;
  @JsonKey(name: 'clinic_id')
  final String clinicId;
  @JsonKey(name: 'referral_discount')
  final int referralDiscount;
  @JsonKey(name: 'referrer_type')
  final String referralType;
  @JsonKey(name: 'referrer_id')
  final String referralId;
  @JsonKey(name: 'referrer_commission')
  final int referralCommission;
  @JsonKey(name: 'amount_before_discount')
  final int amountBeforeDiscount;

  TherapyBookingRequest(
      this.isNonConsultationTherapyBooking,
      this.consultationBookingId,
      this.doctorBookingId,
      this.therapyTitle,
      this.totalSessions,
      this.sessionNo,
      this.scheduledAt,
      this.amountPayable,
      this.membershipDiscount,
      this.totalAmount,
      this.addressFlatNoBuilding,
      this.addressAreaLocality,
      this.addressLandmark,
      this.addressCity,
      this.sessionDurationInMin,
      this.patientName,
      this.patientGender,
      this.patientAge,
      this.therapyBookingSessionId,
      this.ayurshOrderId,
      this.addOnTherapies,
      this.addressLat,
      this.addressLong,
      this.clinicId,
      this.referralDiscount,
      this.amountBeforeDiscount,
      this.referralCommission,
      this.referralId,
      this.referralType);

  factory TherapyBookingRequest.fromJson(Map<String, dynamic> json) => _$TherapyBookingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TherapyBookingRequestToJson(this);
}
