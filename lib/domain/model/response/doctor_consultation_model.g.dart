// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_consultation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorConsultationModel _$DoctorConsultationModelFromJson(
        Map<String, dynamic> json) =>
    DoctorConsultationModel(
      (json['consultation_bookings'] as List<dynamic>)
          .map((e) =>
              InternalConsultationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorConsultationModelToJson(
        DoctorConsultationModel instance) =>
    <String, dynamic>{
      'consultation_bookings': instance.internalConsultationBookings,
    };
