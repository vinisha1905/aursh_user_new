part of 'consultation_booking_detail_bloc.dart';

@freezed
class ConsultationBookingDetailEvent with _$ConsultationBookingDetailEvent {
  const factory ConsultationBookingDetailEvent.initialize(
      InternalConsultationModel consultation) = _Initialize;

  const factory ConsultationBookingDetailEvent.getConsultationCancellationInfo(
      String consultationBookingId) = _GetConsultationCancellationInfo;

  const factory ConsultationBookingDetailEvent.cancelConsultation(
      String reason) = _CancelConsultation;

  const factory ConsultationBookingDetailEvent.resetErrorMessage() = _ResetErrorMessage;
  const factory ConsultationBookingDetailEvent.getRtcToken(String callType) = _GetRtcToken;
  const factory ConsultationBookingDetailEvent.cleanRtcToken() = _CleanRtcToken;

}
