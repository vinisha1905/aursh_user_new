// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_short_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyShortModel _$TherapyShortModelFromJson(Map<String, dynamic> json) =>
    TherapyShortModel(
      json['name'] as String,
      json['english_name'] as String?,
      json['title'] as String,
      (json['session_options'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      (json['session_pricing_options'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      (json['session_duration_in_min'] as num).toInt(),
      json['image_url'] as String,
      json['category_name'] as String?,
      json['category'] as String?,
      json['category_title'] as String?,
    );

Map<String, dynamic> _$TherapyShortModelToJson(TherapyShortModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'english_name': instance.englishName,
      'title': instance.title,
      'session_options': instance.sessionOptions,
      'session_pricing_options': instance.sessionPricingOptions,
      'session_duration_in_min': instance.sessionDurationInMin,
      'image_url': instance.imageUrl,
      'category_name': instance.categoryName,
      'category_title': instance.categoryTitle,
      'category': instance.category,
    };
