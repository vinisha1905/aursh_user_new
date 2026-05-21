import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:ayursh/domain/model/business/session_selected_info.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/booking_user_model.dart';
import 'package:ayursh/domain/model/response/doctor_model.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_user_consultation_bloc.freezed.dart';

part 'booking_user_consultation_event.dart';

part 'booking_user_consultation_state.dart';

class BookingUserConsultationBloc
    extends Bloc<BookingUserConsultationEvent, BookingUserConsultationState> {
  final OnboardingRepository onboardingRepository;

  BookingUserConsultationBloc({required this.onboardingRepository})
      : super(BookingUserConsultationState.initialize());

  @override
  Stream<BookingUserConsultationState> mapEventToState(
      BookingUserConsultationEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(
          doctorInfo: e.doctorInfo,
          bookingSlotInfo: e.bookingSlotInfo,
          sessionSelectedInfo: e.sessionSelectedInfo,
          bookingUsers: state.bookingUsers);
      add(BookingUserConsultationEvent.getBookingUsers());
    }, getBookingUsers: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var response = await onboardingRepository
          .getBookingUsers(state.doctorInfo?.id ?? '');
      yield* response.fold((error) async* {
        yield state.copyWith(loadingState: LoadingState.isCompleted);
      }, (getBookingUserResponse) async* {
        if (getBookingUserResponse.success) {
          var bookingUsers = getBookingUserResponse.bookingUsers;
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              bookingUsers: [...state.bookingUsers, ...bookingUsers ?? []]);
        } else {
          yield state.copyWith(loadingState: LoadingState.isCompleted);
        }
      });
    }, selectBookingUser: (e) async* {
      yield state.copyWith(selectedBookingUser: e.bookingUser);
    }, addBookingUser: (e) async* {
      yield state.copyWith(
          selectedBookingUser: e.bookingUser,
          bookingUsers: [...state.bookingUsers, e.bookingUser]);
    });
  }
}
