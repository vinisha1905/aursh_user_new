import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/about_us_model.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_us_bloc.freezed.dart';
part 'about_us_event.dart';
part 'about_us_state.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  final OnboardingRepository onboardingRepository;

  AboutUsBloc({required this.onboardingRepository})
      : super(AboutUsState.initialize());

  @override
  Stream<AboutUsState> mapEventToState(AboutUsEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var response = await onboardingRepository.getAboutUs();
      yield* response.fold((error) async* {
        yield state.copyWith(loadingState: LoadingState.isCompleted);
      }, (historyResp) async* {
        if (historyResp.success && historyResp.aboutUsModels != null) {
          yield state.copyWith(
              aboutUsModels: historyResp.aboutUsModels ?? [],
              loadingState: LoadingState.isCompleted);
        } else {
          yield state.copyWith(loadingState: LoadingState.isCompleted);
        }
      });
    });
  }
}
