import 'package:json_annotation/json_annotation.dart';

part 'reschedule_consultation_request.g.dart';

@JsonSerializable()
class RescheduleConsultationRequest {
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @JsonKey(name: 'rescheduled_at')
  final String rescheduledAt;
  @JsonKey(name: 'consultation_booking_id')
  final String consultationBookingId;
  @JsonKey(name: 'doctor_booking_id')
  final String doctorBookingId;


  RescheduleConsultationRequest(this.doctorId, this.rescheduledAt,
      this.consultationBookingId, this.doctorBookingId);

  factory RescheduleConsultationRequest.fromJson(Map<String, dynamic> json) =>
      _$RescheduleConsultationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RescheduleConsultationRequestToJson(this);
}
