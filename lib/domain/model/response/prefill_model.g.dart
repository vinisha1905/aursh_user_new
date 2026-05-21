// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrefillModel _$PrefillModelFromJson(Map<String, dynamic> json) => PrefillModel(
      json['name'],
      json['email'],
      json['contact'] as String,
    );

Map<String, dynamic> _$PrefillModelToJson(PrefillModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'contact': instance.contact,
    };
