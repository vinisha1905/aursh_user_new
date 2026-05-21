import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String pin;
  @JsonKey(name: 'user_name')
  final String userName;
  @JsonKey(name: 'user_email')
  final String userEmail;
  @JsonKey(name: 'is_web_registration')
  final bool isWebRegistration;
  @JsonKey(name: 'is_ios_registration')
  final bool isIOSRegistration;

  SignUpRequest(
      {required this.phoneNumber,
      required this.userName,
      required this.userEmail,
      required this.isIOSRegistration,
      this.pin = '1985',
      this.isWebRegistration = false});

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
