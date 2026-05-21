import 'package:json_annotation/json_annotation.dart';

part 'answer_request.g.dart';

@JsonSerializable()
class AnswerRequest {
  @JsonKey(name: 'user_response')
  final List<int> answerIds;


  AnswerRequest(this.answerIds);

  factory AnswerRequest.fromJson(Map<String, dynamic> json) => _$AnswerRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerRequestToJson(this);
}