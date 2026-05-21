part of 'about_us_bloc.dart';

@freezed
class AboutUsState with _$AboutUsState {
  const factory AboutUsState(
      {required LoadingState loadingState,
      required List<AboutUsModel> aboutUsModels}) = _AboutUsState;

  factory AboutUsState.initialize() =>
      AboutUsState(loadingState: LoadingState.isInitial, aboutUsModels: []);
}
