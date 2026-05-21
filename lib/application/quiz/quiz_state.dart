part of 'quiz_bloc.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState(
      {required QuestionGetModel? questionGetModel,
      required int? selectedIndex,
      required HashMap<int, int?>? answers,
      required LoadingState loadingState,
      required Either<String, AnswerResponse>? answerResult}) = _QuizState;

  factory QuizState.initialize() => QuizState(
        questionGetModel: null,
        selectedIndex: null,
        answers: null,
        answerResult: null,
        loadingState: LoadingState.isInitial,
      );
}
