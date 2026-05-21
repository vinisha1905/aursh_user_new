import 'package:ayursh/domain/model/response/otp_validation_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_validation_response.g.dart';

@JsonSerializable()
class OtpValidationResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String errorCode;
  final String message;
  @JsonKey(name: 'data')
  final OtpValidationModel? otpValidationModel;

  OtpValidationResponse(
      this.success, this.errorCode, this.message, this.otpValidationModel);

  factory OtpValidationResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpValidationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OtpValidationResponseToJson(this);
}
