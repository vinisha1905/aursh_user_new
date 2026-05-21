// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingUserResponse _$BookingUserResponseFromJson(Map<String, dynamic> json) =>
    BookingUserResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => BookingUserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookingUserResponseToJson(
        BookingUserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.bookingUsers,
    };
