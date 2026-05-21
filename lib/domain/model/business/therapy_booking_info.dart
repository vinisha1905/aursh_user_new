import 'package:ayursh/application/therapy_detail/therapy_detail_bloc.dart';
import 'package:ayursh/domain/model/business/session_selected_info.dart';
import 'package:ayursh/domain/model/response/add_on_therapy_post.dart';
import 'package:ayursh/domain/model/response/booking_user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../response/clinic_finder.dart';

part 'therapy_booking_info.g.dart';

@JsonSerializable()
class TherapyBookingInfo {
  final SessionSelectedInfo sessionSelectedInfo;
  final double totalAmount;

  final double totalAmountOfSessions;
  final double serviceCharge;
  final double travelExpense;
  final String therapyHeadline;
  final String therapyTitle;
  final String therapyImage;
  final String? servicesOffered;
  final String categoryTitle;
  final String? doctorBookingId;
  final String? consultationBookingId;
  final BookingUserModel? bookingUserModel;
  final String? checkoutDescription;
  final String? selectedAddress;
  final List<AddOnTherapyPost> addOnTherapies;
  final ClinicFinderResponse? finderResponse;
  final String? serviceType;
  final String? therapyDuration;
  final ServiceType? serviceTypeEnum;
  final ServicePart? servicePart;

  TherapyBookingInfo copyWithBookingUser(BookingUserModel bookingUserModel) {
    return TherapyBookingInfo(
        sessionSelectedInfo,
        totalAmount,
        totalAmountOfSessions,
        serviceCharge,
        travelExpense,
        therapyHeadline,
        therapyTitle,
        therapyImage,
        categoryTitle,
        servicesOffered,
        doctorBookingId,
        consultationBookingId,
        bookingUserModel,
        checkoutDescription,
        selectedAddress,
        addOnTherapies,
        finderResponse,
        serviceType,
        therapyDuration,
        serviceTypeEnum,
        servicePart);
  }

  TherapyBookingInfo(
      this.sessionSelectedInfo,
      this.totalAmount,
      this.totalAmountOfSessions,
      this.serviceCharge,
      this.travelExpense,
      this.therapyHeadline,
      this.therapyTitle,
      this.therapyImage,
      this.categoryTitle,
      this.servicesOffered,
      this.doctorBookingId,
      this.consultationBookingId,
      this.bookingUserModel,
      this.checkoutDescription,
      this.selectedAddress,
      this.addOnTherapies,
      this.finderResponse,
      this.serviceType,
      this.therapyDuration,
      this.serviceTypeEnum,
      this.servicePart);

  TherapyBookingInfo copyWithAddOnTherapies(List<AddOnTherapyPost> therapies, double newTotal, double newTotalAmountSessions) {
    return TherapyBookingInfo(
        sessionSelectedInfo,
        newTotal,
        newTotalAmountSessions,
        serviceCharge,
        travelExpense,
        therapyHeadline,
        therapyTitle,
        therapyImage,
        categoryTitle,
        servicesOffered,
        doctorBookingId,
        consultationBookingId,
        bookingUserModel,
        checkoutDescription,
        selectedAddress,
        therapies,
        finderResponse,
        serviceType,
        therapyDuration,
        serviceTypeEnum,
        servicePart);
  }

  factory TherapyBookingInfo.fromJson(Map<String, dynamic> json) => _$TherapyBookingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TherapyBookingInfoToJson(this);
}
