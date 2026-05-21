part of 'terms_and_conditions_bloc.dart';

@freezed
class TermsAndConditionsState with _$TermsAndConditionsState {
  const factory TermsAndConditionsState(
          {required LoadingState loadingState,
          required bool isAgree,
          required List<String>? contents,
          required TherapyBookingInfo? therapyBookingInfo}) =
      _TermsAndConditionsState;

  factory TermsAndConditionsState.initialize() => TermsAndConditionsState(
      loadingState: LoadingState.isInitial,
      therapyBookingInfo: null,
      contents: null,
      isAgree: false);
}
