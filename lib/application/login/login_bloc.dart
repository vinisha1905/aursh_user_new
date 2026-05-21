import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/login_response.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final OnboardingRepository onboardingRepo;

  LoginBloc({required this.onboardingRepo}) : super(LoginState.initialize());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isInitial);
    }, signIn: (e) async* {
      if (e.phoneNumber.contains("+91")) {
        if (e.phoneNumber.length < 10) {
          yield state.copyWith(
              result: left('Phone number should be 10 digits'));
        } else {
          yield state.copyWith(
              loadingState: LoadingState.isLoading,
              phoneNumber: e.phoneNumber,
              result: null);
          print(e.phoneNumber);
          var response = await onboardingRepo.login(e.phoneNumber);
          yield* response.fold((error) async* {
            // print(error);
            yield state.copyWith(
                result: left(error), loadingState: LoadingState.isCompleted);
          }, (loginResponse) async* {
            if (loginResponse.success) {
              print(loginResponse.toString());
              yield state.copyWith(
                  result: response, loadingState: LoadingState.isCompleted);
            } else {
              yield state.copyWith(
                  result: left(loginResponse.message ?? ''),
                  loadingState: LoadingState.isCompleted);
            }
          });
        }
      } else {
        if (e.phoneNumber.length < 7) {
          yield state.copyWith(result: left('Phone number should be 7 digits'));
        } else {
          yield state.copyWith(
              loadingState: LoadingState.isLoading,
              phoneNumber: e.phoneNumber,
              result: null);
          print(e.phoneNumber);
          var response = await onboardingRepo.login(e.phoneNumber);
          yield* response.fold((error) async* {
            // print(error);
            yield state.copyWith(
                result: left(error), loadingState: LoadingState.isCompleted);
          }, (loginResponse) async* {
            if (loginResponse.success) {
              print(loginResponse.toString());
              yield state.copyWith(
                  result: response, loadingState: LoadingState.isCompleted);
            } else {
              yield state.copyWith(
                  result: left(loginResponse.message ?? ''),
                  loadingState: LoadingState.isCompleted);
            }
          });
        }
      }
    });
  }
}
