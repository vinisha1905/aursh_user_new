import 'package:ayursh/domain/model/response/booked_add_on_therapy.dart';
import 'package:ayursh/domain/model/response/session_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booked_therapy_model.g.dart';

@JsonSerializable()
class BookedTherapyModel {
  @JsonKey(name: 'therapy_title')
  final String therapyTitle;
  @JsonKey(name: 'total_sessions')
  final int totalSessions;
  @JsonKey(name: 'session_duration_in_min')
  final int sessionDurationInMin;
  @JsonKey(name: 'amount_payable')
  final dynamic amountPayable;
  @JsonKey(name: 'membership_discount')
  final double membershipDiscount;
  @JsonKey(name: 'total_amount')
  final dynamic totalAmount;
  @JsonKey(name: 'address_flat_no_building')
  final String addressFlatNoBuilding;
  @JsonKey(name: 'address_area_locality')
  final String addressAreaLocality;
  @JsonKey(name: 'address_landmark')
  final String addressLandmark;
  @JsonKey(name: 'address_city')
  final String addressCity;
  @JsonKey(name: 'patient_name')
  final String patientName;
  @JsonKey(name: 'patient_age')
  final String patientAge;
  @JsonKey(name: 'patient_gender')
  final String patientGender;
  final List<SessionModel> sessions;
  @JsonKey(name: 'therapy_headline')
  final String therapyHeadline;
  @JsonKey(name: 'booked_on_ts')
  final int bookedOnTs;
  @JsonKey(name: 'therapy_status')
  final String therapyStatus;
  @JsonKey(name: 'invoice_url')
  final String? invoiceUrl;
  @JsonKey(name: 'therapy_messages')
  final List<String> therapyMessages;
  @JsonKey(name: 'recent_session')
  final int recentSession;
  @JsonKey(name: 'can_book_next')
  final bool canBookNext;
  @JsonKey(name: 'can_provide_feedback')
  final bool canProvideFeedback;
  @JsonKey(name: 'display_image')
  final String displayImage;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @JsonKey(name: 'add_on_therapies')
  final List<BookedAddOnTherapy?>? addOnTherapies;
  @JsonKey(name: 'can_therapist_be_called')
  final bool canTherapistBeCalled;

  BookedTherapyModel(
      this.therapyTitle,
      this.totalSessions,
      this.sessionDurationInMin,
      this.amountPayable,
      this.membershipDiscount,
      this.totalAmount,
      this.addressFlatNoBuilding,
      this.addressAreaLocality,
      this.addressLandmark,
      this.addressCity,
      this.patientName,
      this.patientAge,
      this.patientGender,
      this.sessions,
      this.therapyHeadline,
      this.bookedOnTs,
      this.therapyStatus,
      this.invoiceUrl,
      this.therapyMessages,
      this.recentSession,
      this.canBookNext,
      this.canProvideFeedback,
      this.displayImage,
      this.addOnTherapies,
      this.imageUrl,
      this.canTherapistBeCalled);

  factory BookedTherapyModel.fromJson(Map<String, dynamic> json) =>
      _$BookedTherapyModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookedTherapyModelToJson(this);
}
