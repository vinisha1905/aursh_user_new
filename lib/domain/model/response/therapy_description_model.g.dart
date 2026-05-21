// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_description_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyDescriptionModel _$TherapyDescriptionModelFromJson(
        Map<String, dynamic> json) =>
    TherapyDescriptionModel(
      (json['descriptions'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TherapyDescriptionModelToJson(
        TherapyDescriptionModel instance) =>
    <String, dynamic>{
      'descriptions': instance.descriptions,
    };
