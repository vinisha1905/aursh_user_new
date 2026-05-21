part of 'my_bookings_bloc.dart';

@freezed
class MyBookingsEvent with _$MyBookingsEvent {
  const factory MyBookingsEvent.getDoctorBookings() = _GetDoctorBookings;
  const factory MyBookingsEvent.getBookedTherapies() = _GetBookedTherapies;
  const factory MyBookingsEvent.selectPage(int page) = _SelectPage;
  const factory MyBookingsEvent.setForcedRefresh() = _SetForcedRefresh;

}