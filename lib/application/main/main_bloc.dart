import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/presentation/payment_success/payment_success_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_bloc.freezed.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState.initialize());

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isInitial, selectedTab: 0);
    }, selectTab: (e) async* {
      if (e.index == 2) {
        yield state.copyWith(selectedTab: e.index, bookFor: e.bookFor ?? BookFor.DoctorConsultation, loadingState: LoadingState.isCompleted);
      } else {
        yield state.copyWith(selectedTab: e.index, bookFor: null);
      }
    }, showLoading: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
    }, hideLoading: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isCompleted);
    });
  }
}
