import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/doctor_model.dart';
import 'package:ayursh/domain/repository/consultation_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_doctor_bloc.freezed.dart';
part 'search_doctor_event.dart';
part 'search_doctor_state.dart';

class SearchDoctorBloc extends Bloc<SearchDoctorEvent, SearchDoctorState> {
  final ConsultationRepository consultationRepository;

  SearchDoctorBloc({required this.consultationRepository})
      : super(SearchDoctorState.initialize());

  @override
  Stream<SearchDoctorState> mapEventToState(SearchDoctorEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isInitial);
    }, search: (e) async* {
      if (e.keyword == state.keyword ||
          (state.keyword == null && e.keyword.isEmpty)) {
        yield state;
      } else {
        yield state.copyWith(
            loadingState: LoadingState.isLoading, keyword: e.keyword);
        var response = await consultationRepository.searchDoctor(e.keyword);
        yield* response.fold((error) async* {
          yield state
              .copyWith(doctors: [], loadingState: LoadingState.isCompleted);
        }, (searchDoctorResponse) async* {
          if (searchDoctorResponse.success) {
            print(searchDoctorResponse.toString());
            yield state.copyWith(
                doctors: searchDoctorResponse.doctors ?? [],
                loadingState: LoadingState.isCompleted);
          } else {
            yield state
                .copyWith(doctors: [], loadingState: LoadingState.isCompleted);
          }
        });
      }
    });
  }
}
