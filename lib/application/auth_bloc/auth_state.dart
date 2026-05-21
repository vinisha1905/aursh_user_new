part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState(
      {required bool isLoggedIn,
      required String accessToken,
      required String message,
      required int expiryTime}) = _AuthState;

  factory AuthState.initialize() =>
      AuthState(isLoggedIn: false, accessToken: '', message: '', expiryTime: 0);
}
