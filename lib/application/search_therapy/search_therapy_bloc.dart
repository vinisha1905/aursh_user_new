import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/search_therapy_response.dart';
import 'package:ayursh/domain/repository/therapy_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_therapy_bloc.freezed.dart';
part 'search_therapy_event.dart';
part 'search_therapy_state.dart';

class SearchTherapyBloc extends Bloc<SearchTherapyEvent, SearchTherapyState> {
  final TherapyRepository therapyRepository;

  SearchTherapyBloc({required this.therapyRepository}) : super(SearchTherapyState.initialize());

  @override
  Stream<SearchTherapyState> mapEventToState(SearchTherapyEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isInitial);
    }, search: (e) async* {
      if(e.keyword == state.keyword || (state.keyword == null && e.keyword.isEmpty)) {
        yield state;
      } else {
        yield state.copyWith(
            loadingState: LoadingState.isLoading, keyword: e.keyword);
        var response = await therapyRepository.searchTherapy(e.keyword);
        yield* response.fold((error) async* {
          // print(error);
          yield state.copyWith(
              result: left(error), loadingState: LoadingState.isCompleted);
        }, (searchTherapyResponse) async* {
          if (searchTherapyResponse.success) {
            yield state.copyWith(
                result: response, loadingState: LoadingState.isCompleted);
          } else {
            yield state.copyWith(
                result: left(searchTherapyResponse.message),
                loadingState: LoadingState.isCompleted);
          }
        });
      }
    });
  }
}
