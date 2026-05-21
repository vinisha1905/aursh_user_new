import 'package:ayursh/domain/model/business/address_info.dart';
import 'package:ayursh/domain/model/business/booked_therapy_info.dart';
import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:ayursh/domain/model/business/therapy_booking_info.dart';
import 'package:ayursh/domain/model/business/therapy_date_slot.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/request/therapy_booking_next_request.dart';
import 'package:ayursh/domain/model/request/therapy_booking_reschedule_request.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:ayursh/domain/repository/therapy_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

import '../address/address_bloc.dart';

part 'book_therapy_time_bloc.freezed.dart';

part 'book_therapy_time_event.dart';

part 'book_therapy_time_state.dart';

class BookTherapyTimeBloc
    extends Bloc<BookTherapyTimeEvent, BookTherapyTimeState> {
  final TherapyRepository therapyRepository;
  final OnboardingRepository onboardingRepository;

  BookTherapyTimeBloc(
      {required this.therapyRepository, required this.onboardingRepository})
      : super(BookTherapyTimeState.initialize());

  @override
  Stream<BookTherapyTimeState> mapEventToState(
      BookTherapyTimeEvent event) async* {
    yield* event.map(
      initialize: (e) async* {
        var address;
        var isBookNext = false;
        if (e.bookedTherapyInfo != null) {
          isBookNext = true;
          address = AddressInfo(
            e.bookedTherapyInfo!.bookedTherapyModel.addressFlatNoBuilding,
            e.bookedTherapyInfo!.bookedTherapyModel.addressAreaLocality,
            e.bookedTherapyInfo!.bookedTherapyModel.addressLandmark,
            e.bookedTherapyInfo!.bookedTherapyModel.addressCity,
          );
        }

        address = AddressInfo(
          '',
          '${e.therapyBookingInfo?.selectedAddress ?? ""}',
          '',
          '',
        );
        yield state.copyWith(
            loadingState: LoadingState.isInitial,
            therapyBookingInfo: e.therapyBookingInfo,
            bookedTherapyInfo: e.bookedTherapyInfo,
            addressInfo: address,
            isBookNext: isBookNext);
      },
      getSlots: (e) async* {
        yield state.copyWith(loadingState: LoadingState.isLoading);
        var gender = '';
        var sessionDurationInMin = '';
        if (state.therapyBookingInfo != null) {
          gender =
              state.therapyBookingInfo!.bookingUserModel?.bookingForGender ??
                  '';
          sessionDurationInMin = state
                  .therapyBookingInfo!.sessionSelectedInfo.sessionDurationInMin
                  ?.toString() ??
              '';
        } else if (state.bookedTherapyInfo != null) {
          gender = state.bookedTherapyInfo!.bookedTherapyModel.patientGender;
          sessionDurationInMin = state
              .bookedTherapyInfo!.bookedTherapyModel.sessionDurationInMin
              .toString();
        }
        AddressState addressState = GetIt.I.get<AddressBloc>().state;
        var response = await therapyRepository.getBookAppointmentSlot(
          gender,
          sessionDurationInMin,
          "${addressState.long}",
          "${addressState.lat}",
        );
        yield* response.fold((error) async* {
          yield state.copyWith(loadingState: LoadingState.isCompleted);
        }, (getSlotResponse) async* {
          if (getSlotResponse.success) {
            var dateSlotModels = getSlotResponse.bookTherapyTimeModel.dateSlots;
            var responseModel = getSlotResponse.bookTherapyTimeModel;

            List<TherapyDateSlot> dateSlots = [];
            for (int i = 0; i < dateSlotModels.length; i++) {
              var dateSlotModel = dateSlotModels[i];
              var timeSlots = dateSlotModel.timeSlots
                  .map((timeSlot) => BookingSlotInfo(dateSlotModel.day,
                      dateSlotModel.date, timeSlot.time, timeSlot.available))
                  .toList();
              dateSlots.add(TherapyDateSlot(
                  dateSlotModel.day, dateSlotModel.date, timeSlots));
            }
            yield state.copyWith(
                loadingState: LoadingState.isCompleted,
                dateSlots: dateSlots,initDateSlot: dateSlots.first,

  singleSessionTerms: responseModel.singleSessionTerms,
  multiSessionTerms: responseModel.multiSessionTerms,);
          } else {
            yield state.copyWith(loadingState: LoadingState.isCompleted);
          }
        });
      },
      selectSlot: (e) async* {
        if (e.bookingSlot == state.selectedSlot) {
          yield state.copyWith(selectedSlot: null);
        } else {
          yield state.copyWith(selectedSlot: e.bookingSlot);
        }
      },
      selectDateSlot: (e) async* {
        if (state.selectedDateSlot == null) {
          if (state.selectedSlot == null) {
            yield state.copyWith(selectedDateSlot: e.dateSlot);
          } else {
            var correctSelectedSlot;
            state.dateSlots.forEach((dateSlot) {
              if (dateSlot == e.dateSlot) {
                dateSlot.slots.forEach((slot) {
                  if (slot.time == state.selectedSlot!.time) {
                    correctSelectedSlot = slot;
                  }
                });
              }
            });
            yield state.copyWith(
                selectedDateSlot: e.dateSlot,
                selectedSlot: correctSelectedSlot);
          }
        } else {
          if (e.dateSlot != state.selectedDateSlot) {
            yield state.copyWith(
                selectedDateSlot: e.dateSlot, selectedSlot: null);
          } else {
            yield state;
          }
        }
      },
      setAddress: (e) async* {
        yield state.copyWith(addressInfo: e.addressInfo);
      },
      resetError: (e) async* {
        yield state.copyWith(error: null);
      },
      bookNextSession: (e) async* {
        yield state.copyWith(loadingState: LoadingState.isLoading);
        var bookingSlotInfo = state.selectedSlot!;
        var scheduledAt = bookingSlotInfo.toServerScheduleTime();
        print(scheduledAt);
        //TODO: Check if we need to check isRequiredConsultation therapy category here
        var therapyTitle =
            state.bookedTherapyInfo!.bookedTherapyModel.therapyTitle;
        var sessionNo =
            (state.bookedTherapyInfo!.bookedTherapyModel.recentSession + 1)
                .toString();
        var sessionDurationInMin =
            state.bookedTherapyInfo!.bookedTherapyModel.sessionDurationInMin;
        var patientGender =
            state.bookedTherapyInfo!.bookedTherapyModel.patientGender;
        var nonConsultationTherapyBookingId =
            state.bookedTherapyInfo!.nonConsultationTherapyBookingId;
        var consultationBookingId =
            state.bookedTherapyInfo!.consultationBookingId;

        var bookingRequest = TherapyBookingNextRequest(
          nonConsultationTherapyBookingId,
          consultationBookingId,
          therapyTitle,
          sessionNo,
          scheduledAt,
          sessionDurationInMin,
          patientGender,
        );
        var response =
            await onboardingRepository.bookNextSession(bookingRequest);
        print(response);
        yield* response.fold((l) async* {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted, error: l);
        }, (bookTherapyRsp) async* {
          if (bookTherapyRsp.success) {
            yield state.copyWith(
                loadingState: LoadingState.isCompleted,
                isBookNextSuccess: true);
          } else {
            yield state.copyWith(
                loadingState: LoadingState.isCompleted,
                error: 'Booking Failed');
          }
        });
      },
      rescheduleBooking: (e) async* {
        yield state.copyWith(loadingState: LoadingState.isLoading);

        var sessionInfo = state.bookedTherapyInfo!.bookedTherapyModel.sessions
            .firstWhere((element) =>
                element.sessionNo ==
                state.bookedTherapyInfo!.bookedTherapyModel.recentSession);
        //Post data
        var scheduledAt = state.selectedSlot!.toServerScheduleTime();
        var therapyTitle =
            state.bookedTherapyInfo!.bookedTherapyModel.therapyTitle;
        var therapyBookingSessionId = sessionInfo.id;
        var sessionNo =
            (state.bookedTherapyInfo!.bookedTherapyModel.recentSession);
        var sessionDurationInMin =
            state.bookedTherapyInfo!.bookedTherapyModel.sessionDurationInMin;
        var patientGender =
            state.bookedTherapyInfo!.bookedTherapyModel.patientGender;
        var nonConsultationTherapyBookingId =
            state.bookedTherapyInfo!.nonConsultationTherapyBookingId;
        var therapistId = sessionInfo.therapistId;
        var therapistBookingId = sessionInfo.therapistBookingId;

        var bookingRequest = TherapyBookingRescheduleRequest(
          nonConsultationTherapyBookingId,
          therapyBookingSessionId,
          therapistBookingId,
          therapistId,
          therapyTitle,
          sessionNo,
          scheduledAt,
          sessionDurationInMin,
          patientGender,
          false,
          'CUSTOMER_RESCHEDULED',
        );
        var response =
            await onboardingRepository.rescheduleSession(bookingRequest);
        yield* response.fold((l) async* {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted, error: l);
        }, (bookTherapyRsp) async* {
          if (bookTherapyRsp.success) {
            yield state.copyWith(
                loadingState: LoadingState.isCompleted,
                rescheduledBookingSuccess: true);
          } else {
            yield state.copyWith(
                loadingState: LoadingState.isCompleted,
                error: 'Booking Failed');
          }
        });
      },
    );
  }
}
