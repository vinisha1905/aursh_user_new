// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_therapy_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookTherapyTimeModel _$BookTherapyTimeModelFromJson(
        Map<String, dynamic> json) =>
    BookTherapyTimeModel(
      dateSlots: (json['appointment_slots'] as List<dynamic>)
          .map((e) =>
              BookTherapyDateSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      singleSessionTerms:
          (json['user_acceptance_terms_single_session'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      multiSessionTerms:
          (json['user_acceptance_terms_multi_sessions'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$BookTherapyTimeModelToJson(
        BookTherapyTimeModel instance) =>
    <String, dynamic>{
      'appointment_slots': instance.dateSlots,
      'user_acceptance_terms_single_session': instance.singleSessionTerms,
      'user_acceptance_terms_multi_sessions': instance.multiSessionTerms,
    };
