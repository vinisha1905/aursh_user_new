part of 'support_bloc.dart';

@freezed
class SupportState with _$SupportState {
  const factory SupportState(
      {required LoadingState loadingState,
      required ProfileModel? profile,
      required Either<String, DefaultResponse>? result}) = _SupportState;

  factory SupportState.initialize() => SupportState(
      profile: null, loadingState: LoadingState.isInitial, result: null);
}
