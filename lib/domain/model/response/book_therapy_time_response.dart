import 'package:ayursh/domain/model/response/book_therapy_time_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_therapy_time_response.g.dart';

@JsonSerializable()
class BookTherapyTimeResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final BookTherapyTimeModel bookTherapyTimeModel;


  BookTherapyTimeResponse(
      this.success, this.errorCode, this.message, this.bookTherapyTimeModel);

  factory BookTherapyTimeResponse.fromJson(Map<String, dynamic> json) => _$BookTherapyTimeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookTherapyTimeResponseToJson(this);
}