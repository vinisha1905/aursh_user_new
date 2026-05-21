import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_us_bloc.freezed.dart';
part 'rate_us_event.dart';
part 'rate_us_state.dart';

class RateUsBloc extends Bloc<RateUsEvent, RateUsState> {
  final OnboardingRepository onboardingRepository;

  RateUsBloc({required this.onboardingRepository})
      : super(RateUsState.initialize());

  @override
  Stream<RateUsState> mapEventToState(RateUsEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(
          loadingState: LoadingState.isInitial,
          bookingId: e.bookingId,
          therapyName: e.therapyName,
          therapistName: e.therapistName,
          therapistImageUrl: e.therapistImageUrl);
    }, setTherapyPoint: (e) async* {
      yield state.copyWith(therapyPoint: e.therapyPoint);
    }, setTherapistPoint: (e) async* {
      yield state.copyWith(therapistPoint: e.therapistPoint);
    }, submit: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var bookingId = state.bookingId ?? '';
      var therapyPoint = state.therapyPoint;
      var therapyDescription = e.therapyDescription;
      var therapistPoint = state.therapistPoint;
      var therapistDescription = e.therapistDescription;
      var response = await onboardingRepository.submitRateUs(
          bookingId,
          therapyPoint,
          therapyDescription,
          therapistPoint,
          therapistDescription);
      yield* response.fold((error) async* {
        yield state.copyWith(loadingState: LoadingState.isCompleted);
      }, (rateUsResp) async* {
        if (rateUsResp.success) {
          print(rateUsResp.toString());
          yield state.copyWith(
              isSuccess: true, loadingState: LoadingState.isCompleted);
        } else {
          yield state.copyWith(loadingState: LoadingState.isCompleted);
        }
      });
    });
  }
}
