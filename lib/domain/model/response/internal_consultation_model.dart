import 'package:json_annotation/json_annotation.dart';

part 'internal_consultation_model.g.dart';

@JsonSerializable()
class InternalConsultationModel {
  final String id;
  @JsonKey(name: 'doctor_booking_id')
  final String doctorBookingId;
  @JsonKey(name: 'scheduled_at')
  final String scheduleAt;
  @JsonKey(name: 'booking_for_name')
  final String bookingForName;
  @JsonKey(name: 'booking_for_gender')
  final String bookingForGender;
  @JsonKey(name: 'booking_for_age')
  final String bookingForAge;
  @JsonKey(name: 'patient_name')
  final String? patientName;
  @JsonKey(name: 'patient_gender')
  final String? patientGender;
  @JsonKey(name: 'patient_age')
  final String? patientAge;
  @JsonKey(name: 'amount_payable')
  final double amountPayable;
  @JsonKey(name: 'membership_discount')
  final double membershipDiscount;
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @JsonKey(name: 'cancelled_at')
  final String? cancelledAt;
  @JsonKey(name: 'is_external')
  final bool isExternal;
  @JsonKey(name: 'booked_on_ts')
  final int bookedOnTs;
  @JsonKey(name: 'booked_on')
  final String bookedOn;
  @JsonKey(name: 'appointment_date')
  final String appointmentDate;
  @JsonKey(name: 'follow_up_text')
  final String followUpText;
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @JsonKey(name: 'doctor_fcm_token')
  final String? doctorFcmToken;
  @JsonKey(name: 'display_name')
  final String displayName;
  @JsonKey(name: 'display_image')
  final String displayImage;
  final String qualification;
  final String status;
  @JsonKey(name: 'scheduled_at_db')
  final int scheduledAtDb;
  @JsonKey(name: 'is_refund_processed')
  final bool? isRefundProcessed;
  @JsonKey(name: 'can_be_cancelled')
  final bool canBeCancelled;
  @JsonKey(name: 'prescription_url')
  final String? prescriptionUrl;
  @JsonKey(name: 'is_follow_up_valid')
  final bool isFollowUpValid;
  @JsonKey(name: 'assigned_therapy_total_sessions')
  final int? assignedTherapyTotalSessions;
  @JsonKey(name: 'assigned_therapy_title')
  final String? assignedTherapyTitle;
  @JsonKey(name: 'assigned_therapy_headline')
  final String? assignedTherapyHeadline;
  @JsonKey(name: 'assigned_therapy_category')
  final String? assignedTherapyCategory;


  InternalConsultationModel(
      this.id,
      this.doctorBookingId,
      this.scheduleAt,
      this.bookingForName,
      this.bookingForGender,
      this.bookingForAge,
      this.patientName,
      this.patientGender,
      this.patientAge,
      this.amountPayable,
      this.membershipDiscount,
      this.totalAmount,
      this.cancelledAt,
      this.isExternal,
      this.bookedOnTs,
      this.bookedOn,
      this.appointmentDate,
      this.followUpText,
      this.doctorId,
      this.doctorFcmToken,
      this.displayName,
      this.displayImage,
      this.qualification,
      this.status,
      this.scheduledAtDb,
      this.isRefundProcessed,
      this.canBeCancelled,
      this.prescriptionUrl,
      this.isFollowUpValid,
      this.assignedTherapyTotalSessions,
      this.assignedTherapyTitle,
      this.assignedTherapyHeadline,
      this.assignedTherapyCategory);

  factory InternalConsultationModel.fromJson(Map<String, dynamic> json) => _$InternalConsultationModelFromJson(json);
  Map<String, dynamic> toJson() => _$InternalConsultationModelToJson(this);
}