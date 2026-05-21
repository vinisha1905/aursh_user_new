// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() sendAnswers,
    required TResult Function() nextQuestion,
    required TResult Function() previousQuestion,
    required TResult Function(int answerId) setAnswerId,
    required TResult Function() reset,
    required TResult Function() cleanResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? sendAnswers,
    TResult? Function()? nextQuestion,
    TResult? Function()? previousQuestion,
    TResult? Function(int answerId)? setAnswerId,
    TResult? Function()? reset,
    TResult? Function()? cleanResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? sendAnswers,
    TResult Function()? nextQuestion,
    TResult Function()? previousQuestion,
    TResult Function(int answerId)? setAnswerId,
    TResult Function()? reset,
    TResult Function()? cleanResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendAnswers value) sendAnswers,
    required TResult Function(_NextQuestion value) nextQuestion,
    required TResult Function(_PreviousQuestion value) previousQuestion,
    required TResult Function(_SetAnswerId value) setAnswerId,
    required TResult Function(_Reset value) reset,
    required TResult Function(_CleanResult value) cleanResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendAnswers value)? sendAnswers,
    TResult? Function(_NextQuestion value)? nextQuestion,
    TResult? Function(_PreviousQuestion value)? previousQuestion,
    TResult? Function(_SetAnswerId value)? setAnswerId,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_CleanResult value)? cleanResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendAnswers value)? sendAnswers,
    TResult Function(_NextQuestion value)? nextQuestion,
    TResult Function(_PreviousQuestion value)? previousQuestion,
    TResult Function(_SetAnswerId value)? setAnswerId,
    TResult Function(_Reset value)? reset,
    TResult Function(_CleanResult value)? cleanResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizEventCopyWith<$Res> {
  factory $QuizEventCopyWith(QuizEvent value, $Res Function(QuizEvent) then) =
      _$QuizEventCopyWithImpl<$Res, QuizEvent>;
}

