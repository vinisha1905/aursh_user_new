part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.initialize() = _Initialize;
  const factory AuthEvent.logOut(String message) = _LogOut;
}