// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentSlotModel _$AppointmentSlotModelFromJson(
        Map<String, dynamic> json) =>
    AppointmentSlotModel(
      json['day'] as String,
      json['date'] as String,
      DaySlotModel.fromJson(json['time_slots'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentSlotModelToJson(
        AppointmentSlotModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'date': instance.date,
      'time_slots': instance.daySlotModel,
    };
