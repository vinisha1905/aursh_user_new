// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyDetailResponse _$TherapyDetailResponseFromJson(
        Map<String, dynamic> json) =>
    TherapyDetailResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      TherapyDetailModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TherapyDetailResponseToJson(
        TherapyDetailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.therapyDetail,
    };