/// @nodoc
class _$QuizEventCopyWithImpl<$Res, $Val extends QuizEvent>
    implements $QuizEventCopyWith<$Res> {
  _$QuizEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'QuizEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() sendAnswers,
    required TResult Function() nextQuestion,
    required TResult Function() previousQuestion,
    required TResult Function(int answerId) setAnswerId,
    required TResult Function() reset,
    required TResult Function() cleanResult,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? sendAnswers,
    TResult? Function()? nextQuestion,
    TResult? Function()? previousQuestion,
    TResult? Function(int answerId)? setAnswerId,
    TResult? Function()? reset,
    TResult? Function()? cleanResult,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? sendAnswers,
    TResult Function()? nextQuestion,
    TResult Function()? previousQuestion,
    TResult Function(int answerId)? setAnswerId,
    TResult Function()? reset,
    TResult Function()? cleanResult,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendAnswers value) sendAnswers,
    required TResult Function(_NextQuestion value) nextQuestion,
    required TResult Function(_PreviousQuestion value) previousQuestion,
    required TResult Function(_SetAnswerId value) setAnswerId,
    required TResult Function(_Reset value) reset,
    required TResult Function(_CleanResult value) cleanResult,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendAnswers value)? sendAnswers,
    TResult? Function(_NextQuestion value)? nextQuestion,
    TResult? Function(_PreviousQuestion value)? previousQuestion,
    TResult? Function(_SetAnswerId value)? setAnswerId,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_CleanResult value)? cleanResult,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendAnswers value)? sendAnswers,
    TResult Function(_NextQuestion value)? nextQuestion,
    TResult Function(_PreviousQuestion value)? previousQuestion,
    TResult Function(_SetAnswerId value)? setAnswerId,
    TResult Function(_Reset value)? reset,
    TResult Function(_CleanResult value)? cleanResult,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements QuizEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$SendAnswersImplCopyWith<$Res> {
  factory _$$SendAnswersImplCopyWith(
          _$SendAnswersImpl value, $Res Function(_$SendAnswersImpl) then) =
      __$$SendAnswersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendAnswersImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$SendAnswersImpl>
    implements _$$SendAnswersImplCopyWith<$Res> {
  __$$SendAnswersImplCopyWithImpl(
      _$SendAnswersImpl _value, $Res Function(_$SendAnswersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendAnswersImpl implements _SendAnswers {
  const _$SendAnswersImpl();

  @override
  String toString() {
    return 'QuizEvent.sendAnswers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendAnswersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() sendAnswers,
    required TResult Function() nextQuestion,
    required TResult Function() previousQuestion,
    required TResult Function(int answerId) setAnswerId,
    required TResult Function() reset,
    required TResult Function() cleanResult,
  }) {
    return sendAnswers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? sendAnswers,
    TResult? Function()? nextQuestion,
    TResult? Function()? previousQuestion,
    TResult? Function(int answerId)? setAnswerId,
    TResult? Function()? reset,
    TResult? Function()? cleanResult,
  }) {
    return sendAnswers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? sendAnswers,
    TResult Function()? nextQuestion,
    TResult Function()? previousQuestion,
    TResult Function(int answerId)? setAnswerId,
    TResult Function()? reset,
    TResult Function()? cleanResult,
    required TResult orElse(),
  }) {
    if (sendAnswers != null) {
      return sendAnswers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendAnswers value) sendAnswers,
    required TResult Function(_NextQuestion value) nextQuestion,
    required TResult Function(_PreviousQuestion value) previousQuestion,
    required TResult Function(_SetAnswerId value) setAnswerId,
    required TResult Function(_Reset value) reset,
    required TResult Function(_CleanResult value) cleanResult,
  }) {
    return sendAnswers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendAnswers value)? sendAnswers,
    TResult? Function(_NextQuestion value)? nextQuestion,
    TResult? Function(_PreviousQuestion value)? previousQuestion,
    TResult? Function(_SetAnswerId value)? setAnswerId,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_CleanResult value)? cleanResult,
  }) {
    return sendAnswers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendAnswers value)? sendAnswers,
    TResult Function(_NextQuestion value)? nextQuestion,
    TResult Function(_PreviousQuestion value)? previousQuestion,
    TResult Function(_SetAnswerId value)? setAnswerId,
    TResult Function(_Reset value)? reset,
    TResult Function(_CleanResult value)? cleanResult,
    required TResult orElse(),
  }) {
    if (sendAnswers != null) {
      return sendAnswers(this);
    }
    return orElse();
  }
}

abstract class _SendAnswers implements QuizEvent {
  const factory _SendAnswers() = _$SendAnswersImpl;
}

/// @nodoc
abstract class _$$NextQuestionImplCopyWith<$Res> {
  factory _$$NextQuestionImplCopyWith(
          _$NextQuestionImpl value, $Res Function(_$NextQuestionImpl) then) =
      __$$NextQuestionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextQuestionImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$NextQuestionImpl>
    implements _$$NextQuestionImplCopyWith<$Res> {
  __$$NextQuestionImplCopyWithImpl(
      _$NextQuestionImpl _value, $Res Function(_$NextQuestionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NextQuestionImpl implements _NextQuestion {
  const _$NextQuestionImpl();

  @override
  String toString() {
    return 'QuizEvent.nextQuestion()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NextQuestionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() sendAnswers,
    required TResult Function() nextQuestion,
    required TResult Function() previousQuestion,
    required TResult Function(int answerId) setAnswerId,
    required TResult Function() reset,
    required TResult Function() cleanResult,
  }) {
    return nextQuestion();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? sendAnswers,
    TResult? Function()? nextQuestion,
    TResult? Function()? previousQuestion,
    TResult? Function(int answerId)? setAnswerId,
    TResult? Function()? reset,
    TResult? Function()? cleanResult,
  }) {
    return nextQuestion?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? sendAnswers,
    TResult Function()? nextQuestion,
    TResult Function()? previousQuestion,
    TResult Function(int answerId)? setAnswerId,
    TResult Function()? reset,
    TResult Function()? cleanResult,
    required TResult orElse(),
  }) {
    if (nextQuestion != null) {
      return nextQuestion();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendAnswers value) sendAnswers,
    required TResult Function(_NextQuestion value) nextQuestion,
    required TResult Function(_PreviousQuestion value) previousQuestion,
    required TResult Function(_SetAnswerId value) setAnswerId,
    required TResult Function(_Reset value) reset,
    required TResult Function(_CleanResult value) cleanResult,
  }) {
    return nextQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendAnswers value)? sendAnswers,
    TResult? Function(_NextQuestion value)? nextQuestion,
    TResult? Function(_PreviousQuestion value)? previousQuestion,
    TResult? Function(_SetAnswerId value)? setAnswerId,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_CleanResult value)? cleanResult,
  }) {
    return nextQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendAnswers value)? sendAnswers,
    TResult Function(_NextQuestion value)? nextQuestion,
    TResult Function(_PreviousQuestion value)? previousQuestion,
    TResult Function(_SetAnswerId value)? setAnswerId,
    TResult Function(_Reset value)? reset,
    TResult Function(_CleanResult value)? cleanResult,
    required TResult orElse(),
  }) {
    if (nextQuestion != null) {
      return nextQuestion(this);
    }
    return orElse();
  }
}

