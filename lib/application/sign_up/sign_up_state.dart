part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState(
      {required String? phoneNumber,
      required String? userName,
      required String? userEmail,
        required String? nameError,
        required String? emailError,
        required String? phoneError,
      required LoadingState loadingState,
      required Either<String, SignUpResponse>? result}) = _SignUpState;

  factory SignUpState.initialize() => SignUpState(
      phoneNumber: null,
      userName: null,
      userEmail: null,
      nameError: null,
      phoneError: null,
      emailError: null,
      loadingState: LoadingState.isInitial,
      result: null);
}
