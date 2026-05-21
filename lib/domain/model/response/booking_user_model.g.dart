// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingUserModel _$BookingUserModelFromJson(Map<String, dynamic> json) =>
    BookingUserModel(
      json['booking_for_name'] as String,
      json['booking_for_gender'] as String,
      json['booking_for_age'] as String,
    );

Map<String, dynamic> _$BookingUserModelToJson(BookingUserModel instance) =>
    <String, dynamic>{
      'booking_for_name': instance.bookingForName,
      'booking_for_gender': instance.bookingForGender,
      'booking_for_age': instance.bookingForAge,
    };
