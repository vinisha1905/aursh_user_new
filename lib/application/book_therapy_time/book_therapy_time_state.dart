part of 'book_therapy_time_bloc.dart';

@freezed
class BookTherapyTimeState with _$BookTherapyTimeState {
  const factory BookTherapyTimeState({
    required BookingSlotInfo? selectedSlot,
    required TherapyDateSlot? selectedDateSlot,
    required TherapyDateSlot? initDateSlot,
    required LoadingState loadingState,
    required TherapyBookingInfo? therapyBookingInfo,
    required BookedTherapyInfo? bookedTherapyInfo,
    required List<TherapyDateSlot> dateSlots,

    required List<String> singleSessionTerms,
    required List<String> multiSessionTerms,

    required bool isBookNext,
    required bool? isBookNextSuccess,
    required String? error,
    required AddressInfo? addressInfo,
    required bool rescheduledBookingSuccess,
  }) = _BookTherapyTimeState;

  factory BookTherapyTimeState.initialize() => BookTherapyTimeState(
        selectedSlot: null,
        loadingState: LoadingState.isInitial,
        therapyBookingInfo: null,
        bookedTherapyInfo: null,
        selectedDateSlot: null,
        initDateSlot: null,
        isBookNext: false,
        isBookNextSuccess: null,
        error: null,
        dateSlots: [],

        singleSessionTerms: [],
        multiSessionTerms: [],

        addressInfo: null,
        rescheduledBookingSuccess: false,
      );
}