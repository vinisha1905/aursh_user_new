// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_validation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpValidationRequest _$OtpValidationRequestFromJson(
        Map<String, dynamic> json) =>
    OtpValidationRequest(
      phoneNumber: json['phone_number'] as String,
      userId: json['user_id'] as String,
      smsToken: json['sms_token'] as String,
      smsTokenSessionId: json['sms_token_session_id'] as String,
    );

Map<String, dynamic> _$OtpValidationRequestToJson(
        OtpValidationRequest instance) =>
    <String, dynamic>{
      'sms_token_session_id': instance.smsTokenSessionId,
      'user_id': instance.userId,
      'phone_number': instance.phoneNumber,
      'sms_token': instance.smsToken,
    };
