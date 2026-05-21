part of 'book_therapy_time_bloc.dart';

@freezed
class BookTherapyTimeEvent with _$BookTherapyTimeEvent {
  const factory BookTherapyTimeEvent.initialize(
      TherapyBookingInfo? therapyBookingInfo,
      BookedTherapyInfo? bookedTherapyInfo) = _Initialize;

  const factory BookTherapyTimeEvent.getSlots() = _GetSlots;

  const factory BookTherapyTimeEvent.selectSlot(BookingSlotInfo? bookingSlot) =
      _SelectSlot;

  const factory BookTherapyTimeEvent.selectDateSlot(TherapyDateSlot dateSlot) =
      _SelectDateSlot;

  const factory BookTherapyTimeEvent.setAddress(AddressInfo addressInfo) =
      _SetAddress;

  const factory BookTherapyTimeEvent.bookNextSession() = _BookNextSession;

  const factory BookTherapyTimeEvent.resetError() = _ResetError;

  const factory BookTherapyTimeEvent.rescheduleBooking() = _RescheduleBooking;
}
