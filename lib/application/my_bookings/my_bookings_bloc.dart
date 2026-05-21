import 'package:ayursh/domain/model/business/booked_therapy_info.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/booked_user_model.dart';
import 'package:ayursh/domain/model/response/doctor_consultation_model.dart';
import 'package:ayursh/domain/model/response/medicine_booking_model.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_bookings_bloc.freezed.dart';

part 'my_bookings_event.dart';

part 'my_bookings_state.dart';

class MyBookingsBloc extends Bloc<MyBookingsEvent, MyBookingsState> {
  final OnboardingRepository onboardingRepo;

  MyBookingsBloc({required this.onboardingRepo}) : super(MyBookingsState.initialize());

  @override
  Stream<MyBookingsState> mapEventToState(MyBookingsEvent event) async* {
    yield* event.map(getBookedTherapies: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading, selectedPage: 0);
      var response = await onboardingRepo.getBookedTherapies();
      print("ayursh api response bloc .. $response");
      yield* response.fold((error) async* {
        yield state.copyWith(bookedTherapies: [], loadingState: LoadingState.isCompleted);
      }, (bookingsResponse) async* {
        if (bookingsResponse.success && bookingsResponse.bookedUserModels != null && bookingsResponse.bookedUserModels!.isNotEmpty) {
          var bookedUserModels = bookingsResponse.bookedUserModels!;
          List<BookedTherapyInfo> bookedTherapies = [];
          for (int i = 0; i < bookedUserModels.length; i++) {
            BookedUserModel bookedUserModel = bookedUserModels[i];
            for (int j = 0; j < bookedUserModel.bookedTherapyModels.length; j++) {
              var bookedTherapy = BookedTherapyInfo(bookedUserModel.isNonConsultationBooking, bookedUserModel.userId, bookedUserModel.bookedTherapyModels[j],
                  bookedUserModel.nonConsultationTherapyBookingId, bookedUserModel.consultationBookingId, bookedUserModel.doctorBookingId);
              bookedTherapies.add(bookedTherapy);
            }
          }
          yield state.copyWith(bookedTherapies: bookedTherapies, loadingState: LoadingState.isCompleted);
        } else {
          yield state.copyWith(bookedTherapies: [], loadingState: LoadingState.isCompleted);
        }
      });
    }, getDoctorBookings: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading, selectedPage: 1);
      var response = await onboardingRepo.getConsultationBookings();
      yield* response.fold((error) async* {
        yield state.copyWith(doctorBookingModel: null, loadingState: LoadingState.isCompleted);
      }, (bookingsResponse) async* {
        if (bookingsResponse.success && bookingsResponse.doctorConsultationModel != null) {
          yield state.copyWith(doctorBookingModel: bookingsResponse.doctorConsultationModel, loadingState: LoadingState.isCompleted);
        } else {
          yield state.copyWith(doctorBookingModel: null, loadingState: LoadingState.isCompleted);
        }
      });
    }, selectPage: (e) async* {
      if (e.page == 0) {
        add(MyBookingsEvent.getBookedTherapies());
      } else if (e.page == 1) {
        await Future.delayed(Duration(milliseconds: 400));
        add(MyBookingsEvent.getDoctorBookings());
      } else if (e.page == 2) {
        await Future.delayed(Duration(milliseconds: 400));
        add(MyBookingsEvent.selectPage(2));
      }
    }, setForcedRefresh: (e) async* {
      //Make some delays to prevent loading is not shown in the first time select booking page
      // yield state.copyWith(
      //     doctorBookingModel: null,
      //     bookedTherapies: null,
      //     selectedPage: selectedVal);
      await Future.delayed(Duration(milliseconds: 400));
    });
  }
}
