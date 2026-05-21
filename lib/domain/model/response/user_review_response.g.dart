// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReviewResponse _$UserReviewResponseFromJson(Map<String, dynamic> json) =>
    UserReviewResponse(
      json['success'] as bool,
      json['error_code'] as String,
      json['message'] as String,
      (json['data'] as List<dynamic>?)
          ?.map((e) => UserReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserReviewResponseToJson(UserReviewResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.reviews,
    };
