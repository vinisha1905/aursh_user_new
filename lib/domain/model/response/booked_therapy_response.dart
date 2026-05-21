import 'package:ayursh/domain/model/response/booked_user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booked_therapy_response.g.dart';

@JsonSerializable()
class BookedTherapyResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final List<BookedUserModel>? bookedUserModels;

  BookedTherapyResponse(
      this.success, this.errorCode, this.message, this.bookedUserModels);

  factory BookedTherapyResponse.fromJson(Map<String, dynamic> json) =>
      _$BookedTherapyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookedTherapyResponseToJson(this);
}
