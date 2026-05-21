// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DoctorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() getDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionSelectedInfo? sessionSelectedInfo)? initialize,
    TResult? Function()? getDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionSelectedInfo? sessionSelectedInfo)? initialize,
    TResult Function()? getDoctors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetDoctors value) getDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetDoctors value)? getDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetDoctors value)? getDoctors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorEventCopyWith<$Res> {
  factory $DoctorEventCopyWith(
          DoctorEvent value, $Res Function(DoctorEvent) then) =
      _$DoctorEventCopyWithImpl<$Res, DoctorEvent>;
}

/// @nodoc
class _$DoctorEventCopyWithImpl<$Res, $Val extends DoctorEvent>
    implements $DoctorEventCopyWith<$Res> {
  _$DoctorEventCopyWithImpl(this._value, this._then);

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
  $Res call({SessionSelectedInfo? sessionSelectedInfo});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$DoctorEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionSelectedInfo = freezed,
  }) {
    return _then(_$InitializeImpl(
      freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.sessionSelectedInfo);

  @override
  final SessionSelectedInfo? sessionSelectedInfo;

  @override
  String toString() {
    return 'DoctorEvent.initialize(sessionSelectedInfo: $sessionSelectedInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.sessionSelectedInfo, sessionSelectedInfo) ||
                other.sessionSelectedInfo == sessionSelectedInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionSelectedInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() getDoctors,
  }) {
    return initialize(sessionSelectedInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionSelectedInfo? sessionSelectedInfo)? initialize,
    TResult? Function()? getDoctors,
  }) {
    return initialize?.call(sessionSelectedInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionSelectedInfo? sessionSelectedInfo)? initialize,
    TResult Function()? getDoctors,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(sessionSelectedInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetDoctors value) getDoctors,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetDoctors value)? getDoctors,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetDoctors value)? getDoctors,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements DoctorEvent {
  const factory _Initialize(final SessionSelectedInfo? sessionSelectedInfo) =
      _$InitializeImpl;

  SessionSelectedInfo? get sessionSelectedInfo;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetDoctorsImplCopyWith<$Res> {
  factory _$$GetDoctorsImplCopyWith(
          _$GetDoctorsImpl value, $Res Function(_$GetDoctorsImpl) then) =
      __$$GetDoctorsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDoctorsImplCopyWithImpl<$Res>
    extends _$DoctorEventCopyWithImpl<$Res, _$GetDoctorsImpl>
    implements _$$GetDoctorsImplCopyWith<$Res> {
  __$$GetDoctorsImplCopyWithImpl(
      _$GetDoctorsImpl _value, $Res Function(_$GetDoctorsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetDoctorsImpl implements _GetDoctors {
  const _$GetDoctorsImpl();

  @override
  String toString() {
    return 'DoctorEvent.getDoctors()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDoctorsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() getDoctors,
  }) {
    return getDoctors();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionSelectedInfo? sessionSelectedInfo)? initialize,
    TResult? Function()? getDoctors,
  }) {
    return getDoctors?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionSelectedInfo? sessionSelectedInfo)? initialize,
    TResult Function()? getDoctors,
    required TResult orElse(),
  }) {
    if (getDoctors != null) {
      return getDoctors();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetDoctors value) getDoctors,
  }) {
    return getDoctors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetDoctors value)? getDoctors,
  }) {
    return getDoctors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetDoctors value)? getDoctors,
    required TResult orElse(),
  }) {
    if (getDoctors != null) {
      return getDoctors(this);
    }
    return orElse();
  }
}

abstract class _GetDoctors implements DoctorEvent {
  const factory _GetDoctors() = _$GetDoctorsImpl;
}

/// @nodoc
mixin _$DoctorState {
  List<DoctorModel> get doctors => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  SessionSelectedInfo? get sessionSelectedInfo =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DoctorStateCopyWith<DoctorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorStateCopyWith<$Res> {
  factory $DoctorStateCopyWith(
          DoctorState value, $Res Function(DoctorState) then) =
      _$DoctorStateCopyWithImpl<$Res, DoctorState>;
  @useResult
  $Res call(
      {List<DoctorModel> doctors,
      LoadingState loadingState,
      SessionSelectedInfo? sessionSelectedInfo});
}

/// @nodoc
class _$DoctorStateCopyWithImpl<$Res, $Val extends DoctorState>
    implements $DoctorStateCopyWith<$Res> {
  _$DoctorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = null,
    Object? loadingState = null,
    Object? sessionSelectedInfo = freezed,
  }) {
    return _then(_value.copyWith(
      doctors: null == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorModel>,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      sessionSelectedInfo: freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorStateImplCopyWith<$Res>
    implements $DoctorStateCopyWith<$Res> {
  factory _$$DoctorStateImplCopyWith(
          _$DoctorStateImpl value, $Res Function(_$DoctorStateImpl) then) =
      __$$DoctorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DoctorModel> doctors,
      LoadingState loadingState,
      SessionSelectedInfo? sessionSelectedInfo});
}

/// @nodoc
class __$$DoctorStateImplCopyWithImpl<$Res>
    extends _$DoctorStateCopyWithImpl<$Res, _$DoctorStateImpl>
    implements _$$DoctorStateImplCopyWith<$Res> {
  __$$DoctorStateImplCopyWithImpl(
      _$DoctorStateImpl _value, $Res Function(_$DoctorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = null,
    Object? loadingState = null,
    Object? sessionSelectedInfo = freezed,
  }) {
    return _then(_$DoctorStateImpl(
      doctors: null == doctors
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorModel>,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      sessionSelectedInfo: freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
    ));
  }
}

/// @nodoc

class _$DoctorStateImpl implements _DoctorState {
  const _$DoctorStateImpl(
      {required final List<DoctorModel> doctors,
      required this.loadingState,
      this.sessionSelectedInfo})
      : _doctors = doctors;

  final List<DoctorModel> _doctors;
  @override
  List<DoctorModel> get doctors {
    if (_doctors is EqualUnmodifiableListView) return _doctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  @override
  final LoadingState loadingState;
  @override
  final SessionSelectedInfo? sessionSelectedInfo;

  @override
  String toString() {
    return 'DoctorState(doctors: $doctors, loadingState: $loadingState, sessionSelectedInfo: $sessionSelectedInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorStateImpl &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.sessionSelectedInfo, sessionSelectedInfo) ||
                other.sessionSelectedInfo == sessionSelectedInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_doctors),
      loadingState,
      sessionSelectedInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorStateImplCopyWith<_$DoctorStateImpl> get copyWith =>
      __$$DoctorStateImplCopyWithImpl<_$DoctorStateImpl>(this, _$identity);
}

abstract class _DoctorState implements DoctorState {
  const factory _DoctorState(
      {required final List<DoctorModel> doctors,
      required final LoadingState loadingState,
      final SessionSelectedInfo? sessionSelectedInfo}) = _$DoctorStateImpl;

  @override
  List<DoctorModel> get doctors;
  @override
  LoadingState get loadingState;
  @override
  SessionSelectedInfo? get sessionSelectedInfo;
  @override
  @JsonKey(ignore: true)
  _$$DoctorStateImplCopyWith<_$DoctorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
