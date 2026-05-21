part of 'booking_user_therapy_bloc.dart';

@freezed
class BookingUserTherapyEvent with _$BookingUserTherapyEvent {
  const factory BookingUserTherapyEvent.initialize(TherapyBookingInfo therapyBookingInfo) = _Initialize;
  const factory BookingUserTherapyEvent.getBookingUsers() = _GetBookingUsers;
  const factory BookingUserTherapyEvent.selectBookingUser(BookingUserModel bookingUser) = _SelectBookingUser;
  const factory BookingUserTherapyEvent.addBookingUser(BookingUserModel bookingUser) = _AddBookingUser;

}