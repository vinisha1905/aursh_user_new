import 'package:ayursh/domain/model/response/blog_model.dart';
import 'package:ayursh/domain/model/response/book_appointment_model.dart';
import 'package:ayursh/domain/model/response/otp_token_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_appointment_response.g.dart';

@JsonSerializable()
class BookAppointmentResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final BookAppointmentModel bookAppointmentModel;


  BookAppointmentResponse(
      this.success, this.errorCode, this.message, this.bookAppointmentModel);

  factory BookAppointmentResponse.fromJson(Map<String, dynamic> json) => _$BookAppointmentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookAppointmentResponseToJson(this);
}