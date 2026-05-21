part of 'search_doctor_bloc.dart';

@freezed
class SearchDoctorState with _$SearchDoctorState {
  const factory SearchDoctorState(
      {required String? keyword,
      required LoadingState loadingState,
      required List<DoctorModel> doctors}) = _SearchDoctorState;

  factory SearchDoctorState.initialize() => SearchDoctorState(
      keyword: null, loadingState: LoadingState.isInitial, doctors: []);
}
