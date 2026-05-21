import 'package:ayursh/domain/model/response/otp_token_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String errorCode;
  final String message;
  @JsonKey(name: 'data')
  final OtpTokenModel? otpTokenModel;


  SignUpResponse(
      this.success, this.errorCode, this.message, this.otpTokenModel);

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}