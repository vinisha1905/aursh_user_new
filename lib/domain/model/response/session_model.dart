import 'package:json_annotation/json_annotation.dart';

part 'session_model.g.dart';

@JsonSerializable()
class SessionModel {
  final String id;
  @JsonKey(name: 'session_no')
  final int sessionNo;
  @JsonKey(name: 'scheduled_appointment_start_time')
  final int scheduledAppointmentStartTime;
  @JsonKey(name: 'scheduled_appointment_end_time')
  final int scheduledAppointmentEndTime;
  @JsonKey(name: 'therapist_booking_id')
  final String therapistBookingId;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'therapy_time')
  final String therapyTime;
  @JsonKey(name: 'display_name')
  final String displayName;
  @JsonKey(name: 'display_image')
  final String displayImage;
  @JsonKey(name: 'therapist_id')
  final String therapistId;
  @JsonKey(name: 'enable_start_validation')
  final bool enableStartValidation;
  @JsonKey(name: 'enable_end_validation')
  final bool enableEndValidation;
  @JsonKey(name: 'start_qr_token_session_validated_at')
  final String? startQrTokenSessionValidatedAt;
  @JsonKey(name: 'can_therapy_session_be_rescheduled')
  final bool? canTherapySessionBeRescheduled;
  @JsonKey(name: 'can_therapy_session_be_cancelled')
  final bool? canTherapySessionBeCancelled;
  @JsonKey(name: 'alternate_start_otp')
  final int? alternateStartOtp;
  @JsonKey(name: 'alternate_end_otp')
  final int? alternateEndOtp;

  SessionModel(
    this.id,
    this.sessionNo,
    this.scheduledAppointmentStartTime,
    this.scheduledAppointmentEndTime,
    this.therapistBookingId,
    this.status,
    this.therapyTime,
    this.displayName,
    this.displayImage,
    this.therapistId,
    this.enableStartValidation,
    this.enableEndValidation,
    this.startQrTokenSessionValidatedAt,
    this.canTherapySessionBeRescheduled,
    this.canTherapySessionBeCancelled,
    this.alternateStartOtp,
    this.alternateEndOtp
  );

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}
