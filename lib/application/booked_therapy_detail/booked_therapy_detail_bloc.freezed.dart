// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booked_therapy_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookedTherapyDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookedTherapyInfo bookedTherapy) initialize,
    required TResult Function() setExpandPreviousSession,
    required TResult Function() refresh,
    required TResult Function(bool isStart, SessionModel session) generateOTP,
    required TResult Function() resetOTP,
    required TResult Function() setDataChanged,
    required TResult Function() cancelBooking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult? Function()? setExpandPreviousSession,
    TResult? Function()? refresh,
    TResult? Function(bool isStart, SessionModel session)? generateOTP,
    TResult? Function()? resetOTP,
    TResult? Function()? setDataChanged,
    TResult? Function()? cancelBooking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult Function()? setExpandPreviousSession,
    TResult Function()? refresh,
    TResult Function(bool isStart, SessionModel session)? generateOTP,
    TResult Function()? resetOTP,
    TResult Function()? setDataChanged,
    TResult Function()? cancelBooking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetExpandPreviousSession value)
        setExpandPreviousSession,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ShowQrCode value) generateOTP,
    required TResult Function(_ResetQrCode value) resetOTP,
    required TResult Function(_SetDataChanged value) setDataChanged,
    required TResult Function(_CancelBooking value) cancelBooking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetExpandPreviousSession value)?
        setExpandPreviousSession,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ShowQrCode value)? generateOTP,
    TResult? Function(_ResetQrCode value)? resetOTP,
    TResult? Function(_SetDataChanged value)? setDataChanged,
    TResult? Function(_CancelBooking value)? cancelBooking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetExpandPreviousSession value)? setExpandPreviousSession,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ShowQrCode value)? generateOTP,
    TResult Function(_ResetQrCode value)? resetOTP,
    TResult Function(_SetDataChanged value)? setDataChanged,
    TResult Function(_CancelBooking value)? cancelBooking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookedTherapyDetailEventCopyWith<$Res> {
  factory $BookedTherapyDetailEventCopyWith(BookedTherapyDetailEvent value,
          $Res Function(BookedTherapyDetailEvent) then) =
      _$BookedTherapyDetailEventCopyWithImpl<$Res, BookedTherapyDetailEvent>;
}

