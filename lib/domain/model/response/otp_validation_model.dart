import 'package:json_annotation/json_annotation.dart';

part 'otp_validation_model.g.dart';

@JsonSerializable()
class OtpValidationModel {
  @JsonKey(name: 'auth_token')
  final String authToken;
  @JsonKey(name: 'auth_token_expiry')
  final int authTokenExpiry;


  OtpValidationModel(this.authToken, this.authTokenExpiry);

  factory OtpValidationModel.fromJson(Map<String, dynamic> json) => _$OtpValidationModelFromJson(json);
  Map<String, dynamic> toJson() => _$OtpValidationModelToJson(this);
}