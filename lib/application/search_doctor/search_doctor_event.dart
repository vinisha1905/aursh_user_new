part of 'search_doctor_bloc.dart';

@freezed
class SearchDoctorEvent with _$SearchDoctorEvent {
  const factory SearchDoctorEvent.initialize() = _Initialize;
  const factory SearchDoctorEvent.search(String keyword) = _Search;
}