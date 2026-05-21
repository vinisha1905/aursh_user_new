// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SupportEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProfileModel profile) initialize,
    required TResult Function(String message) sendSupport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProfileModel profile)? initialize,
    TResult? Function(String message)? sendSupport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProfileModel profile)? initialize,
    TResult Function(String message)? sendSupport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendSupport value) sendSupport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendSupport value)? sendSupport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendSupport value)? sendSupport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportEventCopyWith<$Res> {
  factory $SupportEventCopyWith(
          SupportEvent value, $Res Function(SupportEvent) then) =
      _$SupportEventCopyWithImpl<$Res, SupportEvent>;
}

/// @nodoc
class _$SupportEventCopyWithImpl<$Res, $Val extends SupportEvent>
    implements $SupportEventCopyWith<$Res> {
  _$SupportEventCopyWithImpl(this._value, this._then);

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
  $Res call({ProfileModel profile});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$SupportEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$InitializeImpl(
      null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.profile);

  @override
  final ProfileModel profile;

  @override
  String toString() {
    return 'SupportEvent.initialize(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProfileModel profile) initialize,
    required TResult Function(String message) sendSupport,
  }) {
    return initialize(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProfileModel profile)? initialize,
    TResult? Function(String message)? sendSupport,
  }) {
    return initialize?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProfileModel profile)? initialize,
    TResult Function(String message)? sendSupport,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendSupport value) sendSupport,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendSupport value)? sendSupport,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendSupport value)? sendSupport,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements SupportEvent {
  const factory _Initialize(final ProfileModel profile) = _$InitializeImpl;

  ProfileModel get profile;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendSupportImplCopyWith<$Res> {
  factory _$$SendSupportImplCopyWith(
          _$SendSupportImpl value, $Res Function(_$SendSupportImpl) then) =
      __$$SendSupportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SendSupportImplCopyWithImpl<$Res>
    extends _$SupportEventCopyWithImpl<$Res, _$SendSupportImpl>
    implements _$$SendSupportImplCopyWith<$Res> {
  __$$SendSupportImplCopyWithImpl(
      _$SendSupportImpl _value, $Res Function(_$SendSupportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SendSupportImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendSupportImpl implements _SendSupport {
  const _$SendSupportImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SupportEvent.sendSupport(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendSupportImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendSupportImplCopyWith<_$SendSupportImpl> get copyWith =>
      __$$SendSupportImplCopyWithImpl<_$SendSupportImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProfileModel profile) initialize,
    required TResult Function(String message) sendSupport,
  }) {
    return sendSupport(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProfileModel profile)? initialize,
    TResult? Function(String message)? sendSupport,
  }) {
    return sendSupport?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProfileModel profile)? initialize,
    TResult Function(String message)? sendSupport,
    required TResult orElse(),
  }) {
    if (sendSupport != null) {
      return sendSupport(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SendSupport value) sendSupport,
  }) {
    return sendSupport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SendSupport value)? sendSupport,
  }) {
    return sendSupport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SendSupport value)? sendSupport,
    required TResult orElse(),
  }) {
    if (sendSupport != null) {
      return sendSupport(this);
    }
    return orElse();
  }
}

abstract class _SendSupport implements SupportEvent {
  const factory _SendSupport(final String message) = _$SendSupportImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SendSupportImplCopyWith<_$SendSupportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SupportState {
  LoadingState get loadingState => throw _privateConstructorUsedError;
  ProfileModel? get profile => throw _privateConstructorUsedError;
  Either<String, DefaultResponse>? get result =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SupportStateCopyWith<SupportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportStateCopyWith<$Res> {
  factory $SupportStateCopyWith(
          SupportState value, $Res Function(SupportState) then) =
      _$SupportStateCopyWithImpl<$Res, SupportState>;
  @useResult
  $Res call(
      {LoadingState loadingState,
      ProfileModel? profile,
      Either<String, DefaultResponse>? result});
}

/// @nodoc
class _$SupportStateCopyWithImpl<$Res, $Val extends SupportState>
    implements $SupportStateCopyWith<$Res> {
  _$SupportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? profile = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Either<String, DefaultResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupportStateImplCopyWith<$Res>
    implements $SupportStateCopyWith<$Res> {
  factory _$$SupportStateImplCopyWith(
          _$SupportStateImpl value, $Res Function(_$SupportStateImpl) then) =
      __$$SupportStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingState loadingState,
      ProfileModel? profile,
      Either<String, DefaultResponse>? result});
}

/// @nodoc
class __$$SupportStateImplCopyWithImpl<$Res>
    extends _$SupportStateCopyWithImpl<$Res, _$SupportStateImpl>
    implements _$$SupportStateImplCopyWith<$Res> {
  __$$SupportStateImplCopyWithImpl(
      _$SupportStateImpl _value, $Res Function(_$SupportStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? profile = freezed,
    Object? result = freezed,
  }) {
    return _then(_$SupportStateImpl(
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Either<String, DefaultResponse>?,
    ));
  }
}

/// @nodoc

class _$SupportStateImpl implements _SupportState {
  const _$SupportStateImpl(
      {required this.loadingState,
      required this.profile,
      required this.result});

  @override
  final LoadingState loadingState;
  @override
  final ProfileModel? profile;
  @override
  final Either<String, DefaultResponse>? result;

  @override
  String toString() {
    return 'SupportState(loadingState: $loadingState, profile: $profile, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportStateImpl &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingState, profile, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportStateImplCopyWith<_$SupportStateImpl> get copyWith =>
      __$$SupportStateImplCopyWithImpl<_$SupportStateImpl>(this, _$identity);
}

abstract class _SupportState implements SupportState {
  const factory _SupportState(
          {required final LoadingState loadingState,
          required final ProfileModel? profile,
          required final Either<String, DefaultResponse>? result}) =
      _$SupportStateImpl;

  @override
  LoadingState get loadingState;
  @override
  ProfileModel? get profile;
  @override
  Either<String, DefaultResponse>? get result;
  @override
  @JsonKey(ignore: true)
  _$$SupportStateImplCopyWith<_$SupportStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
