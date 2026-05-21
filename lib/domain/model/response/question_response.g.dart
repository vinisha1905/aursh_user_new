// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResponse _$QuestionResponseFromJson(Map<String, dynamic> json) =>
    QuestionResponse(
      json['success'] as bool,
      json['error_code'] as String,
      json['message'] as String,
      json['data'] == null
          ? null
          : QuestionGetModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionResponseToJson(QuestionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.questionGetModel,
    };
