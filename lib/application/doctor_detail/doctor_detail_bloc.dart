import 'package:ayursh/domain/model/business/session_selected_info.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/doctor_detail_response.dart';
import 'package:ayursh/domain/model/response/doctor_model.dart';
import 'package:ayursh/domain/repository/consultation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_detail_bloc.freezed.dart';
part 'doctor_detail_event.dart';
part 'doctor_detail_state.dart';

class DoctorDetailBloc extends Bloc<DoctorDetailEvent, DoctorDetailState> {
  final ConsultationRepository consultationRepository;

  DoctorDetailBloc({required this.consultationRepository})
      : super(DoctorDetailState.initialize());

  @override
  Stream<DoctorDetailState> mapEventToState(DoctorDetailEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(
          loadingState: LoadingState.isInitial,
          doctorModel: e.doctorModel,
          sessionSelectedInfo: e.sessionSelectedInfo);
    }, getDoctorDetail: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var response =
          await consultationRepository.getDoctorDetail(state.doctorModel!.id);
      yield* response.fold((error) async* {
        yield state.copyWith(
            result: left(error), loadingState: LoadingState.isCompleted);
      }, (doctorDetailResponse) async* {
        if (doctorDetailResponse.success) {
          print(doctorDetailResponse.toString());
          yield state.copyWith(
              result: response, loadingState: LoadingState.isCompleted);
        } else {
          yield state.copyWith(
              result: left(doctorDetailResponse.message ?? ''),
              loadingState: LoadingState.isCompleted);
        }
      });
    });
  }
}
