// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_validation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpValidationModel _$OtpValidationModelFromJson(Map<String, dynamic> json) =>
    OtpValidationModel(
      json['auth_token'] as String,
      (json['auth_token_expiry'] as num).toInt(),
    );

Map<String, dynamic> _$OtpValidationModelToJson(OtpValidationModel instance) =>
    <String, dynamic>{
      'auth_token': instance.authToken,
      'auth_token_expiry': instance.authTokenExpiry,
    };
