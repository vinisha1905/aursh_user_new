// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetailResponse _$CategoryDetailResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryDetailResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      (json['data'] as List<dynamic>)
          .map((e) => CategoryDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryDetailResponseToJson(
        CategoryDetailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.categories,
    };
