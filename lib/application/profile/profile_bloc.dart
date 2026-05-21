import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/profile_model.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_bloc.freezed.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final OnboardingRepository onboardingRepo;

  ProfileBloc({required this.onboardingRepo})
      : super(ProfileState.initialize());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    yield* event.map(getProfile: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var response = await onboardingRepo.getUserProfile();
      print('daskod' + response.toString());
      yield* response.fold((error) async* {

        print('daskod1' + error.toString());

        yield state.copyWith(loadingState: LoadingState.isCompleted);
      }, (profileResponse) async* {
        if (profileResponse.success) {
          var profileModel = profileResponse.profileModel;
          yield state.copyWith(
              loadingState: LoadingState.isCompleted, profile: profileModel);
        } else {
          yield state.copyWith(loadingState: LoadingState.isCompleted);
        }
      });
    }, updateProfile: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var response = await onboardingRepo.updateUserProfile(e.name, e.email);
      yield* response.fold((error) async* {
        yield state.copyWith(loadingState: LoadingState.isCompleted);
      }, (profileResponse) async* {
        if (profileResponse.success) {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              profile: ProfileModel(
                  e.name,
                  e.email,
                  state.profile!.phoneNumber,
                  state.profile!.fcmToken,
                  state.profile!.location,
                  state.profile!.bookingProfiles));
        } else {
          yield state.copyWith(loadingState: LoadingState.isCompleted);
        }
      });
    });
  }
}
