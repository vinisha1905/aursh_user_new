import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/default_response.dart';
import 'package:ayursh/domain/model/response/profile_model.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_bloc.freezed.dart';
part 'support_event.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final OnboardingRepository onboardingRepository;

  SupportBloc({required this.onboardingRepository})
      : super(SupportState.initialize());

  @override
  Stream<SupportState> mapEventToState(SupportEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(profile: e.profile);
    }, sendSupport: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var response = await onboardingRepository.sendSupportMessage(
          state.profile?.name?? '',
          state.profile?.email?? '',
          state.profile?.phoneNumber ?? '',
          e.message);
      yield state.copyWith(
          result: response, loadingState: LoadingState.isCompleted);
    });
  }
}
