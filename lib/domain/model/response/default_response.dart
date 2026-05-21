import 'package:ayursh/domain/model/response/blog_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'default_response.g.dart';

@JsonSerializable()
class DefaultResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final dynamic data;


  DefaultResponse(this.success, this.errorCode, this.message, this.data);

  factory DefaultResponse.fromJson(Map<String, dynamic> json) => _$DefaultResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DefaultResponseToJson(this);
}
