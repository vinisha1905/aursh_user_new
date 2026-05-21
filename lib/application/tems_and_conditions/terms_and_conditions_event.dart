part of 'terms_and_conditions_bloc.dart';

@freezed
class TermsAndConditionsEvent with _$TermsAndConditionsEvent {
  const factory TermsAndConditionsEvent.initialize(
      {required String therapyType}) = _Initialize;
  const factory TermsAndConditionsEvent.setAgree() = _SetAgree;
}
