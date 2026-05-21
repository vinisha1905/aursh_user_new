// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DoctorDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel doctorModel, SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() getDoctorDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel doctorModel, SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? getDoctorDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel doctorModel, SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? getDoctorDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetDoctorDetail value) getDoctorDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetDoctorDetail value)? getDoctorDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetDoctorDetail value)? getDoctorDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorDetailEventCopyWith<$Res> {
  factory $DoctorDetailEventCopyWith(
          DoctorDetailEvent value, $Res Function(DoctorDetailEvent) then) =
      _$DoctorDetailEventCopyWithImpl<$Res, DoctorDetailEvent>;
}

/// @nodoc
class _$DoctorDetailEventCopyWithImpl<$Res, $Val extends DoctorDetailEvent>
    implements $DoctorDetailEventCopyWith<$Res> {
  _$DoctorDetailEventCopyWithImpl(this._value, this._then);

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
  $Res call(
      {DoctorModel doctorModel, SessionSelectedInfo? sessionSelectedInfo});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$DoctorDetailEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorModel = null,
    Object? sessionSelectedInfo = freezed,
  }) {
    return _then(_$InitializeImpl(
      null == doctorModel
          ? _value.doctorModel
          : doctorModel // ignore: cast_nullable_to_non_nullable
              as DoctorModel,
      freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.doctorModel, this.sessionSelectedInfo);

  @override
  final DoctorModel doctorModel;
  @override
  final SessionSelectedInfo? sessionSelectedInfo;

  @override
  String toString() {
    return 'DoctorDetailEvent.initialize(doctorModel: $doctorModel, sessionSelectedInfo: $sessionSelectedInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.doctorModel, doctorModel) ||
                other.doctorModel == doctorModel) &&
            (identical(other.sessionSelectedInfo, sessionSelectedInfo) ||
                other.sessionSelectedInfo == sessionSelectedInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, doctorModel, sessionSelectedInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel doctorModel, SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() getDoctorDetail,
  }) {
    return initialize(doctorModel, sessionSelectedInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel doctorModel, SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? getDoctorDetail,
  }) {
    return initialize?.call(doctorModel, sessionSelectedInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel doctorModel, SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? getDoctorDetail,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(doctorModel, sessionSelectedInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetDoctorDetail value) getDoctorDetail,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetDoctorDetail value)? getDoctorDetail,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetDoctorDetail value)? getDoctorDetail,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements DoctorDetailEvent {
  const factory _Initialize(final DoctorModel doctorModel,
      final SessionSelectedInfo? sessionSelectedInfo) = _$InitializeImpl;

  DoctorModel get doctorModel;
  SessionSelectedInfo? get sessionSelectedInfo;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetDoctorDetailImplCopyWith<$Res> {
  factory _$$GetDoctorDetailImplCopyWith(_$GetDoctorDetailImpl value,
          $Res Function(_$GetDoctorDetailImpl) then) =
      __$$GetDoctorDetailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDoctorDetailImplCopyWithImpl<$Res>
    extends _$DoctorDetailEventCopyWithImpl<$Res, _$GetDoctorDetailImpl>
    implements _$$GetDoctorDetailImplCopyWith<$Res> {
  __$$GetDoctorDetailImplCopyWithImpl(
      _$GetDoctorDetailImpl _value, $Res Function(_$GetDoctorDetailImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetDoctorDetailImpl implements _GetDoctorDetail {
  const _$GetDoctorDetailImpl();

  @override
  String toString() {
    return 'DoctorDetailEvent.getDoctorDetail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDoctorDetailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel doctorModel, SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() getDoctorDetail,
  }) {
    return getDoctorDetail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel doctorModel, SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? getDoctorDetail,
  }) {
    return getDoctorDetail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel doctorModel, SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? getDoctorDetail,
    required TResult orElse(),
  }) {
    if (getDoctorDetail != null) {
      return getDoctorDetail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetDoctorDetail value) getDoctorDetail,
  }) {
    return getDoctorDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetDoctorDetail value)? getDoctorDetail,
  }) {
    return getDoctorDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetDoctorDetail value)? getDoctorDetail,
    required TResult orElse(),
  }) {
    if (getDoctorDetail != null) {
      return getDoctorDetail(this);
    }
    return orElse();
  }
}

abstract class _GetDoctorDetail implements DoctorDetailEvent {
  const factory _GetDoctorDetail() = _$GetDoctorDetailImpl;
}

