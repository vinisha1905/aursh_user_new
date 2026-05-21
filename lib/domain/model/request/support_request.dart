import 'package:json_annotation/json_annotation.dart';

part 'support_request.g.dart';

@JsonSerializable()
class SupportRequest {
  final String name;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String email;
  final String message;

  SupportRequest(this.name, this.phoneNumber, this.email, this.message);

  factory SupportRequest.fromJson(Map<String, dynamic> json) =>
      _$SupportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SupportRequestToJson(this);
}
