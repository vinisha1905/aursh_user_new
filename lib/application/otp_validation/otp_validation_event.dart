part of 'otp_validation_bloc.dart';

@freezed
class OtpValidationEvent with _$OtpValidationEvent {
  const factory OtpValidationEvent.initialize(String phoneNumber, String userId, String smsTokenSessionId) = _Initialize;
  const factory OtpValidationEvent.submitOtp(String smsToken) = _SubmitOtp;
  const factory OtpValidationEvent.resendOtp() = _ResendOtp;
  const factory OtpValidationEvent.countTime() = _CountTime;

}