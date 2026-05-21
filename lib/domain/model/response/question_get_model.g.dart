// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_get_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionGetModel _$QuestionGetModelFromJson(Map<String, dynamic> json) =>
    QuestionGetModel(
      json['headline'] as String,
      (json['questions'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionGetModelToJson(QuestionGetModel instance) =>
    <String, dynamic>{
      'headline': instance.headline,
      'questions': instance.questions,
    };
