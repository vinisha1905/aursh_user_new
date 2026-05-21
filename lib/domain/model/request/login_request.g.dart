// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      phoneNumber: json['phone_number'] as String,
      isWebLogin: json['is_web_login'] as bool? ?? false,
      loginMethod: json['login_method'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'is_web_login': instance.isWebLogin,
      'login_method': instance.loginMethod,
    };