abstract class _NextQuestion implements QuizEvent {
  const factory _NextQuestion() = _$NextQuestionImpl;
}

/// @nodoc
abstract class _$$PreviousQuestionImplCopyWith<$Res> {
  factory _$$PreviousQuestionImplCopyWith(_$PreviousQuestionImpl value,
          $Res Function(_$PreviousQuestionImpl) then) =
      __$$PreviousQuestionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PreviousQuestionImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$PreviousQuestionImpl>
    implements _$$PreviousQuestionImplCopyWith<$Res> {
  __$$PreviousQuestionImplCopyWithImpl(_$PreviousQuestionImpl _value,
      $Res Function(_$PreviousQuestionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PreviousQuestionImpl implements _PreviousQuestion {
  const _$PreviousQuestionImpl();

  @override
  String toString() {
    return 'QuizEvent.previousQuestion()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PreviousQuestionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() sendAnswers,
    required TResult Function() nextQuestion,
    required TResult Function() previousQuestion,
    required TResult Function(int answerId) setAnswerId,
    required TResult Function() reset,
    required TResult Function() cleanResult,
  }) {
    return previousQuestion();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? sendAnswers,
    TResult? Function()? nextQuestion,
    TResult? Function()? previousQuestion,
    TResult? Function(int answerId)? setAnswerId,
    TResult? Function()? reset,
    TResult? Function()? cleanResult,
  }) {
    return previousQuestion?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? sendAnswers,
    TResult Function()? nextQuestion,
    TResult Function()? previousQuestion,
    TResult Function(int answerId)? setAnswerId,
    TResult Function()? reset,
    TResult Function()? cleanResult,
    required TResult orElse(),
  }) {
    if (previousQuestion != null) {
      return previousQuestion();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendAnswers value) sendAnswers,
    required TResult Function(_NextQuestion value) nextQuestion,
    required TResult Function(_PreviousQuestion value) previousQuestion,
    required TResult Function(_SetAnswerId value) setAnswerId,
    required TResult Function(_Reset value) reset,
    required TResult Function(_CleanResult value) cleanResult,
  }) {
    return previousQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendAnswers value)? sendAnswers,
    TResult? Function(_NextQuestion value)? nextQuestion,
    TResult? Function(_PreviousQuestion value)? previousQuestion,
    TResult? Function(_SetAnswerId value)? setAnswerId,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_CleanResult value)? cleanResult,
  }) {
    return previousQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendAnswers value)? sendAnswers,
    TResult Function(_NextQuestion value)? nextQuestion,
    TResult Function(_PreviousQuestion value)? previousQuestion,
    TResult Function(_SetAnswerId value)? setAnswerId,
    TResult Function(_Reset value)? reset,
    TResult Function(_CleanResult value)? cleanResult,
    required TResult orElse(),
  }) {
    if (previousQuestion != null) {
      return previousQuestion(this);
    }
    return orElse();
  }
}

abstract class _PreviousQuestion implements QuizEvent {
  const factory _PreviousQuestion() = _$PreviousQuestionImpl;
}

/// @nodoc
abstract class _$$SetAnswerIdImplCopyWith<$Res> {
  factory _$$SetAnswerIdImplCopyWith(
          _$SetAnswerIdImpl value, $Res Function(_$SetAnswerIdImpl) then) =
      __$$SetAnswerIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int answerId});
}

