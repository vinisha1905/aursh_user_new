import 'package:json_annotation/json_annotation.dart';

part 'otp_token_model.g.dart';

@JsonSerializable()
class OtpTokenModel {
  @JsonKey(name: 'sms_token_session_id')
  final String smsTokenSessionId;
  @JsonKey(name: 'user_id')
  final String userId;


  OtpTokenModel(this.smsTokenSessionId, this.userId);

  factory OtpTokenModel.fromJson(Map<String, dynamic> json) => _$OtpTokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$OtpTokenModelToJson(this);
}