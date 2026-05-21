import 'package:ayursh/domain/model/response/result_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer_response.g.dart';

@JsonSerializable()
class AnswerResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String errorCode;
  final String message;
  @JsonKey(name: 'data')
  final ResultModel? resultModel;

  AnswerResponse(
      this.success, this.errorCode, this.message, this.resultModel);

  factory AnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$AnswerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerResponseToJson(this);
}
