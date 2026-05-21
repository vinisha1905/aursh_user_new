import 'package:ayursh/domain/model/business/therapy_booking_info.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/terms_and_conditions_response.dart';
import 'package:ayursh/domain/repository/therapy_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_and_conditions_bloc.freezed.dart';
part 'terms_and_conditions_event.dart';
part 'terms_and_conditions_state.dart';

class TermsAndConditionsBloc
    extends Bloc<TermsAndConditionsEvent, TermsAndConditionsState> {
  final TherapyRepository therapyRepository;

  TermsAndConditionsBloc({required this.therapyRepository})
      : super(TermsAndConditionsState.initialize());

  @override
  Stream<TermsAndConditionsState> mapEventToState(
      TermsAndConditionsEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(
        loadingState: LoadingState.isLoading,
      );
      Either<String, TermsAndConditionsResponse> response;

      if (e.therapyType.contains("ayur")) {
        response = await therapyRepository.getTermsAndConditions();
      } else {
        response = await therapyRepository.getPhysioTermsAndConditions();
      }

      yield* response.fold((error) async* {
        print(error);
        yield state.copyWith(loadingState: LoadingState.isCompleted);
      }, (tncsResponse) async* {
        if (tncsResponse.success && tncsResponse.contents.isNotEmpty) {
          yield state.copyWith(
              contents: tncsResponse.contents,
              loadingState: LoadingState.isCompleted);
        } else {
          yield state.copyWith(loadingState: LoadingState.isCompleted);
        }
      });
    }, setAgree: (e) async* {
      yield state.copyWith(isAgree: !state.isAgree);
    });
  }
}
