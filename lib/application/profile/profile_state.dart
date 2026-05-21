part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState(
      {required ProfileModel? profile,
      required LoadingState loadingState}) = _ProfileState;

  factory ProfileState.initialize() => ProfileState(
      profile: null,
      loadingState: LoadingState.isInitial);
}
