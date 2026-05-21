// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_and_conditions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TermsAndConditionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String therapyType) initialize,
    required TResult Function() setAgree,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String therapyType)? initialize,
    TResult? Function()? setAgree,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String therapyType)? initialize,
    TResult Function()? setAgree,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetAgree value) setAgree,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetAgree value)? setAgree,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetAgree value)? setAgree,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsAndConditionsEventCopyWith<$Res> {
  factory $TermsAndConditionsEventCopyWith(TermsAndConditionsEvent value,
          $Res Function(TermsAndConditionsEvent) then) =
      _$TermsAndConditionsEventCopyWithImpl<$Res, TermsAndConditionsEvent>;
}

/// @nodoc
class _$TermsAndConditionsEventCopyWithImpl<$Res,
        $Val extends TermsAndConditionsEvent>
    implements $TermsAndConditionsEventCopyWith<$Res> {
  _$TermsAndConditionsEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call({String therapyType});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$TermsAndConditionsEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? therapyType = null,
  }) {
    return _then(_$InitializeImpl(
      therapyType: null == therapyType
          ? _value.therapyType
          : therapyType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl({required this.therapyType});

  @override
  final String therapyType;

  @override
  String toString() {
    return 'TermsAndConditionsEvent.initialize(therapyType: $therapyType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.therapyType, therapyType) ||
                other.therapyType == therapyType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, therapyType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String therapyType) initialize,
    required TResult Function() setAgree,
  }) {
    return initialize(therapyType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String therapyType)? initialize,
    TResult? Function()? setAgree,
  }) {
    return initialize?.call(therapyType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String therapyType)? initialize,
    TResult Function()? setAgree,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(therapyType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetAgree value) setAgree,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetAgree value)? setAgree,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetAgree value)? setAgree,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements TermsAndConditionsEvent {
  const factory _Initialize({required final String therapyType}) =
      _$InitializeImpl;

  String get therapyType;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetAgreeImplCopyWith<$Res> {
  factory _$$SetAgreeImplCopyWith(
          _$SetAgreeImpl value, $Res Function(_$SetAgreeImpl) then) =
      __$$SetAgreeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetAgreeImplCopyWithImpl<$Res>
    extends _$TermsAndConditionsEventCopyWithImpl<$Res, _$SetAgreeImpl>
    implements _$$SetAgreeImplCopyWith<$Res> {
  __$$SetAgreeImplCopyWithImpl(
      _$SetAgreeImpl _value, $Res Function(_$SetAgreeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SetAgreeImpl implements _SetAgree {
  const _$SetAgreeImpl();

  @override
  String toString() {
    return 'TermsAndConditionsEvent.setAgree()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SetAgreeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String therapyType) initialize,
    required TResult Function() setAgree,
  }) {
    return setAgree();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String therapyType)? initialize,
    TResult? Function()? setAgree,
  }) {
    return setAgree?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String therapyType)? initialize,
    TResult Function()? setAgree,
    required TResult orElse(),
  }) {
    if (setAgree != null) {
      return setAgree();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetAgree value) setAgree,
  }) {
    return setAgree(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetAgree value)? setAgree,
  }) {
    return setAgree?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetAgree value)? setAgree,
    required TResult orElse(),
  }) {
    if (setAgree != null) {
      return setAgree(this);
    }
    return orElse();
  }
}

abstract class _SetAgree implements TermsAndConditionsEvent {
  const factory _SetAgree() = _$SetAgreeImpl;
}

