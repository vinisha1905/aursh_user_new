// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpTokenModel _$OtpTokenModelFromJson(Map<String, dynamic> json) =>
    OtpTokenModel(
      json['sms_token_session_id'] as String,
      json['user_id'] as String,
    );

Map<String, dynamic> _$OtpTokenModelToJson(OtpTokenModel instance) =>
    <String, dynamic>{
      'sms_token_session_id': instance.smsTokenSessionId,
      'user_id': instance.userId,
    };
