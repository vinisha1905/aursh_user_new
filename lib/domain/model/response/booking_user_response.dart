import 'package:ayursh/domain/model/response/booking_user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_user_response.g.dart';

@JsonSerializable()
class BookingUserResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final List<BookingUserModel>? bookingUsers;

  BookingUserResponse(
      this.success, this.errorCode, this.message, this.bookingUsers);

  factory BookingUserResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookingUserResponseToJson(this);
}
