// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorDetailResponse _$DoctorDetailResponseFromJson(
        Map<String, dynamic> json) =>
    DoctorDetailResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      DoctorDetailModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorDetailResponseToJson(
        DoctorDetailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.doctorDetail,
    };
