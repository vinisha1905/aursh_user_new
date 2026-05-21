// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DaySlot _$DaySlotFromJson(Map<String, dynamic> json) => DaySlot(
      json['day'] as String,
      json['date'] as String,
      (json['morningSlots'] as List<dynamic>)
          .map((e) => BookingSlotInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['afternoonSlots'] as List<dynamic>)
          .map((e) => BookingSlotInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['eveningSlots'] as List<dynamic>)
          .map((e) => BookingSlotInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DaySlotToJson(DaySlot instance) => <String, dynamic>{
      'day': instance.day,
      'date': instance.date,
      'morningSlots': instance.morningSlots,
      'afternoonSlots': instance.afternoonSlots,
      'eveningSlots': instance.eveningSlots,
    };
