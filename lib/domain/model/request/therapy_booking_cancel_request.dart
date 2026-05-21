import 'package:json_annotation/json_annotation.dart';

part 'therapy_booking_cancel_request.g.dart';

@JsonSerializable()
class TherapyBookingCancelRequest {
  @JsonKey(name: 'therapy_booking_session_id')
  final String therapyBookingSessionId;
  @JsonKey(name: 'therapist_booking_id', includeIfNull: false)
  final String? therapistBookingId;
  @JsonKey(name: 'cancel_reason')
  final String cancelReason;

  TherapyBookingCancelRequest(
    this.therapyBookingSessionId,
    this.therapistBookingId,
    this.cancelReason,
  );

  factory TherapyBookingCancelRequest.fromJson(Map<String, dynamic> json) =>
      _$TherapyBookingCancelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TherapyBookingCancelRequestToJson(this);
}
