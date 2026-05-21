// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_validation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OtpValidationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phoneNumber, String userId, String smsTokenSessionId)
        initialize,
    required TResult Function(String smsToken) submitOtp,
    required TResult Function() resendOtp,
    required TResult Function() countTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phoneNumber, String userId, String smsTokenSessionId)?
        initialize,
    TResult? Function(String smsToken)? submitOtp,
    TResult? Function()? resendOtp,
    TResult? Function()? countTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phoneNumber, String userId, String smsTokenSessionId)?
        initialize,
    TResult Function(String smsToken)? submitOtp,
    TResult Function()? resendOtp,
    TResult Function()? countTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SubmitOtp value) submitOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_CountTime value) countTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SubmitOtp value)? submitOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_CountTime value)? countTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SubmitOtp value)? submitOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_CountTime value)? countTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpValidationEventCopyWith<$Res> {
  factory $OtpValidationEventCopyWith(
          OtpValidationEvent value, $Res Function(OtpValidationEvent) then) =
      _$OtpValidationEventCopyWithImpl<$Res, OtpValidationEvent>;
}

/// @nodoc
class _$OtpValidationEventCopyWithImpl<$Res, $Val extends OtpValidationEvent>
    implements $OtpValidationEventCopyWith<$Res> {
  _$OtpValidationEventCopyWithImpl(this._value, this._then);

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
  $Res call({String phoneNumber, String userId, String smsTokenSessionId});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$OtpValidationEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? userId = null,
    Object? smsTokenSessionId = null,
  }) {
    return _then(_$InitializeImpl(
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      null == smsTokenSessionId
          ? _value.smsTokenSessionId
          : smsTokenSessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.phoneNumber, this.userId, this.smsTokenSessionId);

  @override
  final String phoneNumber;
  @override
  final String userId;
  @override
  final String smsTokenSessionId;

  @override
  String toString() {
    return 'OtpValidationEvent.initialize(phoneNumber: $phoneNumber, userId: $userId, smsTokenSessionId: $smsTokenSessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.smsTokenSessionId, smsTokenSessionId) ||
                other.smsTokenSessionId == smsTokenSessionId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, phoneNumber, userId, smsTokenSessionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phoneNumber, String userId, String smsTokenSessionId)
        initialize,
    required TResult Function(String smsToken) submitOtp,
    required TResult Function() resendOtp,
    required TResult Function() countTime,
  }) {
    return initialize(phoneNumber, userId, smsTokenSessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phoneNumber, String userId, String smsTokenSessionId)?
        initialize,
    TResult? Function(String smsToken)? submitOtp,
    TResult? Function()? resendOtp,
    TResult? Function()? countTime,
  }) {
    return initialize?.call(phoneNumber, userId, smsTokenSessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phoneNumber, String userId, String smsTokenSessionId)?
        initialize,
    TResult Function(String smsToken)? submitOtp,
    TResult Function()? resendOtp,
    TResult Function()? countTime,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(phoneNumber, userId, smsTokenSessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SubmitOtp value) submitOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_CountTime value) countTime,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SubmitOtp value)? submitOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_CountTime value)? countTime,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SubmitOtp value)? submitOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_CountTime value)? countTime,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements OtpValidationEvent {
  const factory _Initialize(final String phoneNumber, final String userId,
      final String smsTokenSessionId) = _$InitializeImpl;

  String get phoneNumber;
  String get userId;
  String get smsTokenSessionId;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitOtpImplCopyWith<$Res> {
  factory _$$SubmitOtpImplCopyWith(
          _$SubmitOtpImpl value, $Res Function(_$SubmitOtpImpl) then) =
      __$$SubmitOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String smsToken});
}

