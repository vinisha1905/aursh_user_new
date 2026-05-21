// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_consultation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorConsultationResponse _$DoctorConsultationResponseFromJson(
        Map<String, dynamic> json) =>
    DoctorConsultationResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : DoctorConsultationModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorConsultationResponseToJson(
        DoctorConsultationResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.doctorConsultationModel,
    };
