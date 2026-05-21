import 'package:json_annotation/json_annotation.dart';

part 'booking_user_model.g.dart';

@JsonSerializable()
class BookingUserModel {
  @JsonKey(name: 'booking_for_name')
  final String bookingForName;
  @JsonKey(name: 'booking_for_gender')
  final String bookingForGender;
  @JsonKey(name: 'booking_for_age')
  final String bookingForAge;

  BookingUserModel(
      this.bookingForName, this.bookingForGender, this.bookingForAge);

  factory BookingUserModel.fromJson(Map<String, dynamic> json) =>
      _$BookingUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingUserModelToJson(this);
}
