part of 'book_appointment_bloc.dart';

@freezed
class BookAppointmentState with _$BookAppointmentState {
  const factory BookAppointmentState({required BookingSlotInfo? selectedSlot,
    required DaySlot? selectedDaySlot,
    required LoadingState loadingState,
    required DoctorModel? doctorInfo,
    required InternalConsultationModel? bookedConsultation,
    required Either<String, DefaultResponse>? rescheduleConsultationResult,
    SessionSelectedInfo? sessionSelectedInfo,
    required List<DaySlot> daySlots}) = _BookAppointmentState;

  factory BookAppointmentState.initialize() =>
      BookAppointmentState(
          selectedSlot: null, loadingState: LoadingState.isInitial,
          doctorInfo: null,
          bookedConsultation: null,
          selectedDaySlot: null,
          rescheduleConsultationResult: null,
          daySlots: []);
}
