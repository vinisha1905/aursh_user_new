// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rtc_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RtcTokenResponse _$RtcTokenResponseFromJson(Map<String, dynamic> json) =>
    RtcTokenResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      json['data'] as String,
    );

Map<String, dynamic> _$RtcTokenResponseToJson(RtcTokenResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.token,
    };
