// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerResponse _$AnswerResponseFromJson(Map<String, dynamic> json) =>
    AnswerResponse(
      json['success'] as bool,
      json['error_code'] as String,
      json['message'] as String,
      json['data'] == null
          ? null
          : ResultModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnswerResponseToJson(AnswerResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.resultModel,
    };
