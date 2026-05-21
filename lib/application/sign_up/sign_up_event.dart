part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.initialize() = _Initialize;
  const factory SignUpEvent.signUp(String phoneNumber, String userName, String userEmail) = _SignUp;
}