import 'package:json_annotation/json_annotation.dart';

part 'cancel_consultation_request.g.dart';

@JsonSerializable()
class CancelConsultationRequest {
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @JsonKey(name: 'doctor_booking_id')
  final String doctorBookingId;
  @JsonKey(name: 'total_amount')
  final double totalAmount ;
  @JsonKey(name: 'cancellation_fee')
  final double cancellationFee;
  @JsonKey(name: 'refund_amount')
  final double refundAmount;
  @JsonKey(name: 'cancellation_reason')
  final String cancellationReason;
  @JsonKey(name: 'scheduled_at_db')
  final int scheduledAtDb;

  CancelConsultationRequest(
      this.doctorId,
      this.doctorBookingId,
      this.totalAmount,
      this.cancellationFee,
      this.refundAmount,
      this.cancellationReason,
      this.scheduledAtDb);

  factory CancelConsultationRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelConsultationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CancelConsultationRequestToJson(this);
}
