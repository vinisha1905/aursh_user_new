import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'is_web_login')
  final bool isWebLogin;
  @JsonKey(name: 'login_method')
  final String loginMethod;

  LoginRequest({
    required this.phoneNumber,
    this.isWebLogin = false,
    required this.loginMethod,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
