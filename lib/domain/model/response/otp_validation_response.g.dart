// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_validation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpValidationResponse _$OtpValidationResponseFromJson(
        Map<String, dynamic> json) =>
    OtpValidationResponse(
      json['success'] as bool,
      json['error_code'] as String,
      json['message'] as String,
      json['data'] == null
          ? null
          : OtpValidationModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtpValidationResponseToJson(
        OtpValidationResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.otpValidationModel,
    };
