// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finder_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinderBody _$FinderBodyFromJson(Map<String, dynamic> json) => FinderBody(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      servicesOffered: (json['services_offered'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      therapySelections: (json['therapy_selections'] as List<dynamic>?)
          ?.map((e) => TherapySelections.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FinderBodyToJson(FinderBody instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'services_offered': instance.servicesOffered,
      'therapy_selections': instance.therapySelections,
    };

TherapySelections _$TherapySelectionsFromJson(Map<String, dynamic> json) =>
    TherapySelections(
      therapyTitle: json['therapy_title'] as String?,
      categoryTitle: json['category_title'] as String?,
      noOfSessions: (json['no_of_sessions'] as num?)?.toInt(),
      therapyType: json['therapy_type'] as String?,
      therapyDuration: json['therapy_duration'] as String?,
      servicesOffered: json['services_offered'] as String?,
    );

Map<String, dynamic> _$TherapySelectionsToJson(TherapySelections instance) =>
    <String, dynamic>{
      'therapy_title': instance.therapyTitle,
      'category_title': instance.categoryTitle,
      'no_of_sessions': instance.noOfSessions,
      'therapy_type': instance.therapyType,
      'therapy_duration': instance.therapyDuration,
      'services_offered': instance.servicesOffered,
    };
