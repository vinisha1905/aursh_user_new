// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigModel _$ConfigModelFromJson(Map<String, dynamic> json) => ConfigModel(
      json['maintenance'] as bool,
      json['can_therapy_be_booked'] as bool,
      json['is_consultation_required_for_abhyanga'] as bool,
      json['is_consultation_required_for_postnatal'] as bool,
      json['is_consultation_required_for_rejuvenation'] as bool,
      json['is_consultation_required_for_skinhair'] as bool,
      json['is_consultation_required_for_elderlycare'] as bool,
      json['is_consultation_required_for_musclejoint'] as bool,
      json['is_consultation_required_for_weightmgmt'] as bool,
    );

Map<String, dynamic> _$ConfigModelToJson(ConfigModel instance) =>
    <String, dynamic>{
      'maintenance': instance.maintenance,
      'can_therapy_be_booked': instance.canTherapyBeBooked,
      'is_consultation_required_for_abhyanga':
          instance.isConsultationRequiredForAbhyanga,
      'is_consultation_required_for_postnatal':
          instance.isConsultationRequiredForPostnatal,
      'is_consultation_required_for_rejuvenation':
          instance.isConsultationRequiredForRejuvenation,
      'is_consultation_required_for_skinhair':
          instance.isConsultationRequiredForSkinhair,
      'is_consultation_required_for_elderlycare':
          instance.isConsultationRequiredElderlyCare,
      'is_consultation_required_for_musclejoint':
          instance.isConsultationRequiredForMuscleJoint,
      'is_consultation_required_for_weightmgmt':
          instance.isConsultationRequiredForWeightManagement,
    };