/// @nodoc
class __$$SetAnswerIdImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$SetAnswerIdImpl>
    implements _$$SetAnswerIdImplCopyWith<$Res> {
  __$$SetAnswerIdImplCopyWithImpl(
      _$SetAnswerIdImpl _value, $Res Function(_$SetAnswerIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerId = null,
  }) {
    return _then(_$SetAnswerIdImpl(
      null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SetAnswerIdImpl implements _SetAnswerId {
  const _$SetAnswerIdImpl(this.answerId);

  @override
  final int answerId;

  @override
  String toString() {
    return 'QuizEvent.setAnswerId(answerId: $answerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetAnswerIdImpl &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, answerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetAnswerIdImplCopyWith<_$SetAnswerIdImpl> get copyWith =>
      __$$SetAnswerIdImplCopyWithImpl<_$SetAnswerIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() sendAnswers,
    required TResult Function() nextQuestion,
    required TResult Function() previousQuestion,
    required TResult Function(int answerId) setAnswerId,
    required TResult Function() reset,
    required TResult Function() cleanResult,
  }) {
    return setAnswerId(answerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? sendAnswers,
    TResult? Function()? nextQuestion,
    TResult? Function()? previousQuestion,
    TResult? Function(int answerId)? setAnswerId,
    TResult? Function()? reset,
    TResult? Function()? cleanResult,
  }) {
    return setAnswerId?.call(answerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? sendAnswers,
    TResult Function()? nextQuestion,
    TResult Function()? previousQuestion,
    TResult Function(int answerId)? setAnswerId,
    TResult Function()? reset,
    TResult Function()? cleanResult,
    required TResult orElse(),
  }) {
    if (setAnswerId != null) {
      return setAnswerId(answerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendAnswers value) sendAnswers,
    required TResult Function(_NextQuestion value) nextQuestion,
    required TResult Function(_PreviousQuestion value) previousQuestion,
    required TResult Function(_SetAnswerId value) setAnswerId,
    required TResult Function(_Reset value) reset,
    required TResult Function(_CleanResult value) cleanResult,
  }) {
    return setAnswerId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendAnswers value)? sendAnswers,
    TResult? Function(_NextQuestion value)? nextQuestion,
    TResult? Function(_PreviousQuestion value)? previousQuestion,
    TResult? Function(_SetAnswerId value)? setAnswerId,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_CleanResult value)? cleanResult,
  }) {
    return setAnswerId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendAnswers value)? sendAnswers,
    TResult Function(_NextQuestion value)? nextQuestion,
    TResult Function(_PreviousQuestion value)? previousQuestion,
    TResult Function(_SetAnswerId value)? setAnswerId,
    TResult Function(_Reset value)? reset,
    TResult Function(_CleanResult value)? cleanResult,
    required TResult orElse(),
  }) {
    if (setAnswerId != null) {
      return setAnswerId(this);
    }
    return orElse();
  }
}

abstract class _SetAnswerId implements QuizEvent {
  const factory _SetAnswerId(final int answerId) = _$SetAnswerIdImpl;

  int get answerId;
  @JsonKey(ignore: true)
  _$$SetAnswerIdImplCopyWith<_$SetAnswerIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'QuizEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() sendAnswers,
    required TResult Function() nextQuestion,
    required TResult Function() previousQuestion,
    required TResult Function(int answerId) setAnswerId,
    required TResult Function() reset,
    required TResult Function() cleanResult,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? sendAnswers,
    TResult? Function()? nextQuestion,
    TResult? Function()? previousQuestion,
    TResult? Function(int answerId)? setAnswerId,
    TResult? Function()? reset,
    TResult? Function()? cleanResult,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? sendAnswers,
    TResult Function()? nextQuestion,
    TResult Function()? previousQuestion,
    TResult Function(int answerId)? setAnswerId,
    TResult Function()? reset,
    TResult Function()? cleanResult,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendAnswers value) sendAnswers,
    required TResult Function(_NextQuestion value) nextQuestion,
    required TResult Function(_PreviousQuestion value) previousQuestion,
    required TResult Function(_SetAnswerId value) setAnswerId,
    required TResult Function(_Reset value) reset,
    required TResult Function(_CleanResult value) cleanResult,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendAnswers value)? sendAnswers,
    TResult? Function(_NextQuestion value)? nextQuestion,
    TResult? Function(_PreviousQuestion value)? previousQuestion,
    TResult? Function(_SetAnswerId value)? setAnswerId,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_CleanResult value)? cleanResult,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendAnswers value)? sendAnswers,
    TResult Function(_NextQuestion value)? nextQuestion,
    TResult Function(_PreviousQuestion value)? previousQuestion,
    TResult Function(_SetAnswerId value)? setAnswerId,
    TResult Function(_Reset value)? reset,
    TResult Function(_CleanResult value)? cleanResult,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements QuizEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
