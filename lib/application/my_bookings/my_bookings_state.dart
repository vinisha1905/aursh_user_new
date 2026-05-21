part of 'my_bookings_bloc.dart';

@freezed
class MyBookingsState with _$MyBookingsState {
  const factory MyBookingsState(
      {required LoadingState loadingState, required int selectedPage, required List<BookedTherapyInfo>? bookedTherapies, required DoctorConsultationModel? doctorBookingModel}) = _MyBookingsState;

  factory MyBookingsState.initialize() => MyBookingsState(bookedTherapies: null, selectedPage: 0, doctorBookingModel: null, loadingState: LoadingState.isInitial);
}
