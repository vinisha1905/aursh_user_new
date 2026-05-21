part of 'book_appointment_bloc.dart';

@freezed
class BookAppointmentEvent with _$BookAppointmentEvent {
  const factory BookAppointmentEvent.initialize(DoctorModel? doctorInfo, SessionSelectedInfo? sessionSelectedInfo, InternalConsultationModel? bookedConsultation) = _Initialize;
  const factory BookAppointmentEvent.getSlots() = _GetSlots;
  const factory BookAppointmentEvent.selectSlot(BookingSlotInfo? bookingSlot) = _SelectSlot;
  const factory BookAppointmentEvent.selectDaySlot(DaySlot daySlot) = _SelectDaySlot;
  const factory BookAppointmentEvent.rescheduleConsultation() = _RescheduleConsultation;


}