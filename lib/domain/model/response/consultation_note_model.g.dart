// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultationNoteModel _$ConsultationNoteModelFromJson(
        Map<String, dynamic> json) =>
    ConsultationNoteModel(
      json['payment_for'] as String,
      json['consultation_booking_id'] as String,
    );

Map<String, dynamic> _$ConsultationNoteModelToJson(
        ConsultationNoteModel instance) =>
    <String, dynamic>{
      'payment_for': instance.paymentFor,
      'consultation_booking_id': instance.consultationBookingId,
    };
