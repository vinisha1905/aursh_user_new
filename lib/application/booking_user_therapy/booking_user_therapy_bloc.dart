import 'package:ayursh/domain/model/business/therapy_booking_info.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/booking_user_model.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_user_therapy_bloc.freezed.dart';
part 'booking_user_therapy_event.dart';
part 'booking_user_therapy_state.dart';

class BookingUserTherapyBloc
    extends Bloc<BookingUserTherapyEvent, BookingUserTherapyState> {
  final OnboardingRepository onboardingRepository;

  BookingUserTherapyBloc({required this.onboardingRepository})
      : super(BookingUserTherapyState.initialize());

  @override
  Stream<BookingUserTherapyState> mapEventToState(
      BookingUserTherapyEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(
          therapyBookingInfo: e.therapyBookingInfo,
          bookingUsers: state.bookingUsers);
      add(BookingUserTherapyEvent.getBookingUsers());
    }, getBookingUsers: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var response = await onboardingRepository
          .getBookingUsers('');
      yield* response.fold((error) async* {
        yield state.copyWith(loadingState: LoadingState.isCompleted);
      }, (getBookingUserResponse) async* {
        if (getBookingUserResponse.success) {
          var bookingUsers = getBookingUserResponse.bookingUsers;
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              bookingUsers: bookingUsers ?? []);
        } else {
          yield state.copyWith(loadingState: LoadingState.isCompleted);
        }
      });
    }, selectBookingUser: (e) async* {
      yield state.copyWith(selectedBookingUser: e.bookingUser);
    }, addBookingUser: (e) async* {
      final updatedBookingUsers = List.of(state.bookingUsers)
        ..add(e.bookingUser);
      yield state.copyWith(
          selectedBookingUser: e.bookingUser,
          bookingUsers: updatedBookingUsers);
    });
  }
}
