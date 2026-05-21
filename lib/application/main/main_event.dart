part of 'main_bloc.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.initialize() = _Initialize;
  const factory MainEvent.selectTab(int index, BookFor? bookFor) = _SelectTab;
  const factory MainEvent.showLoading() = _ShowLoading;
  const factory MainEvent.hideLoading() = _HideLoading;
}