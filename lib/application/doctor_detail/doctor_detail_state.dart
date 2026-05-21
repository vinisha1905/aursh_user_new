part of 'doctor_detail_bloc.dart';

@freezed
class DoctorDetailState with _$DoctorDetailState {
  const factory DoctorDetailState({required DoctorModel? doctorModel,
    required LoadingState loadingState,
    SessionSelectedInfo? sessionSelectedInfo,
    required Either<String,
        DoctorDetailResponse>? result}) = _DoctorDetailState;

  factory DoctorDetailState.initialize() =>
      DoctorDetailState(
          doctorModel: null,
          loadingState: LoadingState.isInitial,
          result: null);
}
