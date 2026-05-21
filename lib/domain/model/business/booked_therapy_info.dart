import 'package:ayursh/domain/model/response/booked_therapy_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booked_therapy_info.g.dart';

//Mapping therapy booking user to booked therapy info and display to list booked therapy, because single user may have several booked therapy
@JsonSerializable()
class BookedTherapyInfo {
  @JsonKey(name: 'is_non_consultation_booking')
  final bool? isNonConsultationBooking;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'therapy_bookings')
  final BookedTherapyModel bookedTherapyModel;
  @JsonKey(name: 'non_consultation_therapy_booking_id')
  final String? nonConsultationTherapyBookingId;
  @JsonKey(name: 'consultation_booking_id')
  final String? consultationBookingId;
  @JsonKey(name: 'doctor_booking_id')
  final String? doctorBookingId;

  BookedTherapyInfo(
      this.isNonConsultationBooking,
      this.userId,
      this.bookedTherapyModel,
      this.nonConsultationTherapyBookingId,
      this.consultationBookingId,
      this.doctorBookingId);

  factory BookedTherapyInfo.fromJson(Map<String, dynamic> json) =>
      _$BookedTherapyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BookedTherapyInfoToJson(this);
}
