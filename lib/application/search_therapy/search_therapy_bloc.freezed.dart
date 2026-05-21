// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_therapy_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchTherapyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String keyword) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String keyword)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String keyword)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Search value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Search value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTherapyEventCopyWith<$Res> {
  factory $SearchTherapyEventCopyWith(
          SearchTherapyEvent value, $Res Function(SearchTherapyEvent) then) =
      _$SearchTherapyEventCopyWithImpl<$Res, SearchTherapyEvent>;
}

/// @nodoc
class _$SearchTherapyEventCopyWithImpl<$Res, $Val extends SearchTherapyEvent>
    implements $SearchTherapyEventCopyWith<$Res> {
  _$SearchTherapyEventCopyWithImpl(this._value, this._then);

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
    extends _$SearchTherapyEventCopyWithImpl<$Res, _$InitializeImpl>
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
    return 'SearchTherapyEvent.initialize()';
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
    required TResult Function(String keyword) search,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String keyword)? search,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String keyword)? search,
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
    required TResult Function(_Search value) search,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Search value)? search,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements SearchTherapyEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$SearchTherapyEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_$SearchImpl(
      null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchImpl implements _Search {
  const _$SearchImpl(this.keyword);

  @override
  final String keyword;

  @override
  String toString() {
    return 'SearchTherapyEvent.search(keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String keyword) search,
  }) {
    return search(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String keyword)? search,
  }) {
    return search?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String keyword)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Search value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Search value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements SearchTherapyEvent {
  const factory _Search(final String keyword) = _$SearchImpl;

  String get keyword;
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchTherapyState {
  String? get keyword => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  Either<String, SearchTherapyResponse>? get result =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchTherapyStateCopyWith<SearchTherapyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTherapyStateCopyWith<$Res> {
  factory $SearchTherapyStateCopyWith(
          SearchTherapyState value, $Res Function(SearchTherapyState) then) =
      _$SearchTherapyStateCopyWithImpl<$Res, SearchTherapyState>;
  @useResult
  $Res call(
      {String? keyword,
      LoadingState loadingState,
      Either<String, SearchTherapyResponse>? result});
}

/// @nodoc
class _$SearchTherapyStateCopyWithImpl<$Res, $Val extends SearchTherapyState>
    implements $SearchTherapyStateCopyWith<$Res> {
  _$SearchTherapyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
    Object? loadingState = null,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Either<String, SearchTherapyResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchTherapyStateImplCopyWith<$Res>
    implements $SearchTherapyStateCopyWith<$Res> {
  factory _$$SearchTherapyStateImplCopyWith(_$SearchTherapyStateImpl value,
          $Res Function(_$SearchTherapyStateImpl) then) =
      __$$SearchTherapyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? keyword,
      LoadingState loadingState,
      Either<String, SearchTherapyResponse>? result});
}

/// @nodoc
class __$$SearchTherapyStateImplCopyWithImpl<$Res>
    extends _$SearchTherapyStateCopyWithImpl<$Res, _$SearchTherapyStateImpl>
    implements _$$SearchTherapyStateImplCopyWith<$Res> {
  __$$SearchTherapyStateImplCopyWithImpl(_$SearchTherapyStateImpl _value,
      $Res Function(_$SearchTherapyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
    Object? loadingState = null,
    Object? result = freezed,
  }) {
    return _then(_$SearchTherapyStateImpl(
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Either<String, SearchTherapyResponse>?,
    ));
  }
}

/// @nodoc

class _$SearchTherapyStateImpl implements _SearchTherapyState {
  const _$SearchTherapyStateImpl(
      {required this.keyword,
      required this.loadingState,
      required this.result});

  @override
  final String? keyword;
  @override
  final LoadingState loadingState;
  @override
  final Either<String, SearchTherapyResponse>? result;

  @override
  String toString() {
    return 'SearchTherapyState(keyword: $keyword, loadingState: $loadingState, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTherapyStateImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword, loadingState, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTherapyStateImplCopyWith<_$SearchTherapyStateImpl> get copyWith =>
      __$$SearchTherapyStateImplCopyWithImpl<_$SearchTherapyStateImpl>(
          this, _$identity);
}

abstract class _SearchTherapyState implements SearchTherapyState {
  const factory _SearchTherapyState(
          {required final String? keyword,
          required final LoadingState loadingState,
          required final Either<String, SearchTherapyResponse>? result}) =
      _$SearchTherapyStateImpl;

  @override
  String? get keyword;
  @override
  LoadingState get loadingState;
  @override
  Either<String, SearchTherapyResponse>? get result;
  @override
  @JsonKey(ignore: true)
  _$$SearchTherapyStateImplCopyWith<_$SearchTherapyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
