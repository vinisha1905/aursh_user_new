part of 'search_therapy_bloc.dart';

@freezed
class SearchTherapyEvent with _$SearchTherapyEvent {
  const factory SearchTherapyEvent.initialize() = _Initialize;
  const factory SearchTherapyEvent.search(String keyword) = _Search;
}