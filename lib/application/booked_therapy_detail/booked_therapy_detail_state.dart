part of 'booked_therapy_detail_bloc.dart';

@freezed
class BookedTherapyDetailState with _$BookedTherapyDetailState {
  const factory BookedTherapyDetailState({
    required LoadingState loadingState,
    required bool previousSessionExpanded,
    required BookedTherapyInfo? bookedTherapy,
    required bool? isStart,
    required bool dataChanged,
    required SessionModel? session,
    required String? otpError,
    required bool bookingCanceled,
  }) = _BookedTherapyDetailState;

  factory BookedTherapyDetailState.initialize() => BookedTherapyDetailState(
        loadingState: LoadingState.isInitial,
        bookedTherapy: null,
        previousSessionExpanded: true,
        dataChanged: false,
        isStart: null,
        session: null,
        otpError: null,
        bookingCanceled: false,
      );
}
