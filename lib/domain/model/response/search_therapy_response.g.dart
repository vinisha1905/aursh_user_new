// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_therapy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchTherapyResponse _$SearchTherapyResponseFromJson(
        Map<String, dynamic> json) =>
    SearchTherapyResponse(
      json['success'] as bool,
      json['error_code'] as String,
      json['message'] as String,
      (json['data'] as List<dynamic>?)
          ?.map((e) => TherapyShortModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchTherapyResponseToJson(
        SearchTherapyResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.therapies,
    };
