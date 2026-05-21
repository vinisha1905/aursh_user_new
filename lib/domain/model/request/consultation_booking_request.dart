import 'package:json_annotation/json_annotation.dart';

part 'consultation_booking_request.g.dart';

@JsonSerializable()
class ConsultationBookingRequest {
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @JsonKey(name: 'booking_for_name')
  final String bookingForName;
  @JsonKey(name: 'booking_for_age')
  final String bookingForAge;
  @JsonKey(name: 'booking_for_gender')
  final String bookingForGender;
  @JsonKey(name: 'scheduled_at')
  final String scheduledAt;
  @JsonKey(name: 'amount_payable')
  final double amountPayable;
  @JsonKey(name: 'membership_discount')
  final double membershipDiscount;
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @JsonKey(name: 'session_duration_in_min')
  final int sessionDurationInMin;
  @JsonKey(name: 'consultation_booking_id')
  final String consultationBookingId;
  @JsonKey(name: 'ayursh_order_id')
  final String ayurshOrderId;

  ConsultationBookingRequest(
      this.doctorId,
      this.bookingForName,
      this.bookingForAge,
      this.bookingForGender,
      this.scheduledAt,
      this.amountPayable,
      this.membershipDiscount,
      this.totalAmount,
      this.sessionDurationInMin,
      this.consultationBookingId,
      this.ayurshOrderId);

  factory ConsultationBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$ConsultationBookingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationBookingRequestToJson(this);
}
