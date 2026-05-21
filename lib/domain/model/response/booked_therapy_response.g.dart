// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booked_therapy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookedTherapyResponse _$BookedTherapyResponseFromJson(
        Map<String, dynamic> json) =>
    BookedTherapyResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => BookedUserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookedTherapyResponseToJson(
        BookedTherapyResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.bookedUserModels,
    };
