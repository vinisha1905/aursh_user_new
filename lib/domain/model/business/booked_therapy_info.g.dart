// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booked_therapy_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookedTherapyInfo _$BookedTherapyInfoFromJson(Map<String, dynamic> json) =>
    BookedTherapyInfo(
      json['is_non_consultation_booking'] as bool?,
      json['user_id'] as String,
      BookedTherapyModel.fromJson(
          json['therapy_bookings'] as Map<String, dynamic>),
      json['non_consultation_therapy_booking_id'] as String?,
      json['consultation_booking_id'] as String?,
      json['doctor_booking_id'] as String?,
    );

Map<String, dynamic> _$BookedTherapyInfoToJson(BookedTherapyInfo instance) =>
    <String, dynamic>{
      'is_non_consultation_booking': instance.isNonConsultationBooking,
      'user_id': instance.userId,
      'therapy_bookings': instance.bookedTherapyModel,
      'non_consultation_therapy_booking_id':
          instance.nonConsultationTherapyBookingId,
      'consultation_booking_id': instance.consultationBookingId,
      'doctor_booking_id': instance.doctorBookingId,
    };
