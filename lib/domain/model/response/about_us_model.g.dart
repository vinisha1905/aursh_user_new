// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutUsModel _$AboutUsModelFromJson(Map<String, dynamic> json) => AboutUsModel(
      json['title'] as String,
      json['thumbnail'] as String,
      json['video_url'] as String,
    );

Map<String, dynamic> _$AboutUsModelToJson(AboutUsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'video_url': instance.videoUrl,
    };
