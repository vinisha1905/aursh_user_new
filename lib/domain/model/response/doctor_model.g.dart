// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      json['display_name'] as String,
      (json['consultation_fee'] as num).toDouble(),
      json['internal'] as bool,
      json['expertise'] as String,
      json['qualification'] as String,
      json['display_image'] as String,
      json['id'] as String,
      (json['experience'] as num).toInt(),
      json['is_online'] as bool,
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'display_name': instance.displayName,
      'consultation_fee': instance.consultationFee,
      'internal': instance.internal,
      'expertise': instance.expertise,
      'qualification': instance.qualification,
      'display_image': instance.displayImage,
      'id': instance.id,
      'experience': instance.experience,
      'is_online': instance.isOnline,
    };
