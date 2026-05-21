// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetailModel _$CategoryDetailModelFromJson(Map<String, dynamic> json) =>
    CategoryDetailModel(
      json['name'] as String,
      json['title'] as String,
      (json['descriptions'] as List<dynamic>).map((e) => e as String).toList(),
      (json['faq'] as List<dynamic>)
          .map((e) => FaqModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['therapies'] as List<dynamic>)
          .map((e) => TherapyShortModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['category_id'] as String,
    );

Map<String, dynamic> _$CategoryDetailModelToJson(
        CategoryDetailModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'descriptions': instance.descriptions,
      'faq': instance.faq,
      'therapies': instance.therapies,
      'category_id': instance.categoryId,
    };
