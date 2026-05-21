part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState(
      {required String? phoneNumber,
      required LoadingState loadingState,
      required Either<String, LoginResponse>? result}) = _LoginState;

  factory LoginState.initialize() => LoginState(
      phoneNumber: null, loadingState: LoadingState.isInitial, result: null);
}
