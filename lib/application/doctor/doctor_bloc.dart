import 'package:ayursh/domain/model/business/session_selected_info.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/repository/consultation_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ayursh/domain/model/response/doctor_model.dart';

part 'doctor_bloc.freezed.dart';

part 'doctor_event.dart';

part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final ConsultationRepository consultationRepository;

  DoctorBloc({required this.consultationRepository})
      : super(DoctorState.initialize());

  @override
  Stream<DoctorState> mapEventToState(DoctorEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(
          loadingState: LoadingState.isInitial,
          sessionSelectedInfo: e.sessionSelectedInfo);
    }, getDoctors: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var response = await consultationRepository.getDoctors();
      yield* response.fold((error) async* {
        yield state.copyWith(loadingState: LoadingState.isCompleted);
      }, (loginResponse) async* {
        if (loginResponse.success && loginResponse.doctors != null) {
          yield state.copyWith(
              doctors: loginResponse.doctors!,
              loadingState: LoadingState.isCompleted);
        } else {
          yield state.copyWith(loadingState: LoadingState.isCompleted);
        }
      });
    });
  }
}
