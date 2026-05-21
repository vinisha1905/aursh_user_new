// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_therapy_date_slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookTherapyDateSlotModel _$BookTherapyDateSlotModelFromJson(
        Map<String, dynamic> json) =>
    BookTherapyDateSlotModel(
      json['day'] as String,
      json['date'] as String,
      (json['time_slots'] as List<dynamic>)
          .map((e) =>
              BookTherapyTimeSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookTherapyDateSlotModelToJson(
        BookTherapyDateSlotModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'date': instance.date,
      'time_slots': instance.timeSlots,
    };
