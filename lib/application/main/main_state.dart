part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState(
      {required int? selectedTab,
        required BookFor? bookFor,
      required LoadingState loadingState}) = _MainState;

  factory MainState.initialize() =>
      MainState(selectedTab: null, bookFor: null, loadingState: LoadingState.isInitial);
}
