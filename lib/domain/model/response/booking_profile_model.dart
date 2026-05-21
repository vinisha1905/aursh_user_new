import 'package:json_annotation/json_annotation.dart';

part 'booking_profile_model.g.dart';

@JsonSerializable()
class BookingProfileModel {
  @JsonKey(name: 'booking_for_name')
  final String bookingForName;
  @JsonKey(name: 'booking_for_gender')
  final String bookingForGender;
  @JsonKey(name: 'booking_for_age')
  final String bookingForAge;

  BookingProfileModel(
      this.bookingForName, this.bookingForGender, this.bookingForAge);

  factory BookingProfileModel.fromJson(Map<String, dynamic> json) =>
      _$BookingProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingProfileModelToJson(this);
}
