// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_and_conditions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsAndConditionsResponse _$TermsAndConditionsResponseFromJson(
        Map<String, dynamic> json) =>
    TermsAndConditionsResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      (json['data'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TermsAndConditionsResponseToJson(
        TermsAndConditionsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.contents,
    };
