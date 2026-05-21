// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyCategoryResponse _$TherapyCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    TherapyCategoryResponse(
      json['success'] as bool,
      json['error_code'] as String,
      json['message'] as String,
      (json['data'] as List<dynamic>?)
          ?.map((e) => TherapyCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TherapyCategoryResponseToJson(
        TherapyCategoryResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.categories,
    };
