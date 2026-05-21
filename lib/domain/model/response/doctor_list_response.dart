import 'package:ayursh/domain/model/response/doctor_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_list_response.g.dart';

@JsonSerializable()
class DoctorListResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final List<DoctorModel>? doctors;


  DoctorListResponse(this.success, this.errorCode, this.message, this.doctors);

  factory DoctorListResponse.fromJson(Map<String, dynamic> json) => _$DoctorListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorListResponseToJson(this);
}