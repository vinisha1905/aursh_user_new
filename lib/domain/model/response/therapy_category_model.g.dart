// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyCategoryModel _$TherapyCategoryModelFromJson(
        Map<String, dynamic> json) =>
    TherapyCategoryModel(
      json['name'] as String,
      json['title'] as String,
      json['category_id'] as String,
      json['image_url'] as String,
    );

Map<String, dynamic> _$TherapyCategoryModelToJson(
        TherapyCategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'category_id': instance.categoryId,
      'image_url': instance.imageUrl,
    };
