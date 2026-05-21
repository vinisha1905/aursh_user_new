import 'package:ayursh/domain/model/response/question_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_get_model.g.dart';

@JsonSerializable()
class QuestionGetModel {
  final String headline;
  final List<QuestionModel> questions;

  QuestionGetModel(this.headline, this.questions);

  factory QuestionGetModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionGetModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionGetModelToJson(this);
}
