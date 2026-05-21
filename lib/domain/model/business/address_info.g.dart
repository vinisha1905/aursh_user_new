// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressInfo _$AddressInfoFromJson(Map<String, dynamic> json) => AddressInfo(
      json['flatNoBuilding'] as String,
      json['localityArea'] as String,
      json['landMark'] as String,
      json['city'] as String,
    );

Map<String, dynamic> _$AddressInfoToJson(AddressInfo instance) =>
    <String, dynamic>{
      'flatNoBuilding': instance.flatNoBuilding,
      'localityArea': instance.localityArea,
      'landMark': instance.landMark,
      'city': instance.city,
    };
