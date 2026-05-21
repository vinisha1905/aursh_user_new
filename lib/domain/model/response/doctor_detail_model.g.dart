// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorDetailModel _$DoctorDetailModelFromJson(Map<String, dynamic> json) =>
    DoctorDetailModel(
      json['display_name'] as String,
      json['registration_number'],
      (json['consultation_fee'] as num).toDouble(),
      json['description'] as String?,
      json['expertise'] as String,
      json['qualification'] as String,
      json['display_image'] as String,
      json['id'] as String,
      (json['experience'] as num).toInt(),
      json['is_online'] as bool,
    );

Map<String, dynamic> _$DoctorDetailModelToJson(DoctorDetailModel instance) =>
    <String, dynamic>{
      'display_name': instance.displayName,
      'registration_number': instance.registrationNumber,
      'consultation_fee': instance.consultationFee,
      'description': instance.description,
      'expertise': instance.expertise,
      'qualification': instance.qualification,
      'display_image': instance.displayImage,
      'id': instance.id,
      'experience': instance.experience,
      'is_online': instance.isOnline,
    };