/// @nodoc
class _$BookedTherapyDetailEventCopyWithImpl<$Res,
        $Val extends BookedTherapyDetailEvent>
    implements $BookedTherapyDetailEventCopyWith<$Res> {
  _$BookedTherapyDetailEventCopyWithImpl(this._value, this._then);

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
  $Res call({BookedTherapyInfo bookedTherapy});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$BookedTherapyDetailEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookedTherapy = null,
  }) {
    return _then(_$InitializeImpl(
      null == bookedTherapy
          ? _value.bookedTherapy
          : bookedTherapy // ignore: cast_nullable_to_non_nullable
              as BookedTherapyInfo,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.bookedTherapy);

  @override
  final BookedTherapyInfo bookedTherapy;

  @override
  String toString() {
    return 'BookedTherapyDetailEvent.initialize(bookedTherapy: $bookedTherapy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.bookedTherapy, bookedTherapy) ||
                other.bookedTherapy == bookedTherapy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookedTherapy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookedTherapyInfo bookedTherapy) initialize,
    required TResult Function() setExpandPreviousSession,
    required TResult Function() refresh,
    required TResult Function(bool isStart, SessionModel session) generateOTP,
    required TResult Function() resetOTP,
    required TResult Function() setDataChanged,
    required TResult Function() cancelBooking,
  }) {
    return initialize(bookedTherapy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult? Function()? setExpandPreviousSession,
    TResult? Function()? refresh,
    TResult? Function(bool isStart, SessionModel session)? generateOTP,
    TResult? Function()? resetOTP,
    TResult? Function()? setDataChanged,
    TResult? Function()? cancelBooking,
  }) {
    return initialize?.call(bookedTherapy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult Function()? setExpandPreviousSession,
    TResult Function()? refresh,
    TResult Function(bool isStart, SessionModel session)? generateOTP,
    TResult Function()? resetOTP,
    TResult Function()? setDataChanged,
    TResult Function()? cancelBooking,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(bookedTherapy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetExpandPreviousSession value)
        setExpandPreviousSession,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ShowQrCode value) generateOTP,
    required TResult Function(_ResetQrCode value) resetOTP,
    required TResult Function(_SetDataChanged value) setDataChanged,
    required TResult Function(_CancelBooking value) cancelBooking,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetExpandPreviousSession value)?
        setExpandPreviousSession,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ShowQrCode value)? generateOTP,
    TResult? Function(_ResetQrCode value)? resetOTP,
    TResult? Function(_SetDataChanged value)? setDataChanged,
    TResult? Function(_CancelBooking value)? cancelBooking,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetExpandPreviousSession value)? setExpandPreviousSession,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ShowQrCode value)? generateOTP,
    TResult Function(_ResetQrCode value)? resetOTP,
    TResult Function(_SetDataChanged value)? setDataChanged,
    TResult Function(_CancelBooking value)? cancelBooking,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements BookedTherapyDetailEvent {
  const factory _Initialize(final BookedTherapyInfo bookedTherapy) =
      _$InitializeImpl;

  BookedTherapyInfo get bookedTherapy;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetExpandPreviousSessionImplCopyWith<$Res> {
  factory _$$SetExpandPreviousSessionImplCopyWith(
          _$SetExpandPreviousSessionImpl value,
          $Res Function(_$SetExpandPreviousSessionImpl) then) =
      __$$SetExpandPreviousSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetExpandPreviousSessionImplCopyWithImpl<$Res>
    extends _$BookedTherapyDetailEventCopyWithImpl<$Res,
        _$SetExpandPreviousSessionImpl>
    implements _$$SetExpandPreviousSessionImplCopyWith<$Res> {
  __$$SetExpandPreviousSessionImplCopyWithImpl(
      _$SetExpandPreviousSessionImpl _value,
      $Res Function(_$SetExpandPreviousSessionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SetExpandPreviousSessionImpl implements _SetExpandPreviousSession {
  const _$SetExpandPreviousSessionImpl();

  @override
  String toString() {
    return 'BookedTherapyDetailEvent.setExpandPreviousSession()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetExpandPreviousSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookedTherapyInfo bookedTherapy) initialize,
    required TResult Function() setExpandPreviousSession,
    required TResult Function() refresh,
    required TResult Function(bool isStart, SessionModel session) generateOTP,
    required TResult Function() resetOTP,
    required TResult Function() setDataChanged,
    required TResult Function() cancelBooking,
  }) {
    return setExpandPreviousSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult? Function()? setExpandPreviousSession,
    TResult? Function()? refresh,
    TResult? Function(bool isStart, SessionModel session)? generateOTP,
    TResult? Function()? resetOTP,
    TResult? Function()? setDataChanged,
    TResult? Function()? cancelBooking,
  }) {
    return setExpandPreviousSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult Function()? setExpandPreviousSession,
    TResult Function()? refresh,
    TResult Function(bool isStart, SessionModel session)? generateOTP,
    TResult Function()? resetOTP,
    TResult Function()? setDataChanged,
    TResult Function()? cancelBooking,
    required TResult orElse(),
  }) {
    if (setExpandPreviousSession != null) {
      return setExpandPreviousSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetExpandPreviousSession value)
        setExpandPreviousSession,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ShowQrCode value) generateOTP,
    required TResult Function(_ResetQrCode value) resetOTP,
    required TResult Function(_SetDataChanged value) setDataChanged,
    required TResult Function(_CancelBooking value) cancelBooking,
  }) {
    return setExpandPreviousSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetExpandPreviousSession value)?
        setExpandPreviousSession,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ShowQrCode value)? generateOTP,
    TResult? Function(_ResetQrCode value)? resetOTP,
    TResult? Function(_SetDataChanged value)? setDataChanged,
    TResult? Function(_CancelBooking value)? cancelBooking,
  }) {
    return setExpandPreviousSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetExpandPreviousSession value)? setExpandPreviousSession,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ShowQrCode value)? generateOTP,
    TResult Function(_ResetQrCode value)? resetOTP,
    TResult Function(_SetDataChanged value)? setDataChanged,
    TResult Function(_CancelBooking value)? cancelBooking,
    required TResult orElse(),
  }) {
    if (setExpandPreviousSession != null) {
      return setExpandPreviousSession(this);
    }
    return orElse();
  }
}

