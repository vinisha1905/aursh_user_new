// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      json['name'],
      json['email'],
      json['phone_number'],
      json['fcm_token'],
      LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      (json['booking_profiles'] as List<dynamic>?)
          ?.map((e) => BookingProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'fcm_token': instance.fcmToken,
      'location': instance.location,
      'booking_profiles': instance.bookingProfiles,
    };
