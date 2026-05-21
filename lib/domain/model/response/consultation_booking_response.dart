import 'package:ayursh/domain/model/response/consultation_booking_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consultation_booking_response.g.dart';

@JsonSerializable()
class ConsultationBookingResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final ConsultationBookingModel consultationBookingModel;

  ConsultationBookingResponse(this.success, this.errorCode, this.message,
      this.consultationBookingModel);

  factory ConsultationBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$ConsultationBookingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationBookingResponseToJson(this);
}
