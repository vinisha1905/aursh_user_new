part of 'booking_user_therapy_bloc.dart';

@freezed
class BookingUserTherapyState with _$BookingUserTherapyState {
  const factory BookingUserTherapyState(
      {required TherapyBookingInfo? therapyBookingInfo,
      required LoadingState loadingState,
      required BookingUserModel? selectedBookingUser,
      required List<BookingUserModel?> bookingUsers}) = _BookingUserTherapyState;

  factory BookingUserTherapyState.initialize() => BookingUserTherapyState(
      therapyBookingInfo: null,
      loadingState: LoadingState.isInitial,
      selectedBookingUser: null,
      bookingUsers: []);
}
