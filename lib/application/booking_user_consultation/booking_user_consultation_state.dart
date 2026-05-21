part of 'booking_user_consultation_bloc.dart';

@freezed
class BookingUserConsultationState with _$BookingUserConsultationState {
  const factory BookingUserConsultationState(
      {required DoctorModel? doctorInfo,
      required BookingSlotInfo? bookingSlotInfo,
      required LoadingState loadingState,
      required BookingUserModel? selectedBookingUser,
      SessionSelectedInfo? sessionSelectedInfo,
      required List<BookingUserModel?> bookingUsers}) = _BookingUserConsultationState;

  factory BookingUserConsultationState.initialize() => BookingUserConsultationState(
      bookingSlotInfo: null,
      loadingState: LoadingState.isInitial,
      doctorInfo: null,
      selectedBookingUser: null,
      bookingUsers: []);
}