abstract class _SetExpandPreviousSession implements BookedTherapyDetailEvent {
  const factory _SetExpandPreviousSession() = _$SetExpandPreviousSessionImpl;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$BookedTherapyDetailEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'BookedTherapyDetailEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookedTherapyInfo bookedTherapy) initialize,
    required TResult Function() setExpandPreviousSession,
    required TResult Function() refresh,
    required TResult Function(bool isStart, SessionModel session) generateOTP,
    required TResult Function() resetOTP,
    required TResult Function() setDataChanged,
    required TResult Function() cancelBooking,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult? Function()? setExpandPreviousSession,
    TResult? Function()? refresh,
    TResult? Function(bool isStart, SessionModel session)? generateOTP,
    TResult? Function()? resetOTP,
    TResult? Function()? setDataChanged,
    TResult? Function()? cancelBooking,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult Function()? setExpandPreviousSession,
    TResult Function()? refresh,
    TResult Function(bool isStart, SessionModel session)? generateOTP,
    TResult Function()? resetOTP,
    TResult Function()? setDataChanged,
    TResult Function()? cancelBooking,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetExpandPreviousSession value)
        setExpandPreviousSession,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ShowQrCode value) generateOTP,
    required TResult Function(_ResetQrCode value) resetOTP,
    required TResult Function(_SetDataChanged value) setDataChanged,
    required TResult Function(_CancelBooking value) cancelBooking,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetExpandPreviousSession value)?
        setExpandPreviousSession,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ShowQrCode value)? generateOTP,
    TResult? Function(_ResetQrCode value)? resetOTP,
    TResult? Function(_SetDataChanged value)? setDataChanged,
    TResult? Function(_CancelBooking value)? cancelBooking,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetExpandPreviousSession value)? setExpandPreviousSession,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ShowQrCode value)? generateOTP,
    TResult Function(_ResetQrCode value)? resetOTP,
    TResult Function(_SetDataChanged value)? setDataChanged,
    TResult Function(_CancelBooking value)? cancelBooking,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements BookedTherapyDetailEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$ShowQrCodeImplCopyWith<$Res> {
  factory _$$ShowQrCodeImplCopyWith(
          _$ShowQrCodeImpl value, $Res Function(_$ShowQrCodeImpl) then) =
      __$$ShowQrCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isStart, SessionModel session});
}

/// @nodoc
class __$$ShowQrCodeImplCopyWithImpl<$Res>
    extends _$BookedTherapyDetailEventCopyWithImpl<$Res, _$ShowQrCodeImpl>
    implements _$$ShowQrCodeImplCopyWith<$Res> {
  __$$ShowQrCodeImplCopyWithImpl(
      _$ShowQrCodeImpl _value, $Res Function(_$ShowQrCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isStart = null,
    Object? session = null,
  }) {
    return _then(_$ShowQrCodeImpl(
      null == isStart
          ? _value.isStart
          : isStart // ignore: cast_nullable_to_non_nullable
              as bool,
      null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as SessionModel,
    ));
  }
}

/// @nodoc

class _$ShowQrCodeImpl implements _ShowQrCode {
  const _$ShowQrCodeImpl(this.isStart, this.session);

  @override
  final bool isStart;
  @override
  final SessionModel session;