/// @nodoc
mixin _$TermsAndConditionsState {
  LoadingState get loadingState => throw _privateConstructorUsedError;
  bool get isAgree => throw _privateConstructorUsedError;
  List<String>? get contents => throw _privateConstructorUsedError;
  TherapyBookingInfo? get therapyBookingInfo =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TermsAndConditionsStateCopyWith<TermsAndConditionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsAndConditionsStateCopyWith<$Res> {
  factory $TermsAndConditionsStateCopyWith(TermsAndConditionsState value,
          $Res Function(TermsAndConditionsState) then) =
      _$TermsAndConditionsStateCopyWithImpl<$Res, TermsAndConditionsState>;
  @useResult
  $Res call(
      {LoadingState loadingState,
      bool isAgree,
      List<String>? contents,
      TherapyBookingInfo? therapyBookingInfo});
}

/// @nodoc
class _$TermsAndConditionsStateCopyWithImpl<$Res,
        $Val extends TermsAndConditionsState>
    implements $TermsAndConditionsStateCopyWith<$Res> {
  _$TermsAndConditionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? isAgree = null,
    Object? contents = freezed,
    Object? therapyBookingInfo = freezed,
  }) {
    return _then(_value.copyWith(
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      isAgree: null == isAgree
          ? _value.isAgree
          : isAgree // ignore: cast_nullable_to_non_nullable
              as bool,
      contents: freezed == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      therapyBookingInfo: freezed == therapyBookingInfo
          ? _value.therapyBookingInfo
          : therapyBookingInfo // ignore: cast_nullable_to_non_nullable
              as TherapyBookingInfo?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TermsAndConditionsStateImplCopyWith<$Res>
    implements $TermsAndConditionsStateCopyWith<$Res> {
  factory _$$TermsAndConditionsStateImplCopyWith(
          _$TermsAndConditionsStateImpl value,
          $Res Function(_$TermsAndConditionsStateImpl) then) =
      __$$TermsAndConditionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingState loadingState,
      bool isAgree,
      List<String>? contents,
      TherapyBookingInfo? therapyBookingInfo});
}

/// @nodoc
class __$$TermsAndConditionsStateImplCopyWithImpl<$Res>
    extends _$TermsAndConditionsStateCopyWithImpl<$Res,
        _$TermsAndConditionsStateImpl>
    implements _$$TermsAndConditionsStateImplCopyWith<$Res> {
  __$$TermsAndConditionsStateImplCopyWithImpl(
      _$TermsAndConditionsStateImpl _value,
      $Res Function(_$TermsAndConditionsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? isAgree = null,
    Object? contents = freezed,
    Object? therapyBookingInfo = freezed,
  }) {
    return _then(_$TermsAndConditionsStateImpl(
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      isAgree: null == isAgree
          ? _value.isAgree
          : isAgree // ignore: cast_nullable_to_non_nullable
              as bool,
      contents: freezed == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      therapyBookingInfo: freezed == therapyBookingInfo
          ? _value.therapyBookingInfo
          : therapyBookingInfo // ignore: cast_nullable_to_non_nullable
              as TherapyBookingInfo?,
    ));
  }
}

/// @nodoc

class _$TermsAndConditionsStateImpl implements _TermsAndConditionsState {
  const _$TermsAndConditionsStateImpl(
      {required this.loadingState,
      required this.isAgree,
      required final List<String>? contents,
      required this.therapyBookingInfo})
      : _contents = contents;

  @override
  final LoadingState loadingState;
  @override
  final bool isAgree;
  final List<String>? _contents;
  @override
  List<String>? get contents {
    final value = _contents;
    if (value == null) return null;
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TherapyBookingInfo? therapyBookingInfo;

  @override
  String toString() {
    return 'TermsAndConditionsState(loadingState: $loadingState, isAgree: $isAgree, contents: $contents, therapyBookingInfo: $therapyBookingInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermsAndConditionsStateImpl &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.isAgree, isAgree) || other.isAgree == isAgree) &&
            const DeepCollectionEquality().equals(other._contents, _contents) &&
            (identical(other.therapyBookingInfo, therapyBookingInfo) ||
                other.therapyBookingInfo == therapyBookingInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingState, isAgree,
      const DeepCollectionEquality().hash(_contents), therapyBookingInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TermsAndConditionsStateImplCopyWith<_$TermsAndConditionsStateImpl>
      get copyWith => __$$TermsAndConditionsStateImplCopyWithImpl<
          _$TermsAndConditionsStateImpl>(this, _$identity);
}

abstract class _TermsAndConditionsState implements TermsAndConditionsState {
  const factory _TermsAndConditionsState(
          {required final LoadingState loadingState,
          required final bool isAgree,
          required final List<String>? contents,
          required final TherapyBookingInfo? therapyBookingInfo}) =
      _$TermsAndConditionsStateImpl;

  @override
  LoadingState get loadingState;
  @override
  bool get isAgree;
  @override
  List<String>? get contents;
  @override
  TherapyBookingInfo? get therapyBookingInfo;
  @override
  @JsonKey(ignore: true)
  _$$TermsAndConditionsStateImplCopyWith<_$TermsAndConditionsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
