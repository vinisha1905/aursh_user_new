// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_us_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateUsRequest _$RateUsRequestFromJson(Map<String, dynamic> json) =>
    RateUsRequest(
      (json['therapy_rating_count'] as num?)?.toInt(),
      json['therapy_rating_description'] as String?,
      (json['therapist_rating_count'] as num?)?.toInt(),
      json['therapist_rating_description'] as String?,
    );

Map<String, dynamic> _$RateUsRequestToJson(RateUsRequest instance) =>
    <String, dynamic>{
      'therapy_rating_count': instance.therapyRatingCount,
      'therapy_rating_description': instance.therapyRatingDescription,
      'therapist_rating_count': instance.therapistRatingCount,
      'therapist_rating_description': instance.therapistRatingDescription,
    };
