import 'package:ayursh/domain/model/response/config_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_response.g.dart';

@JsonSerializable()
class ConfigResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final ConfigModel? configModel;

  ConfigResponse(this.success, this.errorCode, this.message, this.configModel);

  factory ConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigResponseToJson(this);
}
