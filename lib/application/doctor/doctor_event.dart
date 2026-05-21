part of 'doctor_bloc.dart';

@freezed
class DoctorEvent with _$DoctorEvent {
  const factory DoctorEvent.initialize(SessionSelectedInfo? sessionSelectedInfo) = _Initialize;

  const factory DoctorEvent.getDoctors() = _GetDoctors;
}