  @override
  String toString() {
    return 'BookedTherapyDetailEvent.generateOTP(isStart: $isStart, session: $session)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowQrCodeImpl &&
            (identical(other.isStart, isStart) || other.isStart == isStart) &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isStart, session);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowQrCodeImplCopyWith<_$ShowQrCodeImpl> get copyWith =>
      __$$ShowQrCodeImplCopyWithImpl<_$ShowQrCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookedTherapyInfo bookedTherapy) initialize,
    required TResult Function() setExpandPreviousSession,
    required TResult Function() refresh,
    required TResult Function(bool isStart, SessionModel session) generateOTP,
    required TResult Function() resetOTP,
    required TResult Function() setDataChanged,
    required TResult Function() cancelBooking,
  }) {
    return generateOTP(isStart, session);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult? Function()? setExpandPreviousSession,
    TResult? Function()? refresh,
    TResult? Function(bool isStart, SessionModel session)? generateOTP,
    TResult? Function()? resetOTP,
    TResult? Function()? setDataChanged,
    TResult? Function()? cancelBooking,
  }) {
    return generateOTP?.call(isStart, session);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult Function()? setExpandPreviousSession,
    TResult Function()? refresh,
    TResult Function(bool isStart, SessionModel session)? generateOTP,
    TResult Function()? resetOTP,
    TResult Function()? setDataChanged,
    TResult Function()? cancelBooking,
    required TResult orElse(),
  }) {
    if (generateOTP != null) {
      return generateOTP(isStart, session);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetExpandPreviousSession value)
        setExpandPreviousSession,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ShowQrCode value) generateOTP,
    required TResult Function(_ResetQrCode value) resetOTP,
    required TResult Function(_SetDataChanged value) setDataChanged,
    required TResult Function(_CancelBooking value) cancelBooking,
  }) {
    return generateOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetExpandPreviousSession value)?
        setExpandPreviousSession,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ShowQrCode value)? generateOTP,
    TResult? Function(_ResetQrCode value)? resetOTP,
    TResult? Function(_SetDataChanged value)? setDataChanged,
    TResult? Function(_CancelBooking value)? cancelBooking,
  }) {
    return generateOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetExpandPreviousSession value)? setExpandPreviousSession,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ShowQrCode value)? generateOTP,
    TResult Function(_ResetQrCode value)? resetOTP,
    TResult Function(_SetDataChanged value)? setDataChanged,
    TResult Function(_CancelBooking value)? cancelBooking,
    required TResult orElse(),
  }) {
    if (generateOTP != null) {
      return generateOTP(this);
    }
    return orElse();
  }
}

abstract class _ShowQrCode implements BookedTherapyDetailEvent {
  const factory _ShowQrCode(final bool isStart, final SessionModel session) =
      _$ShowQrCodeImpl;

