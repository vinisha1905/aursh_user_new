import 'package:json_annotation/json_annotation.dart';

part 'consultation_booking_model.g.dart';

@JsonSerializable()
class ConsultationBookingModel {
  @JsonKey(name: 'consultation_booking_id')
  final String consultationBookingId;

  ConsultationBookingModel(this.consultationBookingId);

  factory ConsultationBookingModel.fromJson(Map<String, dynamic> json) =>
      _$ConsultationBookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationBookingModelToJson(this);
}