abstract class _$$CleanResultImplCopyWith<$Res> {
  factory _$$CleanResultImplCopyWith(
          _$CleanResultImpl value, $Res Function(_$CleanResultImpl) then) =
      __$$CleanResultImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CleanResultImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$CleanResultImpl>
    implements _$$CleanResultImplCopyWith<$Res> {
  __$$CleanResultImplCopyWithImpl(
      _$CleanResultImpl _value, $Res Function(_$CleanResultImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CleanResultImpl implements _CleanResult {
  const _$CleanResultImpl();

  @override
  String toString() {
    return 'QuizEvent.cleanResult()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CleanResultImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() sendAnswers,
    required TResult Function() nextQuestion,
    required TResult Function() previousQuestion,
    required TResult Function(int answerId) setAnswerId,
    required TResult Function() reset,
    required TResult Function() cleanResult,
  }) {
    return cleanResult();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? sendAnswers,
    TResult? Function()? nextQuestion,
    TResult? Function()? previousQuestion,
    TResult? Function(int answerId)? setAnswerId,
    TResult? Function()? reset,
    TResult? Function()? cleanResult,
  }) {
    return cleanResult?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? sendAnswers,
    TResult Function()? nextQuestion,
    TResult Function()? previousQuestion,
    TResult Function(int answerId)? setAnswerId,
    TResult Function()? reset,
    TResult Function()? cleanResult,
    required TResult orElse(),
  }) {
    if (cleanResult != null) {
      return cleanResult();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendAnswers value) sendAnswers,
    required TResult Function(_NextQuestion value) nextQuestion,
    required TResult Function(_PreviousQuestion value) previousQuestion,
    required TResult Function(_SetAnswerId value) setAnswerId,
    required TResult Function(_Reset value) reset,
    required TResult Function(_CleanResult value) cleanResult,
  }) {
    return cleanResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendAnswers value)? sendAnswers,
    TResult? Function(_NextQuestion value)? nextQuestion,
    TResult? Function(_PreviousQuestion value)? previousQuestion,
    TResult? Function(_SetAnswerId value)? setAnswerId,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_CleanResult value)? cleanResult,
  }) {
    return cleanResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendAnswers value)? sendAnswers,
    TResult Function(_NextQuestion value)? nextQuestion,
    TResult Function(_PreviousQuestion value)? previousQuestion,
    TResult Function(_SetAnswerId value)? setAnswerId,
    TResult Function(_Reset value)? reset,
    TResult Function(_CleanResult value)? cleanResult,
    required TResult orElse(),
  }) {
    if (cleanResult != null) {
      return cleanResult(this);
    }
    return orElse();
  }
}

abstract class _CleanResult implements QuizEvent {
  const factory _CleanResult() = _$CleanResultImpl;
}

/// @nodoc
mixin _$QuizState {
  QuestionGetModel? get questionGetModel => throw _privateConstructorUsedError;
  int? get selectedIndex => throw _privateConstructorUsedError;
  HashMap<int, int?>? get answers => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  Either<String, AnswerResponse>? get answerResult =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizStateCopyWith<QuizState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStateCopyWith<$Res> {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) then) =
      _$QuizStateCopyWithImpl<$Res, QuizState>;
  @useResult
  $Res call(
      {QuestionGetModel? questionGetModel,
      int? selectedIndex,
      HashMap<int, int?>? answers,
      LoadingState loadingState,
      Either<String, AnswerResponse>? answerResult});
}

