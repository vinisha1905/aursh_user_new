// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorListResponse _$DoctorListResponseFromJson(Map<String, dynamic> json) =>
    DoctorListResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorListResponseToJson(DoctorListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.doctors,
    };