/// @nodoc
class __$$SubmitOtpImplCopyWithImpl<$Res>
    extends _$OtpValidationEventCopyWithImpl<$Res, _$SubmitOtpImpl>
    implements _$$SubmitOtpImplCopyWith<$Res> {
  __$$SubmitOtpImplCopyWithImpl(
      _$SubmitOtpImpl _value, $Res Function(_$SubmitOtpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smsToken = null,
  }) {
    return _then(_$SubmitOtpImpl(
      null == smsToken
          ? _value.smsToken
          : smsToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SubmitOtpImpl implements _SubmitOtp {
  const _$SubmitOtpImpl(this.smsToken);

  @override
  final String smsToken;

  @override
  String toString() {
    return 'OtpValidationEvent.submitOtp(smsToken: $smsToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitOtpImpl &&
            (identical(other.smsToken, smsToken) ||
                other.smsToken == smsToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, smsToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitOtpImplCopyWith<_$SubmitOtpImpl> get copyWith =>
      __$$SubmitOtpImplCopyWithImpl<_$SubmitOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phoneNumber, String userId, String smsTokenSessionId)
        initialize,
    required TResult Function(String smsToken) submitOtp,
    required TResult Function() resendOtp,
    required TResult Function() countTime,
  }) {
    return submitOtp(smsToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phoneNumber, String userId, String smsTokenSessionId)?
        initialize,
    TResult? Function(String smsToken)? submitOtp,
    TResult? Function()? resendOtp,
    TResult? Function()? countTime,
  }) {
    return submitOtp?.call(smsToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phoneNumber, String userId, String smsTokenSessionId)?
        initialize,
    TResult Function(String smsToken)? submitOtp,
    TResult Function()? resendOtp,
    TResult Function()? countTime,
    required TResult orElse(),
  }) {
    if (submitOtp != null) {
      return submitOtp(smsToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SubmitOtp value) submitOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_CountTime value) countTime,
  }) {
    return submitOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SubmitOtp value)? submitOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_CountTime value)? countTime,
  }) {
    return submitOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SubmitOtp value)? submitOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_CountTime value)? countTime,
    required TResult orElse(),
  }) {
    if (submitOtp != null) {
      return submitOtp(this);
    }
    return orElse();
  }
}

abstract class _SubmitOtp implements OtpValidationEvent {
  const factory _SubmitOtp(final String smsToken) = _$SubmitOtpImpl;

  String get smsToken;
  @JsonKey(ignore: true)
  _$$SubmitOtpImplCopyWith<_$SubmitOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResendOtpImplCopyWith<$Res> {
  factory _$$ResendOtpImplCopyWith(
          _$ResendOtpImpl value, $Res Function(_$ResendOtpImpl) then) =
      __$$ResendOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResendOtpImplCopyWithImpl<$Res>
    extends _$OtpValidationEventCopyWithImpl<$Res, _$ResendOtpImpl>
    implements _$$ResendOtpImplCopyWith<$Res> {
  __$$ResendOtpImplCopyWithImpl(
      _$ResendOtpImpl _value, $Res Function(_$ResendOtpImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResendOtpImpl implements _ResendOtp {
  const _$ResendOtpImpl();

  @override
  String toString() {
    return 'OtpValidationEvent.resendOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResendOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phoneNumber, String userId, String smsTokenSessionId)
        initialize,
    required TResult Function(String smsToken) submitOtp,
    required TResult Function() resendOtp,
    required TResult Function() countTime,
  }) {
    return resendOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phoneNumber, String userId, String smsTokenSessionId)?
        initialize,
    TResult? Function(String smsToken)? submitOtp,
    TResult? Function()? resendOtp,
    TResult? Function()? countTime,
  }) {
    return resendOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phoneNumber, String userId, String smsTokenSessionId)?
        initialize,
    TResult Function(String smsToken)? submitOtp,
    TResult Function()? resendOtp,
    TResult Function()? countTime,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SubmitOtp value) submitOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_CountTime value) countTime,
  }) {
    return resendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SubmitOtp value)? submitOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_CountTime value)? countTime,
  }) {
    return resendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SubmitOtp value)? submitOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_CountTime value)? countTime,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp(this);
    }
    return orElse();
  }
}

