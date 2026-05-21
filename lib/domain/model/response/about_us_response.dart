import 'package:ayursh/domain/model/response/about_us_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'about_us_response.g.dart';

@JsonSerializable()
class AboutUsResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final List<AboutUsModel>? aboutUsModels;


  AboutUsResponse(
      this.success, this.errorCode, this.message, this.aboutUsModels);

  factory AboutUsResponse.fromJson(Map<String, dynamic> json) => _$AboutUsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AboutUsResponseToJson(this);
}