part of 'otp_validation_bloc.dart';

@freezed
class OtpValidationState with _$OtpValidationState {
  const factory OtpValidationState(
          {required String? phoneNumber,
          required String? userId,
          required String? smsTokenSessionId,
          required int? aliveTime,
          required bool forceStopCounting,
          required LoadingState loadingState,
          required Either<String, OtpValidationResponse>? result}) =
      _OtpValidationState;

  factory OtpValidationState.initialize() => OtpValidationState(
      phoneNumber: null,
      userId: null,
      aliveTime: null,
      forceStopCounting: false,
      smsTokenSessionId: null,
      loadingState: LoadingState.isInitial,
      result: null);
}