abstract class _ResendOtp implements OtpValidationEvent {
  const factory _ResendOtp() = _$ResendOtpImpl;
}

/// @nodoc
abstract class _$$CountTimeImplCopyWith<$Res> {
  factory _$$CountTimeImplCopyWith(
          _$CountTimeImpl value, $Res Function(_$CountTimeImpl) then) =
      __$$CountTimeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CountTimeImplCopyWithImpl<$Res>
    extends _$OtpValidationEventCopyWithImpl<$Res, _$CountTimeImpl>
    implements _$$CountTimeImplCopyWith<$Res> {
  __$$CountTimeImplCopyWithImpl(
      _$CountTimeImpl _value, $Res Function(_$CountTimeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CountTimeImpl implements _CountTime {
  const _$CountTimeImpl();

  @override
  String toString() {
    return 'OtpValidationEvent.countTime()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CountTimeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phoneNumber, String userId, String smsTokenSessionId)
        initialize,
    required TResult Function(String smsToken) submitOtp,
    required TResult Function() resendOtp,
    required TResult Function() countTime,
  }) {
    return countTime();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phoneNumber, String userId, String smsTokenSessionId)?
        initialize,
    TResult? Function(String smsToken)? submitOtp,
    TResult? Function()? resendOtp,
    TResult? Function()? countTime,
  }) {
    return countTime?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phoneNumber, String userId, String smsTokenSessionId)?
        initialize,
    TResult Function(String smsToken)? submitOtp,
    TResult Function()? resendOtp,
    TResult Function()? countTime,
    required TResult orElse(),
  }) {
    if (countTime != null) {
      return countTime();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SubmitOtp value) submitOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_CountTime value) countTime,
  }) {
    return countTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SubmitOtp value)? submitOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_CountTime value)? countTime,
  }) {
    return countTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SubmitOtp value)? submitOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_CountTime value)? countTime,
    required TResult orElse(),
  }) {
    if (countTime != null) {
      return countTime(this);
    }
    return orElse();
  }
}

abstract class _CountTime implements OtpValidationEvent {
  const factory _CountTime() = _$CountTimeImpl;
}

/// @nodoc
mixin _$OtpValidationState {
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get smsTokenSessionId => throw _privateConstructorUsedError;
  int? get aliveTime => throw _privateConstructorUsedError;
  bool get forceStopCounting => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  Either<String, OtpValidationResponse>? get result =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpValidationStateCopyWith<OtpValidationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpValidationStateCopyWith<$Res> {
  factory $OtpValidationStateCopyWith(
          OtpValidationState value, $Res Function(OtpValidationState) then) =
      _$OtpValidationStateCopyWithImpl<$Res, OtpValidationState>;
  @useResult
  $Res call(
      {String? phoneNumber,
      String? userId,
      String? smsTokenSessionId,
      int? aliveTime,
      bool forceStopCounting,
      LoadingState loadingState,
      Either<String, OtpValidationResponse>? result});
}

/// @nodoc
class _$OtpValidationStateCopyWithImpl<$Res, $Val extends OtpValidationState>
    implements $OtpValidationStateCopyWith<$Res> {
  _$OtpValidationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? userId = freezed,
    Object? smsTokenSessionId = freezed,
    Object? aliveTime = freezed,
    Object? forceStopCounting = null,
    Object? loadingState = null,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      smsTokenSessionId: freezed == smsTokenSessionId
          ? _value.smsTokenSessionId
          : smsTokenSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      aliveTime: freezed == aliveTime
          ? _value.aliveTime
          : aliveTime // ignore: cast_nullable_to_non_nullable
              as int?,
      forceStopCounting: null == forceStopCounting
          ? _value.forceStopCounting
          : forceStopCounting // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Either<String, OtpValidationResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpValidationStateImplCopyWith<$Res>
    implements $OtpValidationStateCopyWith<$Res> {
  factory _$$OtpValidationStateImplCopyWith(_$OtpValidationStateImpl value,
          $Res Function(_$OtpValidationStateImpl) then) =
      __$$OtpValidationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? phoneNumber,
      String? userId,
      String? smsTokenSessionId,
      int? aliveTime,
      bool forceStopCounting,
      LoadingState loadingState,
      Either<String, OtpValidationResponse>? result});
}

