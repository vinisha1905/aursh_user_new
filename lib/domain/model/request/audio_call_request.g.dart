// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_call_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioCallRequest _$AudioCallRequestFromJson(Map<String, dynamic> json) =>
    AudioCallRequest(
      json['to'] as String,
      AudioCallRequestData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AudioCallRequestToJson(AudioCallRequest instance) =>
    <String, dynamic>{
      'to': instance.doctorToken,
      'data': instance.data,
    };
