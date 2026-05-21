import 'package:ayursh/domain/model/response/internal_consultation_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_consultation_model.g.dart';

@JsonSerializable()
class DoctorConsultationModel {
  @JsonKey(name: 'consultation_bookings')
  final List<InternalConsultationModel> internalConsultationBookings;


  DoctorConsultationModel(this.internalConsultationBookings);

  factory DoctorConsultationModel.fromJson(Map<String, dynamic> json) => _$DoctorConsultationModelFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorConsultationModelToJson(this);
}