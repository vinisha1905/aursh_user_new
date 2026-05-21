// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_selected_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionSelectedInfo _$SessionSelectedInfoFromJson(Map<String, dynamic> json) =>
    SessionSelectedInfo(
      json['totalSession'] as String?,
      json['pricePerSession'] as String?,
      (json['sessionDurationInMin'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SessionSelectedInfoToJson(
        SessionSelectedInfo instance) =>
    <String, dynamic>{
      'totalSession': instance.totalSession,
      'pricePerSession': instance.pricePerSession,
      'sessionDurationInMin': instance.sessionDurationInMin,
    };