/// @nodoc
class _$QuizStateCopyWithImpl<$Res, $Val extends QuizState>
    implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionGetModel = freezed,
    Object? selectedIndex = freezed,
    Object? answers = freezed,
    Object? loadingState = null,
    Object? answerResult = freezed,
  }) {
    return _then(_value.copyWith(
      questionGetModel: freezed == questionGetModel
          ? _value.questionGetModel
          : questionGetModel // ignore: cast_nullable_to_non_nullable
              as QuestionGetModel?,
      selectedIndex: freezed == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      answers: freezed == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as HashMap<int, int?>?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      answerResult: freezed == answerResult
          ? _value.answerResult
          : answerResult // ignore: cast_nullable_to_non_nullable
              as Either<String, AnswerResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizStateImplCopyWith<$Res>
    implements $QuizStateCopyWith<$Res> {
  factory _$$QuizStateImplCopyWith(
          _$QuizStateImpl value, $Res Function(_$QuizStateImpl) then) =
      __$$QuizStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {QuestionGetModel? questionGetModel,
      int? selectedIndex,
      HashMap<int, int?>? answers,
      LoadingState loadingState,
      Either<String, AnswerResponse>? answerResult});
}

/// @nodoc
class __$$QuizStateImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizStateImpl>
    implements _$$QuizStateImplCopyWith<$Res> {
  __$$QuizStateImplCopyWithImpl(
      _$QuizStateImpl _value, $Res Function(_$QuizStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionGetModel = freezed,
    Object? selectedIndex = freezed,
    Object? answers = freezed,
    Object? loadingState = null,
    Object? answerResult = freezed,
  }) {
    return _then(_$QuizStateImpl(
      questionGetModel: freezed == questionGetModel
          ? _value.questionGetModel
          : questionGetModel // ignore: cast_nullable_to_non_nullable
              as QuestionGetModel?,
      selectedIndex: freezed == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      answers: freezed == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as HashMap<int, int?>?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      answerResult: freezed == answerResult
          ? _value.answerResult
          : answerResult // ignore: cast_nullable_to_non_nullable
              as Either<String, AnswerResponse>?,
    ));
  }
}

/// @nodoc

class _$QuizStateImpl implements _QuizState {
  const _$QuizStateImpl(
      {required this.questionGetModel,
      required this.selectedIndex,
      required this.answers,
      required this.loadingState,
      required this.answerResult});

  @override
  final QuestionGetModel? questionGetModel;
  @override
  final int? selectedIndex;
  @override
  final HashMap<int, int?>? answers;
  @override
  final LoadingState loadingState;
  @override
  final Either<String, AnswerResponse>? answerResult;

  @override
  String toString() {
    return 'QuizState(questionGetModel: $questionGetModel, selectedIndex: $selectedIndex, answers: $answers, loadingState: $loadingState, answerResult: $answerResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizStateImpl &&
            (identical(other.questionGetModel, questionGetModel) ||
                other.questionGetModel == questionGetModel) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            const DeepCollectionEquality().equals(other.answers, answers) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.answerResult, answerResult) ||
                other.answerResult == answerResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionGetModel, selectedIndex,
      const DeepCollectionEquality().hash(answers), loadingState, answerResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizStateImplCopyWith<_$QuizStateImpl> get copyWith =>
      __$$QuizStateImplCopyWithImpl<_$QuizStateImpl>(this, _$identity);
}

abstract class _QuizState implements QuizState {
  const factory _QuizState(
          {required final QuestionGetModel? questionGetModel,
          required final int? selectedIndex,
          required final HashMap<int, int?>? answers,
          required final LoadingState loadingState,
          required final Either<String, AnswerResponse>? answerResult}) =
      _$QuizStateImpl;

  @override
  QuestionGetModel? get questionGetModel;
  @override
  int? get selectedIndex;
  @override
  HashMap<int, int?>? get answers;
  @override
  LoadingState get loadingState;
  @override
  Either<String, AnswerResponse>? get answerResult;
  @override
  @JsonKey(ignore: true)
  _$$QuizStateImplCopyWith<_$QuizStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