  bool get isStart;
  SessionModel get session;
  @JsonKey(ignore: true)
  _$$ShowQrCodeImplCopyWith<_$ShowQrCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetQrCodeImplCopyWith<$Res> {
  factory _$$ResetQrCodeImplCopyWith(
          _$ResetQrCodeImpl value, $Res Function(_$ResetQrCodeImpl) then) =
      __$$ResetQrCodeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetQrCodeImplCopyWithImpl<$Res>
    extends _$BookedTherapyDetailEventCopyWithImpl<$Res, _$ResetQrCodeImpl>
    implements _$$ResetQrCodeImplCopyWith<$Res> {
  __$$ResetQrCodeImplCopyWithImpl(
      _$ResetQrCodeImpl _value, $Res Function(_$ResetQrCodeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetQrCodeImpl implements _ResetQrCode {
  const _$ResetQrCodeImpl();

  @override
  String toString() {
    return 'BookedTherapyDetailEvent.resetOTP()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetQrCodeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookedTherapyInfo bookedTherapy) initialize,
    required TResult Function() setExpandPreviousSession,
    required TResult Function() refresh,
    required TResult Function(bool isStart, SessionModel session) generateOTP,
    required TResult Function() resetOTP,
    required TResult Function() setDataChanged,
    required TResult Function() cancelBooking,
  }) {
    return resetOTP();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult? Function()? setExpandPreviousSession,
    TResult? Function()? refresh,
    TResult? Function(bool isStart, SessionModel session)? generateOTP,
    TResult? Function()? resetOTP,
    TResult? Function()? setDataChanged,
    TResult? Function()? cancelBooking,
  }) {
    return resetOTP?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult Function()? setExpandPreviousSession,
    TResult Function()? refresh,
    TResult Function(bool isStart, SessionModel session)? generateOTP,
    TResult Function()? resetOTP,
    TResult Function()? setDataChanged,
    TResult Function()? cancelBooking,
    required TResult orElse(),
  }) {
    if (resetOTP != null) {
      return resetOTP();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetExpandPreviousSession value)
        setExpandPreviousSession,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ShowQrCode value) generateOTP,
    required TResult Function(_ResetQrCode value) resetOTP,
    required TResult Function(_SetDataChanged value) setDataChanged,
    required TResult Function(_CancelBooking value) cancelBooking,
  }) {
    return resetOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetExpandPreviousSession value)?
        setExpandPreviousSession,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ShowQrCode value)? generateOTP,
    TResult? Function(_ResetQrCode value)? resetOTP,
    TResult? Function(_SetDataChanged value)? setDataChanged,
    TResult? Function(_CancelBooking value)? cancelBooking,
  }) {
    return resetOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetExpandPreviousSession value)? setExpandPreviousSession,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ShowQrCode value)? generateOTP,
    TResult Function(_ResetQrCode value)? resetOTP,
    TResult Function(_SetDataChanged value)? setDataChanged,
    TResult Function(_CancelBooking value)? cancelBooking,
    required TResult orElse(),
  }) {
    if (resetOTP != null) {
      return resetOTP(this);
    }
    return orElse();
  }
}

abstract class _ResetQrCode implements BookedTherapyDetailEvent {
  const factory _ResetQrCode() = _$ResetQrCodeImpl;
}

/// @nodoc
abstract class _$$SetDataChangedImplCopyWith<$Res> {
  factory _$$SetDataChangedImplCopyWith(_$SetDataChangedImpl value,
          $Res Function(_$SetDataChangedImpl) then) =
      __$$SetDataChangedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetDataChangedImplCopyWithImpl<$Res>
    extends _$BookedTherapyDetailEventCopyWithImpl<$Res, _$SetDataChangedImpl>
    implements _$$SetDataChangedImplCopyWith<$Res> {
  __$$SetDataChangedImplCopyWithImpl(
      _$SetDataChangedImpl _value, $Res Function(_$SetDataChangedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SetDataChangedImpl implements _SetDataChanged {
  const _$SetDataChangedImpl();

  @override
  String toString() {
    return 'BookedTherapyDetailEvent.setDataChanged()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SetDataChangedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookedTherapyInfo bookedTherapy) initialize,
    required TResult Function() setExpandPreviousSession,
    required TResult Function() refresh,
    required TResult Function(bool isStart, SessionModel session) generateOTP,
    required TResult Function() resetOTP,
    required TResult Function() setDataChanged,
    required TResult Function() cancelBooking,
  }) {
    return setDataChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult? Function()? setExpandPreviousSession,
    TResult? Function()? refresh,
    TResult? Function(bool isStart, SessionModel session)? generateOTP,
    TResult? Function()? resetOTP,
    TResult? Function()? setDataChanged,
    TResult? Function()? cancelBooking,
  }) {
    return setDataChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult Function()? setExpandPreviousSession,
    TResult Function()? refresh,
    TResult Function(bool isStart, SessionModel session)? generateOTP,
    TResult Function()? resetOTP,
    TResult Function()? setDataChanged,
    TResult Function()? cancelBooking,
    required TResult orElse(),
  }) {
    if (setDataChanged != null) {
      return setDataChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetExpandPreviousSession value)
        setExpandPreviousSession,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ShowQrCode value) generateOTP,
    required TResult Function(_ResetQrCode value) resetOTP,
    required TResult Function(_SetDataChanged value) setDataChanged,
    required TResult Function(_CancelBooking value) cancelBooking,
  }) {
    return setDataChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetExpandPreviousSession value)?
        setExpandPreviousSession,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ShowQrCode value)? generateOTP,
    TResult? Function(_ResetQrCode value)? resetOTP,
    TResult? Function(_SetDataChanged value)? setDataChanged,
    TResult? Function(_CancelBooking value)? cancelBooking,
  }) {
    return setDataChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetExpandPreviousSession value)? setExpandPreviousSession,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ShowQrCode value)? generateOTP,
    TResult Function(_ResetQrCode value)? resetOTP,
    TResult Function(_SetDataChanged value)? setDataChanged,
    TResult Function(_CancelBooking value)? cancelBooking,
    required TResult orElse(),
  }) {
    if (setDataChanged != null) {
      return setDataChanged(this);
    }
    return orElse();
  }
}

