// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReviewModel _$UserReviewModelFromJson(Map<String, dynamic> json) =>
    UserReviewModel(
      json['user_name'] as String,
      json['user_review'] as String,
      json['user_image_url'] as String,
    );

Map<String, dynamic> _$UserReviewModelToJson(UserReviewModel instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'user_review': instance.userReview,
      'user_image_url': instance.userImageUrl,
    };
