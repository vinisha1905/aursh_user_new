import 'package:json_annotation/json_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel {
  @JsonKey(name: 'display_name')
  final String displayName;
  @JsonKey(name: 'consultation_fee')
  final double consultationFee;
  final bool internal;
  final String expertise;
  final String qualification;
  @JsonKey(name: 'display_image')
  final String displayImage;
  final String id;
  final int experience;
  @JsonKey(name: 'is_online')
  final bool isOnline;


  DoctorModel(
      this.displayName,
      this.consultationFee,
      this.internal,
      this.expertise,
      this.qualification,
      this.displayImage,
      this.id,
      this.experience,
      this.isOnline);

  factory DoctorModel.fromJson(Map<String, dynamic> json) => _$DoctorModelFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}