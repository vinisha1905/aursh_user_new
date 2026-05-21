import 'package:ayursh/domain/model/response/blog_model.dart';
import 'package:ayursh/domain/model/response/book_appointment_model.dart';
import 'package:ayursh/domain/model/response/otp_token_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rtc_token_response.g.dart';

@JsonSerializable()
class RtcTokenResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final String token;


  RtcTokenResponse(
      this.success, this.errorCode, this.message, this.token);

  factory RtcTokenResponse.fromJson(Map<String, dynamic> json) => _$RtcTokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RtcTokenResponseToJson(this);
}