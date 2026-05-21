// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_slot_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingSlotInfo _$BookingSlotInfoFromJson(Map<String, dynamic> json) =>
    BookingSlotInfo(
      json['day'] as String,
      json['date'] as String,
      json['time'] as String,
      json['available'] as bool,
    );

Map<String, dynamic> _$BookingSlotInfoToJson(BookingSlotInfo instance) =>
    <String, dynamic>{
      'day': instance.day,
      'date': instance.date,
      'time': instance.time,
      'available': instance.available,
    };