/// @nodoc
class __$$OtpValidationStateImplCopyWithImpl<$Res>
    extends _$OtpValidationStateCopyWithImpl<$Res, _$OtpValidationStateImpl>
    implements _$$OtpValidationStateImplCopyWith<$Res> {
  __$$OtpValidationStateImplCopyWithImpl(_$OtpValidationStateImpl _value,
      $Res Function(_$OtpValidationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? userId = freezed,
    Object? smsTokenSessionId = freezed,
    Object? aliveTime = freezed,
    Object? forceStopCounting = null,
    Object? loadingState = null,
    Object? result = freezed,
  }) {
    return _then(_$OtpValidationStateImpl(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      smsTokenSessionId: freezed == smsTokenSessionId
          ? _value.smsTokenSessionId
          : smsTokenSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      aliveTime: freezed == aliveTime
          ? _value.aliveTime
          : aliveTime // ignore: cast_nullable_to_non_nullable
              as int?,
      forceStopCounting: null == forceStopCounting
          ? _value.forceStopCounting
          : forceStopCounting // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Either<String, OtpValidationResponse>?,
    ));
  }
}

/// @nodoc

class _$OtpValidationStateImpl implements _OtpValidationState {
  const _$OtpValidationStateImpl(
      {required this.phoneNumber,
      required this.userId,
      required this.smsTokenSessionId,
      required this.aliveTime,
      required this.forceStopCounting,
      required this.loadingState,
      required this.result});

  @override
  final String? phoneNumber;
  @override
  final String? userId;
  @override
  final String? smsTokenSessionId;
  @override
  final int? aliveTime;
  @override
  final bool forceStopCounting;
  @override
  final LoadingState loadingState;
  @override
  final Either<String, OtpValidationResponse>? result;

  @override
  String toString() {
    return 'OtpValidationState(phoneNumber: $phoneNumber, userId: $userId, smsTokenSessionId: $smsTokenSessionId, aliveTime: $aliveTime, forceStopCounting: $forceStopCounting, loadingState: $loadingState, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpValidationStateImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.smsTokenSessionId, smsTokenSessionId) ||
                other.smsTokenSessionId == smsTokenSessionId) &&
            (identical(other.aliveTime, aliveTime) ||
                other.aliveTime == aliveTime) &&
            (identical(other.forceStopCounting, forceStopCounting) ||
                other.forceStopCounting == forceStopCounting) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, userId,
      smsTokenSessionId, aliveTime, forceStopCounting, loadingState, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpValidationStateImplCopyWith<_$OtpValidationStateImpl> get copyWith =>
      __$$OtpValidationStateImplCopyWithImpl<_$OtpValidationStateImpl>(
          this, _$identity);
}

abstract class _OtpValidationState implements OtpValidationState {
  const factory _OtpValidationState(
          {required final String? phoneNumber,
          required final String? userId,
          required final String? smsTokenSessionId,
          required final int? aliveTime,
          required final bool forceStopCounting,
          required final LoadingState loadingState,
          required final Either<String, OtpValidationResponse>? result}) =
      _$OtpValidationStateImpl;

  @override
  String? get phoneNumber;
  @override
  String? get userId;
  @override
  String? get smsTokenSessionId;
  @override
  int? get aliveTime;
  @override
  bool get forceStopCounting;
  @override
  LoadingState get loadingState;
  @override
  Either<String, OtpValidationResponse>? get result;
  @override
  @JsonKey(ignore: true)
  _$$OtpValidationStateImplCopyWith<_$OtpValidationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
