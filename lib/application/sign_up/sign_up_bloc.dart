import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/sign_up_response.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_bloc.freezed.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final OnboardingRepository onboardingRepo;

  SignUpBloc({required this.onboardingRepo}) : super(SignUpState.initialize());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isInitial);
    }, signUp: (e) async* {
      if (e.userName.isEmpty) {
        yield state.copyWith(nameError: 'Please enter username', emailError: null, phoneError: null);
      } else if (e.userEmail.isEmpty) {
        yield state.copyWith(nameError: null, emailError: 'Please enter email', phoneError: null);
      } else if (!_isEmail(e.userEmail)) {
        yield state.copyWith(
            nameError: null, emailError: ' Please enter valid email address', phoneError: null);
      } else if (e.phoneNumber.isEmpty) {
        yield state.copyWith(
            nameError: null,
            emailError: null,
            phoneError: ' Please enter mobile number');
      } else if (e.phoneNumber.length < 10) {
        yield state.copyWith(
            nameError: null,
            emailError: null,
            phoneError: ' Phone number should be 10 digits');
      } else {
        yield state.copyWith(
            loadingState: LoadingState.isLoading,
            phoneNumber: e.phoneNumber,
            userName: e.userName,
            userEmail: e.userEmail,
            nameError: null,
            emailError: null,
            phoneError: null);
        var response = await onboardingRepo.signUp(
            '+91${e.phoneNumber}', e.userName, e.userEmail);
        yield* response.fold((error) async* {
          // print(error);
          yield state.copyWith(
              result: left(error), loadingState: LoadingState.isCompleted);
        }, (signUpResponse) async* {
          if (signUpResponse.success) {
            // print(loginResponse.toString());
            yield state.copyWith(
                result: response, loadingState: LoadingState.isCompleted);
          } else {
            // print(loginResponse.message);
            yield state.copyWith(
                result: left(signUpResponse.message),
                loadingState: LoadingState.isCompleted);
          }
        });
      }
    });
  }

  bool _isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }
}
