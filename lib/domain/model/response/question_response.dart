import 'package:ayursh/domain/model/response/question_get_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_response.g.dart';

@JsonSerializable()
class QuestionResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String errorCode;
  final String message;
  @JsonKey(name: 'data')
  final QuestionGetModel? questionGetModel;

  QuestionResponse(
      this.success, this.errorCode, this.message, this.questionGetModel);

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);
}
