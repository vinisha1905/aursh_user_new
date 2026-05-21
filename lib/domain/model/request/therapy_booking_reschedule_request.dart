import 'package:json_annotation/json_annotation.dart';

part 'therapy_booking_reschedule_request.g.dart';

@JsonSerializable()
class TherapyBookingRescheduleRequest {
  @JsonKey(name: 'non_consultation_therapy_booking_id', includeIfNull: false)
  final String? nonConsultationTherapyBookingId;
  @JsonKey(name: 'therapy_booking_session_id')
  final String therapyBookingSessionId;
  @JsonKey(name: 'therapist_booking_id', includeIfNull: false)
  final String? therapistBookingId;
  @JsonKey(name: 'therapist__id', includeIfNull: false)
  final String? therapistId;
  @JsonKey(name: 'therapy_title')
  final String therapyTitle;
  @JsonKey(name: 'session_no')
  final int sessionNo;
  @JsonKey(name: 'scheduled_at')
  final String scheduledAt;
  @JsonKey(name: 'session_duration_in_min')
  final int sessionDurationInMin;
  @JsonKey(name: 'patient_gender')
  final String patientGender;
  @JsonKey(name: 'is_requested_by_operation_team')
  bool isrequestedbyoperationteam = false;
  @JsonKey(name: 'modify_reason')
  final String modifyReason;

  TherapyBookingRescheduleRequest(
    this.nonConsultationTherapyBookingId,
    this.therapyBookingSessionId,
    this.therapistBookingId,
    this.therapistId,
    this.therapyTitle,
    this.sessionNo,
    this.scheduledAt,
    this.sessionDurationInMin,
    this.patientGender,
    this.isrequestedbyoperationteam,
    this.modifyReason,
  );

  factory TherapyBookingRescheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$TherapyBookingRescheduleRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TherapyBookingRescheduleRequestToJson(this);
}
