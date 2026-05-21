import 'package:json_annotation/json_annotation.dart';

part 'otp_validation_request.g.dart';

@JsonSerializable()
class OtpValidationRequest {
  @JsonKey(name: 'sms_token_session_id')
  final String smsTokenSessionId;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'sms_token')
  final String smsToken;


  OtpValidationRequest({required this.phoneNumber, required this.userId, required this.smsToken, required this.smsTokenSessionId});

  factory OtpValidationRequest.fromJson(Map<String, dynamic> json) => _$OtpValidationRequestFromJson(json);
  Map<String, dynamic> toJson() => _$OtpValidationRequestToJson(this);
}