import 'package:ayursh/domain/model/response/config_model.dart';
import 'package:ayursh/domain/model/response/doctor_consultation_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_consultation_response.g.dart';

@JsonSerializable()
class DoctorConsultationResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final DoctorConsultationModel? doctorConsultationModel;


  DoctorConsultationResponse(
      this.success, this.errorCode, this.message, this.doctorConsultationModel);

  factory DoctorConsultationResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorConsultationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorConsultationResponseToJson(this);
}
