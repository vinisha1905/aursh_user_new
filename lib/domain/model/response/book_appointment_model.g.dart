// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookAppointmentModel _$BookAppointmentModelFromJson(
        Map<String, dynamic> json) =>
    BookAppointmentModel(
      (json['appointment_slots'] as List<dynamic>)
          .map((e) => AppointmentSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookAppointmentModelToJson(
        BookAppointmentModel instance) =>
    <String, dynamic>{
      'appointment_slots': instance.appointmentSlots,
    };
