import 'package:json_annotation/json_annotation.dart';

part 'doctor_detail_model.g.dart';

@JsonSerializable()
class DoctorDetailModel {
  @JsonKey(name: 'display_name')
  final String displayName;
  @JsonKey(name: 'registration_number')
  final dynamic registrationNumber;
  @JsonKey(name: 'consultation_fee')
  final double consultationFee;
  final String? description;
  final String expertise;
  final String qualification;
  @JsonKey(name: 'display_image')
  final String displayImage;
  @JsonKey(name: 'id')
  final String id;
  final int experience;
  @JsonKey(name: 'is_online')
  final bool isOnline;



  DoctorDetailModel(
      this.displayName,
      this.registrationNumber,
      this.consultationFee,
      this.description,
      this.expertise,
      this.qualification,
      this.displayImage,
      this.id,
      this.experience,
      this.isOnline);

  factory DoctorDetailModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDetailModelToJson(this);
}
