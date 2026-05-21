part of 'doctor_bloc.dart';

@freezed
class DoctorState with _$DoctorState {
  const factory DoctorState({required List<DoctorModel> doctors,
    required LoadingState loadingState,
    SessionSelectedInfo? sessionSelectedInfo,
  }) = _DoctorState;

  factory DoctorState.initialize() =>
      DoctorState(loadingState: LoadingState.isInitial, doctors: []);
}
