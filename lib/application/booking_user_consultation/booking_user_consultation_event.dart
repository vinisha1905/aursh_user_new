part of 'booking_user_consultation_bloc.dart';

@freezed
class BookingUserConsultationEvent with _$BookingUserConsultationEvent {
  const factory BookingUserConsultationEvent.initialize(DoctorModel doctorInfo, BookingSlotInfo bookingSlotInfo, SessionSelectedInfo? sessionSelectedInfo) = _Initialize;
  const factory BookingUserConsultationEvent.getBookingUsers() = _GetBookingUsers;
  const factory BookingUserConsultationEvent.selectBookingUser(BookingUserModel bookingUser) = _SelectBookingUser;
  const factory BookingUserConsultationEvent.addBookingUser(BookingUserModel bookingUser) = _AddBookingUser;

}