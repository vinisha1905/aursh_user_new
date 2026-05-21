// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingProfileModel _$BookingProfileModelFromJson(Map<String, dynamic> json) =>
    BookingProfileModel(
      json['booking_for_name'] as String,
      json['booking_for_gender'] as String,
      json['booking_for_age'] as String,
    );

Map<String, dynamic> _$BookingProfileModelToJson(
        BookingProfileModel instance) =>
    <String, dynamic>{
      'booking_for_name': instance.bookingForName,
      'booking_for_gender': instance.bookingForGender,
      'booking_for_age': instance.bookingForAge,
    };
