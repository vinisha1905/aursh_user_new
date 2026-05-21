// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyNoteModel _$TherapyNoteModelFromJson(Map<String, dynamic> json) =>
    TherapyNoteModel(
      json['payment_for'] as String,
      json['therapy_booking_id'] as String,
    );

Map<String, dynamic> _$TherapyNoteModelToJson(TherapyNoteModel instance) =>
    <String, dynamic>{
      'payment_for': instance.paymentFor,
      'therapy_booking_id': instance.therapyBookingId,
    };
