// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutUsResponse _$AboutUsResponseFromJson(Map<String, dynamic> json) =>
    AboutUsResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => AboutUsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AboutUsResponseToJson(AboutUsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.aboutUsModels,
    };
