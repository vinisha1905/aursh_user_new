// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booked_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookedUserModel _$BookedUserModelFromJson(Map<String, dynamic> json) =>
    BookedUserModel(
      json['is_non_consultation_booking'] as bool?,
      json['user_id'] as String,
      (json['therapy_bookings'] as List<dynamic>)
          .map((e) => BookedTherapyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['non_consultation_therapy_booking_id'] as String?,
      json['consultation_booking_id'] as String?,
      json['doctor_booking_id'] as String?,
    );

Map<String, dynamic> _$BookedUserModelToJson(BookedUserModel instance) =>
    <String, dynamic>{
      'is_non_consultation_booking': instance.isNonConsultationBooking,
      'user_id': instance.userId,
      'therapy_bookings': instance.bookedTherapyModels,
      'non_consultation_therapy_booking_id':
          instance.nonConsultationTherapyBookingId,
      'consultation_booking_id': instance.consultationBookingId,
      'doctor_booking_id': instance.doctorBookingId,
    };
