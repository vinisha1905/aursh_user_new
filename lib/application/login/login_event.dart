part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.initialize() = _Initialize;
  const factory LoginEvent.signIn(String phoneNumber) = _SignIn;
}