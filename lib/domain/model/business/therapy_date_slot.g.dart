// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_date_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyDateSlot _$TherapyDateSlotFromJson(Map<String, dynamic> json) =>
    TherapyDateSlot(
      json['day'] as String,
      json['date'] as String,
      (json['slots'] as List<dynamic>)
          .map((e) => BookingSlotInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TherapyDateSlotToJson(TherapyDateSlot instance) =>
    <String, dynamic>{
      'day': instance.day,
      'date': instance.date,
      'slots': instance.slots,
    };
