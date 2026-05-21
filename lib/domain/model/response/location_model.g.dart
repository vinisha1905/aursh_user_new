// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      (json['latitude'] as num?)?.toDouble(),
      (json['longitude'] as num?)?.toDouble(),
      json['admin_area'] as String?,
      json['country_name'] as String?,
      json['country_code'] as String?,
      json['sub_admin_are'] as String?,
      json['thoroughfare'] as String?,
      json['sub_thoroughfare'] as String?,
      json['feature_name'] as String?,
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'admin_area': instance.adminArea,
      'country_name': instance.countryName,
      'country_code': instance.countryCode,
      'sub_admin_are': instance.subAdminAre,
      'thoroughfare': instance.thoroughfare,
      'sub_thoroughfare': instance.subThoroughfare,
      'feature_name': instance.featureName,
    };
