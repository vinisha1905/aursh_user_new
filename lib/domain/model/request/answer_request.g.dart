// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerRequest _$AnswerRequestFromJson(Map<String, dynamic> json) =>
    AnswerRequest(
      (json['user_response'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$AnswerRequestToJson(AnswerRequest instance) =>
    <String, dynamic>{
      'user_response': instance.answerIds,
    };
