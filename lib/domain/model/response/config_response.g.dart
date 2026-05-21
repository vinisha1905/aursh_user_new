// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigResponse _$ConfigResponseFromJson(Map<String, dynamic> json) =>
    ConfigResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : ConfigModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigResponseToJson(ConfigResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.configModel,
    };
