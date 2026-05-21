part of 'quiz_bloc.dart';

@freezed
class QuizEvent with _$QuizEvent {
  const factory QuizEvent.initialize() = _Initialize;
  const factory QuizEvent.sendAnswers() = _SendAnswers;
  const factory QuizEvent.nextQuestion() = _NextQuestion;
  const factory QuizEvent.previousQuestion() = _PreviousQuestion;
  const factory QuizEvent.setAnswerId(int answerId) = _SetAnswerId;
  const factory QuizEvent.reset() = _Reset;
  const factory QuizEvent.cleanResult() = _CleanResult;
}