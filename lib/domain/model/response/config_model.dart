import 'package:json_annotation/json_annotation.dart';

part 'config_model.g.dart';

@JsonSerializable()
class ConfigModel {
  final bool maintenance;
  @JsonKey(name: 'can_therapy_be_booked')
  final bool canTherapyBeBooked;
  @JsonKey(name: 'is_consultation_required_for_abhyanga')
  final bool isConsultationRequiredForAbhyanga;
  @JsonKey(name: 'is_consultation_required_for_postnatal')
  final bool isConsultationRequiredForPostnatal;
  @JsonKey(name: 'is_consultation_required_for_rejuvenation')
  final bool isConsultationRequiredForRejuvenation;
  @JsonKey(name: 'is_consultation_required_for_skinhair')
  final bool isConsultationRequiredForSkinhair;
  @JsonKey(name: 'is_consultation_required_for_elderlycare')
  final bool isConsultationRequiredElderlyCare;
  @JsonKey(name: 'is_consultation_required_for_musclejoint')
  final bool isConsultationRequiredForMuscleJoint;
  @JsonKey(name: 'is_consultation_required_for_weightmgmt')
  final bool isConsultationRequiredForWeightManagement;

  ConfigModel(
      this.maintenance,
      this.canTherapyBeBooked,
      this.isConsultationRequiredForAbhyanga,
      this.isConsultationRequiredForPostnatal,
      this.isConsultationRequiredForRejuvenation,
      this.isConsultationRequiredForSkinhair,
      this.isConsultationRequiredElderlyCare,
      this.isConsultationRequiredForMuscleJoint,
      this.isConsultationRequiredForWeightManagement);

  factory ConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigModelToJson(this);
}
