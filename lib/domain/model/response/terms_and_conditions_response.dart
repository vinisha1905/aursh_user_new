import 'package:json_annotation/json_annotation.dart';

part 'terms_and_conditions_response.g.dart';

@JsonSerializable()
class TermsAndConditionsResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final List<String> contents;

  TermsAndConditionsResponse(
      this.success, this.errorCode, this.message, this.contents);

  factory TermsAndConditionsResponse.fromJson(Map<String, dynamic> json) =>
      _$TermsAndConditionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TermsAndConditionsResponseToJson(this);
}
