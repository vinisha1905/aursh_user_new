// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_cancellation_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultationCancellationInfoResponse
    _$ConsultationCancellationInfoResponseFromJson(Map<String, dynamic> json) =>
        ConsultationCancellationInfoResponse(
          json['success'] as bool,
          json['error_code'] as String?,
          json['message'] as String?,
          ConsultationCancellationInfoModel.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ConsultationCancellationInfoResponseToJson(
        ConsultationCancellationInfoResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.cancellationInfo,
    };
