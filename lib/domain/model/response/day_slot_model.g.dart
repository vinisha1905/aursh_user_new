// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DaySlotModel _$DaySlotModelFromJson(Map<String, dynamic> json) => DaySlotModel(
      (json['Morning'] as List<dynamic>)
          .map((e) => TimeSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Afternoon'] as List<dynamic>)
          .map((e) => TimeSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Evening'] as List<dynamic>)
          .map((e) => TimeSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DaySlotModelToJson(DaySlotModel instance) =>
    <String, dynamic>{
      'Morning': instance.morningSlots,
      'Afternoon': instance.afternoonSlots,
      'Evening': instance.eveningSlots,
    };