abstract class _SetDataChanged implements BookedTherapyDetailEvent {
  const factory _SetDataChanged() = _$SetDataChangedImpl;
}

/// @nodoc
abstract class _$$CancelBookingImplCopyWith<$Res> {
  factory _$$CancelBookingImplCopyWith(
          _$CancelBookingImpl value, $Res Function(_$CancelBookingImpl) then) =
      __$$CancelBookingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelBookingImplCopyWithImpl<$Res>
    extends _$BookedTherapyDetailEventCopyWithImpl<$Res, _$CancelBookingImpl>
    implements _$$CancelBookingImplCopyWith<$Res> {
  __$$CancelBookingImplCopyWithImpl(
      _$CancelBookingImpl _value, $Res Function(_$CancelBookingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CancelBookingImpl implements _CancelBooking {
  const _$CancelBookingImpl();

  @override
  String toString() {
    return 'BookedTherapyDetailEvent.cancelBooking()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelBookingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookedTherapyInfo bookedTherapy) initialize,
    required TResult Function() setExpandPreviousSession,
    required TResult Function() refresh,
    required TResult Function(bool isStart, SessionModel session) generateOTP,
    required TResult Function() resetOTP,
    required TResult Function() setDataChanged,
    required TResult Function() cancelBooking,
  }) {
    return cancelBooking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult? Function()? setExpandPreviousSession,
    TResult? Function()? refresh,
    TResult? Function(bool isStart, SessionModel session)? generateOTP,
    TResult? Function()? resetOTP,
    TResult? Function()? setDataChanged,
    TResult? Function()? cancelBooking,
  }) {
    return cancelBooking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookedTherapyInfo bookedTherapy)? initialize,
    TResult Function()? setExpandPreviousSession,
    TResult Function()? refresh,
    TResult Function(bool isStart, SessionModel session)? generateOTP,
    TResult Function()? resetOTP,
    TResult Function()? setDataChanged,
    TResult Function()? cancelBooking,
    required TResult orElse(),
  }) {
    if (cancelBooking != null) {
      return cancelBooking();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetExpandPreviousSession value)
        setExpandPreviousSession,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_ShowQrCode value) generateOTP,
    required TResult Function(_ResetQrCode value) resetOTP,
    required TResult Function(_SetDataChanged value) setDataChanged,
    required TResult Function(_CancelBooking value) cancelBooking,
  }) {
    return cancelBooking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetExpandPreviousSession value)?
        setExpandPreviousSession,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_ShowQrCode value)? generateOTP,
    TResult? Function(_ResetQrCode value)? resetOTP,
    TResult? Function(_SetDataChanged value)? setDataChanged,
    TResult? Function(_CancelBooking value)? cancelBooking,
  }) {
    return cancelBooking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetExpandPreviousSession value)? setExpandPreviousSession,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_ShowQrCode value)? generateOTP,
    TResult Function(_ResetQrCode value)? resetOTP,
    TResult Function(_SetDataChanged value)? setDataChanged,
    TResult Function(_CancelBooking value)? cancelBooking,
    required TResult orElse(),
  }) {
    if (cancelBooking != null) {
      return cancelBooking(this);
    }
    return orElse();
  }
}

