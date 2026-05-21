part of 'booked_therapy_detail_bloc.dart';

@freezed
class BookedTherapyDetailEvent with _$BookedTherapyDetailEvent {
  const factory BookedTherapyDetailEvent.initialize(
      BookedTherapyInfo bookedTherapy) = _Initialize;
  const factory BookedTherapyDetailEvent.setExpandPreviousSession() =
      _SetExpandPreviousSession;
  const factory BookedTherapyDetailEvent.refresh() = _Refresh;
  // const factory BookedTherapyDetailEvent.showQrCode(bool isStart, SessionModel session) = _ShowQrCode;
  const factory BookedTherapyDetailEvent.generateOTP(
      bool isStart, SessionModel session) = _ShowQrCode;
  // const factory BookedTherapyDetailEvent.resetQrCode() = _ResetQrCode;
  const factory BookedTherapyDetailEvent.resetOTP() = _ResetQrCode;
  const factory BookedTherapyDetailEvent.setDataChanged() = _SetDataChanged;
  const factory BookedTherapyDetailEvent.cancelBooking() = _CancelBooking;
}
