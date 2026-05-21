// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_on_therapy_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOnTherapyPost _$AddOnTherapyPostFromJson(Map<String, dynamic> json) =>
    AddOnTherapyPost(
      (json['amount_payable'] as num).toDouble(),
      (json['session_duration_in_min'] as num).toInt(),
      (json['session_no'] as num).toInt(),
      json['therapy_title'] as String,
      (json['total_sessions'] as num).toInt(),
      json['imageUrl'] as String,
      json['name'] as String,
      $enumDecodeNullable(_$ServiceTypeEnumMap, json['serviceType']),
      $enumDecodeNullable(_$ServicePartEnumMap, json['servicePart']),
    );

Map<String, dynamic> _$AddOnTherapyPostToJson(AddOnTherapyPost instance) =>
    <String, dynamic>{
      'therapy_title': instance.therapyTitle,
      'total_sessions': instance.totalSessions,
      'session_no': instance.sessionNo,
      'amount_payable': instance.amountPayable,
      'session_duration_in_min': instance.sessionDurationInMin,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'serviceType': _$ServiceTypeEnumMap[instance.serviceType],
      'servicePart': _$ServicePartEnumMap[instance.servicePart],
    };

const _$ServiceTypeEnumMap = {
  ServiceType.Full: 'Full',
  ServiceType.Part: 'Part',
  ServiceType.Baby: 'Baby',
  ServiceType.Massage: 'Massage',
  ServiceType.Other: 'Other',
};

const _$ServicePartEnumMap = {
  ServicePart.None: 'None',
  ServicePart.Body: 'Body',
  ServicePart.Knee: 'Knee',
  ServicePart.Baby: 'Baby',
  ServicePart.Massage: 'Massage',
  ServicePart.Other: 'Other',
};
