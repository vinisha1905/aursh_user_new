import 'package:json_annotation/json_annotation.dart';

part 'therapy_booking_next_request.g.dart';

@JsonSerializable()
class TherapyBookingNextRequest {
  @JsonKey(name: 'non_consultation_therapy_booking_id', includeIfNull: false)
  final String? nonConsultationTherapyBookingId;
  @JsonKey(name: 'consultation_booking_id', includeIfNull: false)
  final String? consultationBookingId;
  @JsonKey(name: 'therapy_title')
  final String therapyTitle;
  @JsonKey(name: 'session_no')
  final String sessionNo;
  @JsonKey(name: 'scheduled_at')
  final String scheduledAt;
  @JsonKey(name: 'session_duration_in_min')
  final int sessionDurationInMin;
  @JsonKey(name: 'patient_gender')
  final String patientGender;


  TherapyBookingNextRequest(
      this.nonConsultationTherapyBookingId,
      this.consultationBookingId,
      this.therapyTitle,
      this.sessionNo,
      this.scheduledAt,
      this.sessionDurationInMin,
      this.patientGender);

  factory TherapyBookingNextRequest.fromJson(Map<String, dynamic> json) =>
      _$TherapyBookingNextRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TherapyBookingNextRequestToJson(this);
}
