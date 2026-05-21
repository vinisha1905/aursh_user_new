// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      phoneNumber: json['phone_number'] as String,
      userName: json['user_name'] as String,
      userEmail: json['user_email'] as String,
      isIOSRegistration: json['is_ios_registration'] as bool,
      pin: json['pin'] as String? ?? '1985',
      isWebRegistration: json['is_web_registration'] as bool? ?? false,
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'pin': instance.pin,
      'user_name': instance.userName,
      'user_email': instance.userEmail,
      'is_web_registration': instance.isWebRegistration,
      'is_ios_registration': instance.isIOSRegistration,
    };
