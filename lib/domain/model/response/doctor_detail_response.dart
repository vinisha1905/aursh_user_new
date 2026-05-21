import 'package:ayursh/domain/model/response/doctor_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_detail_response.g.dart';

@JsonSerializable()
class DoctorDetailResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final DoctorDetailModel doctorDetail;

  DoctorDetailResponse(
      this.success, this.errorCode, this.message, this.doctorDetail);

  factory DoctorDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDetailResponseToJson(this);
}
