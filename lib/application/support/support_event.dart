part of 'support_bloc.dart';

@freezed
class SupportEvent with _$SupportEvent {
  const factory SupportEvent.initialize(ProfileModel profile) = _Initialize;
  const factory SupportEvent.sendSupport(String message) = _SendSupport;
}