/// @nodoc
mixin _$DoctorDetailState {
  DoctorModel? get doctorModel => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  SessionSelectedInfo? get sessionSelectedInfo =>
      throw _privateConstructorUsedError;
  Either<String, DoctorDetailResponse>? get result =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DoctorDetailStateCopyWith<DoctorDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorDetailStateCopyWith<$Res> {
  factory $DoctorDetailStateCopyWith(
          DoctorDetailState value, $Res Function(DoctorDetailState) then) =
      _$DoctorDetailStateCopyWithImpl<$Res, DoctorDetailState>;
  @useResult
  $Res call(
      {DoctorModel? doctorModel,
      LoadingState loadingState,
      SessionSelectedInfo? sessionSelectedInfo,
      Either<String, DoctorDetailResponse>? result});
}

/// @nodoc
class _$DoctorDetailStateCopyWithImpl<$Res, $Val extends DoctorDetailState>
    implements $DoctorDetailStateCopyWith<$Res> {
  _$DoctorDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorModel = freezed,
    Object? loadingState = null,
    Object? sessionSelectedInfo = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      doctorModel: freezed == doctorModel
          ? _value.doctorModel
          : doctorModel // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      sessionSelectedInfo: freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Either<String, DoctorDetailResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorDetailStateImplCopyWith<$Res>
    implements $DoctorDetailStateCopyWith<$Res> {
  factory _$$DoctorDetailStateImplCopyWith(_$DoctorDetailStateImpl value,
          $Res Function(_$DoctorDetailStateImpl) then) =
      __$$DoctorDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DoctorModel? doctorModel,
      LoadingState loadingState,
      SessionSelectedInfo? sessionSelectedInfo,
      Either<String, DoctorDetailResponse>? result});
}

/// @nodoc
class __$$DoctorDetailStateImplCopyWithImpl<$Res>
    extends _$DoctorDetailStateCopyWithImpl<$Res, _$DoctorDetailStateImpl>
    implements _$$DoctorDetailStateImplCopyWith<$Res> {
  __$$DoctorDetailStateImplCopyWithImpl(_$DoctorDetailStateImpl _value,
      $Res Function(_$DoctorDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorModel = freezed,
    Object? loadingState = null,
    Object? sessionSelectedInfo = freezed,
    Object? result = freezed,
  }) {
    return _then(_$DoctorDetailStateImpl(
      doctorModel: freezed == doctorModel
          ? _value.doctorModel
          : doctorModel // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      sessionSelectedInfo: freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Either<String, DoctorDetailResponse>?,
    ));
  }
}

/// @nodoc

class _$DoctorDetailStateImpl implements _DoctorDetailState {
  const _$DoctorDetailStateImpl(
      {required this.doctorModel,
      required this.loadingState,
      this.sessionSelectedInfo,
      required this.result});

  @override
  final DoctorModel? doctorModel;
  @override
  final LoadingState loadingState;
  @override
  final SessionSelectedInfo? sessionSelectedInfo;
  @override
  final Either<String, DoctorDetailResponse>? result;

  @override
  String toString() {
    return 'DoctorDetailState(doctorModel: $doctorModel, loadingState: $loadingState, sessionSelectedInfo: $sessionSelectedInfo, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorDetailStateImpl &&
            (identical(other.doctorModel, doctorModel) ||
                other.doctorModel == doctorModel) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.sessionSelectedInfo, sessionSelectedInfo) ||
                other.sessionSelectedInfo == sessionSelectedInfo) &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, doctorModel, loadingState, sessionSelectedInfo, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorDetailStateImplCopyWith<_$DoctorDetailStateImpl> get copyWith =>
      __$$DoctorDetailStateImplCopyWithImpl<_$DoctorDetailStateImpl>(
          this, _$identity);
}

abstract class _DoctorDetailState implements DoctorDetailState {
  const factory _DoctorDetailState(
          {required final DoctorModel? doctorModel,
          required final LoadingState loadingState,
          final SessionSelectedInfo? sessionSelectedInfo,
          required final Either<String, DoctorDetailResponse>? result}) =
      _$DoctorDetailStateImpl;

  @override
  DoctorModel? get doctorModel;
  @override
  LoadingState get loadingState;
  @override
  SessionSelectedInfo? get sessionSelectedInfo;
  @override
  Either<String, DoctorDetailResponse>? get result;
  @override
  @JsonKey(ignore: true)
  _$$DoctorDetailStateImplCopyWith<_$DoctorDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