abstract class _CancelBooking implements BookedTherapyDetailEvent {
  const factory _CancelBooking() = _$CancelBookingImpl;
}

/// @nodoc
mixin _$BookedTherapyDetailState {
  LoadingState get loadingState => throw _privateConstructorUsedError;
  bool get previousSessionExpanded => throw _privateConstructorUsedError;
  BookedTherapyInfo? get bookedTherapy => throw _privateConstructorUsedError;
  bool? get isStart => throw _privateConstructorUsedError;
  bool get dataChanged => throw _privateConstructorUsedError;
  SessionModel? get session => throw _privateConstructorUsedError;
  String? get otpError => throw _privateConstructorUsedError;
  bool get bookingCanceled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookedTherapyDetailStateCopyWith<BookedTherapyDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookedTherapyDetailStateCopyWith<$Res> {
  factory $BookedTherapyDetailStateCopyWith(BookedTherapyDetailState value,
          $Res Function(BookedTherapyDetailState) then) =
      _$BookedTherapyDetailStateCopyWithImpl<$Res, BookedTherapyDetailState>;
  @useResult
  $Res call(
      {LoadingState loadingState,
      bool previousSessionExpanded,
      BookedTherapyInfo? bookedTherapy,
      bool? isStart,
      bool dataChanged,
      SessionModel? session,
      String? otpError,
      bool bookingCanceled});
}

/// @nodoc
class _$BookedTherapyDetailStateCopyWithImpl<$Res,
        $Val extends BookedTherapyDetailState>
    implements $BookedTherapyDetailStateCopyWith<$Res> {
  _$BookedTherapyDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? previousSessionExpanded = null,
    Object? bookedTherapy = freezed,
    Object? isStart = freezed,
    Object? dataChanged = null,
    Object? session = freezed,
    Object? otpError = freezed,
    Object? bookingCanceled = null,
  }) {
    return _then(_value.copyWith(
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      previousSessionExpanded: null == previousSessionExpanded
          ? _value.previousSessionExpanded
          : previousSessionExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      bookedTherapy: freezed == bookedTherapy
          ? _value.bookedTherapy
          : bookedTherapy // ignore: cast_nullable_to_non_nullable
              as BookedTherapyInfo?,
      isStart: freezed == isStart
          ? _value.isStart
          : isStart // ignore: cast_nullable_to_non_nullable
              as bool?,
      dataChanged: null == dataChanged
          ? _value.dataChanged
          : dataChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as SessionModel?,
      otpError: freezed == otpError
          ? _value.otpError
          : otpError // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingCanceled: null == bookingCanceled
          ? _value.bookingCanceled
          : bookingCanceled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookedTherapyDetailStateImplCopyWith<$Res>
    implements $BookedTherapyDetailStateCopyWith<$Res> {
  factory _$$BookedTherapyDetailStateImplCopyWith(
          _$BookedTherapyDetailStateImpl value,
          $Res Function(_$BookedTherapyDetailStateImpl) then) =
      __$$BookedTherapyDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingState loadingState,
      bool previousSessionExpanded,
      BookedTherapyInfo? bookedTherapy,
      bool? isStart,
      bool dataChanged,
      SessionModel? session,
      String? otpError,
      bool bookingCanceled});
}

/// @nodoc
class __$$BookedTherapyDetailStateImplCopyWithImpl<$Res>
    extends _$BookedTherapyDetailStateCopyWithImpl<$Res,
        _$BookedTherapyDetailStateImpl>
    implements _$$BookedTherapyDetailStateImplCopyWith<$Res> {
  __$$BookedTherapyDetailStateImplCopyWithImpl(
      _$BookedTherapyDetailStateImpl _value,
      $Res Function(_$BookedTherapyDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? previousSessionExpanded = null,
    Object? bookedTherapy = freezed,
    Object? isStart = freezed,
    Object? dataChanged = null,
    Object? session = freezed,
    Object? otpError = freezed,
    Object? bookingCanceled = null,
  }) {
    return _then(_$BookedTherapyDetailStateImpl(
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      previousSessionExpanded: null == previousSessionExpanded
          ? _value.previousSessionExpanded
          : previousSessionExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      bookedTherapy: freezed == bookedTherapy
          ? _value.bookedTherapy
          : bookedTherapy // ignore: cast_nullable_to_non_nullable
              as BookedTherapyInfo?,
      isStart: freezed == isStart
          ? _value.isStart
          : isStart // ignore: cast_nullable_to_non_nullable
              as bool?,
      dataChanged: null == dataChanged
          ? _value.dataChanged
          : dataChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as SessionModel?,
      otpError: freezed == otpError
          ? _value.otpError
          : otpError // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingCanceled: null == bookingCanceled
          ? _value.bookingCanceled
          : bookingCanceled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BookedTherapyDetailStateImpl implements _BookedTherapyDetailState {
  const _$BookedTherapyDetailStateImpl(
      {required this.loadingState,
      required this.previousSessionExpanded,
      required this.bookedTherapy,
      required this.isStart,
      required this.dataChanged,
      required this.session,
      required this.otpError,
      required this.bookingCanceled});

  @override
  final LoadingState loadingState;
  @override
  final bool previousSessionExpanded;
  @override
  final BookedTherapyInfo? bookedTherapy;
  @override
  final bool? isStart;
  @override
  final bool dataChanged;
  @override
  final SessionModel? session;
  @override
  final String? otpError;
  @override
  final bool bookingCanceled;

  @override
  String toString() {
    return 'BookedTherapyDetailState(loadingState: $loadingState, previousSessionExpanded: $previousSessionExpanded, bookedTherapy: $bookedTherapy, isStart: $isStart, dataChanged: $dataChanged, session: $session, otpError: $otpError, bookingCanceled: $bookingCanceled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookedTherapyDetailStateImpl &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(
                    other.previousSessionExpanded, previousSessionExpanded) ||
                other.previousSessionExpanded == previousSessionExpanded) &&
            (identical(other.bookedTherapy, bookedTherapy) ||
                other.bookedTherapy == bookedTherapy) &&
            (identical(other.isStart, isStart) || other.isStart == isStart) &&
            (identical(other.dataChanged, dataChanged) ||
                other.dataChanged == dataChanged) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.otpError, otpError) ||
                other.otpError == otpError) &&
            (identical(other.bookingCanceled, bookingCanceled) ||
                other.bookingCanceled == bookingCanceled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadingState,
      previousSessionExpanded,
      bookedTherapy,
      isStart,
      dataChanged,
      session,
      otpError,
      bookingCanceled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookedTherapyDetailStateImplCopyWith<_$BookedTherapyDetailStateImpl>
      get copyWith => __$$BookedTherapyDetailStateImplCopyWithImpl<
          _$BookedTherapyDetailStateImpl>(this, _$identity);
}

abstract class _BookedTherapyDetailState implements BookedTherapyDetailState {
  const factory _BookedTherapyDetailState(
      {required final LoadingState loadingState,
      required final bool previousSessionExpanded,
      required final BookedTherapyInfo? bookedTherapy,
      required final bool? isStart,
      required final bool dataChanged,
      required final SessionModel? session,
      required final String? otpError,
      required final bool bookingCanceled}) = _$BookedTherapyDetailStateImpl;

  @override
  LoadingState get loadingState;
  @override
  bool get previousSessionExpanded;
  @override
  BookedTherapyInfo? get bookedTherapy;
  @override
  bool? get isStart;
  @override
  bool get dataChanged;
  @override
  SessionModel? get session;
  @override
  String? get otpError;
  @override
  bool get bookingCanceled;
  @override
  @JsonKey(ignore: true)
  _$$BookedTherapyDetailStateImplCopyWith<_$BookedTherapyDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
