import 'dart:collection';

import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/answer_response.dart';
import 'package:ayursh/domain/model/response/question_get_model.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_bloc.freezed.dart';

part 'quiz_event.dart';

part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final OnboardingRepository onboardingRepository;

  QuizBloc({required this.onboardingRepository})
      : super(QuizState.initialize());

  @override
  Stream<QuizState> mapEventToState(QuizEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var response = await onboardingRepository.getQuestion();
      yield* response.fold((error) async* {
        yield state.copyWith(loadingState: LoadingState.isCompleted);
      }, (getQuestionResp) async* {
        if (getQuestionResp.success &&
            getQuestionResp.questionGetModel != null &&
            getQuestionResp.questionGetModel!.questions.isNotEmpty) {
          HashMap<int, int?> answers = HashMap();
          // getQuestionResp.questionGetModel!.questions
          //     .forEachIndexed((index, question) {
          //   answers[index] = null;
          // });
          for (int index = 0;
              index <= getQuestionResp.questionGetModel!.questions.length;
              index++) {
            answers[index] = null;
          }
          yield state.copyWith(
              questionGetModel: getQuestionResp.questionGetModel,
              answers: answers,
              loadingState: LoadingState.isCompleted);
        } else {
          yield state.copyWith(loadingState: LoadingState.isCompleted);
        }
      });
    }, sendAnswers: (e) async* {
      List<int> answers = [];
      state.answers!.forEach((key, value) {
        if (value != null) {
          answers.add(value);
        }
      });

      yield state.copyWith(loadingState: LoadingState.isLoading);
      var response = await onboardingRepository.sendAnswer(answers);
      yield state.copyWith(
          loadingState: LoadingState.isCompleted, answerResult: response);
    }, setAnswerId: (e) async* {
      var answers = state.answers!;
      HashMap<int, int?> newAnswers = HashMap()..addAll(answers);
      newAnswers[state.selectedIndex!] = e.answerId;
      yield state.copyWith(answers: newAnswers);
    }, nextQuestion: (e) async* {
      var selectedIndex = state.selectedIndex;
      if (selectedIndex == null) {
        yield state.copyWith(selectedIndex: 0);
      } else if (selectedIndex < state.questionGetModel!.questions.length - 1) {
        yield state.copyWith(selectedIndex: selectedIndex + 1);
      } else {
        add(QuizEvent.sendAnswers());
      }
    }, previousQuestion: (e) async* {
      if (state.selectedIndex! > 0) {
        yield state.copyWith(selectedIndex: state.selectedIndex! - 1);
      }
    }, reset: (e) async* {
      HashMap<int, int?> answers = HashMap();
      for (int index = 0;
          index <= state.questionGetModel!.questions.length;
          index++) {
        answers[index] = null;
      }
      // state.questionGetModel!.questions.forEachIndexed((index, question) {
      //   answers[index] = null;
      // });
      yield state.copyWith(selectedIndex: null, answers: answers);
    }, cleanResult: (e) async* {
      yield state.copyWith(answerResult: null);
    });
  }
}
