import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:ayursh/domain/model/business/day_slot.dart';
import 'package:ayursh/domain/model/business/session_selected_info.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/default_response.dart';
import 'package:ayursh/domain/model/response/doctor_model.dart';
import 'package:ayursh/domain/model/response/internal_consultation_model.dart';
import 'package:ayursh/domain/repository/consultation_repository.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_appointment_bloc.freezed.dart';
part 'book_appointment_event.dart';
part 'book_appointment_state.dart';

class BookAppointmentBloc
    extends Bloc<BookAppointmentEvent, BookAppointmentState> {
  final ConsultationRepository consultationRepository;
  final OnboardingRepository onboardingRepository;

  BookAppointmentBloc(
      {required this.consultationRepository,
      required this.onboardingRepository})
      : super(BookAppointmentState.initialize());

  @override
  Stream<BookAppointmentState> mapEventToState(
      BookAppointmentEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(
          loadingState: LoadingState.isInitial,
          doctorInfo: e.doctorInfo,
          bookedConsultation: e.bookedConsultation,
          sessionSelectedInfo: e.sessionSelectedInfo);
    }, getSlots: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var doctorId =
          state.doctorInfo?.id ?? state.bookedConsultation?.doctorId ?? '';
      var response =
          await consultationRepository.getBookAppointmentSlot(doctorId);
      yield* response.fold((error) async* {
        yield state.copyWith(loadingState: LoadingState.isCompleted);
      }, (getSlotResponse) async* {
        if (getSlotResponse.success) {
          var appointmentSlots =
              getSlotResponse.bookAppointmentModel.appointmentSlots;
          List<DaySlot> daySlots = [];
          for (int i = 0; i < appointmentSlots.length; i++) {
            var appointmentSlot = appointmentSlots[i];
            List<BookingSlotInfo> morningSlots = [];
            List<BookingSlotInfo> afternoonSlots = [];
            List<BookingSlotInfo> eveningSlots = [];
            var daySlotModel = appointmentSlot.daySlotModel;
            morningSlots = daySlotModel.morningSlots
                .map((timeSlot) => BookingSlotInfo(
                    appointmentSlot.day,
                    appointmentSlot.date,
                    timeSlot.slotTime,
                    timeSlot.available))
                .toList();
            afternoonSlots = daySlotModel.afternoonSlots
                .map((timeSlot) => BookingSlotInfo(
                    appointmentSlot.day,
                    appointmentSlot.date,
                    timeSlot.slotTime,
                    timeSlot.available))
                .toList();
            eveningSlots = daySlotModel.eveningSlots
                .map((timeSlot) => BookingSlotInfo(
                    appointmentSlot.day,
                    appointmentSlot.date,
                    timeSlot.slotTime,
                    timeSlot.available))
                .toList();
            var daySlot = DaySlot(appointmentSlot.day, appointmentSlot.date,
                morningSlots, afternoonSlots, eveningSlots);
            daySlots.add(daySlot);
          }
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              daySlots: daySlots,
              selectedDaySlot: daySlots[0]);
        } else {
          yield state.copyWith(loadingState: LoadingState.isCompleted);
        }
      });
    }, selectSlot: (e) async* {
      if (e.bookingSlot == state.selectedSlot) {
        yield state.copyWith(selectedSlot: null);
      } else {
        yield state.copyWith(selectedSlot: e.bookingSlot);
      }
    }, selectDaySlot: (e) async* {
      if (e.daySlot != state.selectedDaySlot) {
        yield state.copyWith(selectedDaySlot: e.daySlot, selectedSlot: null);
      } else {
        yield state;
      }
    }, rescheduleConsultation: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var doctorId = state.bookedConsultation?.doctorId ?? '';
      var doctorBookingId = state.bookedConsultation?.doctorBookingId ?? '';
      var consultationBookingId = state.bookedConsultation?.id ?? '';
      var rescheduledAt = state.selectedSlot!.toServerScheduleTime();
      var response = await onboardingRepository.rescheduleConsultation(
          doctorId, consultationBookingId, doctorBookingId, rescheduledAt);
      yield state.copyWith(
          loadingState: LoadingState.isCompleted,
          rescheduleConsultationResult: response);
    });
  }
}
