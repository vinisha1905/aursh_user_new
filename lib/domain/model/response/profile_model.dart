import 'package:ayursh/domain/model/response/booking_profile_model.dart';
import 'package:ayursh/domain/model/response/location_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  final dynamic name;
  final dynamic email;
  @JsonKey(name: 'phone_number')
  final dynamic phoneNumber;
  @JsonKey(name: 'fcm_token')
  final dynamic fcmToken;
  final LocationModel location;
  @JsonKey(name: 'booking_profiles')
  final List<BookingProfileModel>? bookingProfiles;


  ProfileModel(this.name, this.email, this.phoneNumber, this.fcmToken,
      this.location, this.bookingProfiles);

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
