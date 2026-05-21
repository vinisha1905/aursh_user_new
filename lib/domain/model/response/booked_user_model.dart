import 'package:ayursh/domain/model/response/booked_therapy_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booked_user_model.g.dart';

@JsonSerializable()
class BookedUserModel {
  @JsonKey(name: 'is_non_consultation_booking')
  final bool? isNonConsultationBooking;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'therapy_bookings')
  final List<BookedTherapyModel> bookedTherapyModels;
  @JsonKey(name: 'non_consultation_therapy_booking_id')
  final String? nonConsultationTherapyBookingId;
  @JsonKey(name: 'consultation_booking_id')
  final String? consultationBookingId;
  @JsonKey(name: 'doctor_booking_id')
  final String? doctorBookingId;

  BookedUserModel(
      this.isNonConsultationBooking,
      this.userId,
      this.bookedTherapyModels,
      this.nonConsultationTherapyBookingId,
      this.consultationBookingId,
      this.doctorBookingId);

  factory BookedUserModel.fromJson(Map<String, dynamic> json) =>
      _$BookedUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookedUserModelToJson(this);
}
