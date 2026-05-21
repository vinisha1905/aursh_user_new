// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_booking_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConsultationBookingDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String consultationBookingId)
        getConsultationCancellationInfo,
    required TResult Function(String reason) cancelConsultation,
    required TResult Function() resetErrorMessage,
    required TResult Function(String callType) getRtcToken,
    required TResult Function() cleanRtcToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String consultationBookingId)?
        getConsultationCancellationInfo,
    TResult? Function(String reason)? cancelConsultation,
    TResult? Function()? resetErrorMessage,
    TResult? Function(String callType)? getRtcToken,
    TResult? Function()? cleanRtcToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String consultationBookingId)?
        getConsultationCancellationInfo,
    TResult Function(String reason)? cancelConsultation,
    TResult Function()? resetErrorMessage,
    TResult Function(String callType)? getRtcToken,
    TResult Function()? cleanRtcToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetConsultationCancellationInfo value)
        getConsultationCancellationInfo,
    required TResult Function(_CancelConsultation value) cancelConsultation,
    required TResult Function(_ResetErrorMessage value) resetErrorMessage,
    required TResult Function(_GetRtcToken value) getRtcToken,
    required TResult Function(_CleanRtcToken value) cleanRtcToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetConsultationCancellationInfo value)?
        getConsultationCancellationInfo,
    TResult? Function(_CancelConsultation value)? cancelConsultation,
    TResult? Function(_ResetErrorMessage value)? resetErrorMessage,
    TResult? Function(_GetRtcToken value)? getRtcToken,
    TResult? Function(_CleanRtcToken value)? cleanRtcToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetConsultationCancellationInfo value)?
        getConsultationCancellationInfo,
    TResult Function(_CancelConsultation value)? cancelConsultation,
    TResult Function(_ResetErrorMessage value)? resetErrorMessage,
    TResult Function(_GetRtcToken value)? getRtcToken,
    TResult Function(_CleanRtcToken value)? cleanRtcToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationBookingDetailEventCopyWith<$Res> {
  factory $ConsultationBookingDetailEventCopyWith(
          ConsultationBookingDetailEvent value,
          $Res Function(ConsultationBookingDetailEvent) then) =
      _$ConsultationBookingDetailEventCopyWithImpl<$Res,
          ConsultationBookingDetailEvent>;
}

/// @nodoc
class _$ConsultationBookingDetailEventCopyWithImpl<$Res,
        $Val extends ConsultationBookingDetailEvent>
    implements $ConsultationBookingDetailEventCopyWith<$Res> {
  _$ConsultationBookingDetailEventCopyWithImpl(this._value, this._then);

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
  $Res call({InternalConsultationModel consultation});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$ConsultationBookingDetailEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultation = null,
  }) {
    return _then(_$InitializeImpl(
      null == consultation
          ? _value.consultation
          : consultation // ignore: cast_nullable_to_non_nullable
              as InternalConsultationModel,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.consultation);

  @override
  final InternalConsultationModel consultation;

  @override
  String toString() {
    return 'ConsultationBookingDetailEvent.initialize(consultation: $consultation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.consultation, consultation) ||
                other.consultation == consultation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, consultation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String consultationBookingId)
        getConsultationCancellationInfo,
    required TResult Function(String reason) cancelConsultation,
    required TResult Function() resetErrorMessage,
    required TResult Function(String callType) getRtcToken,
    required TResult Function() cleanRtcToken,
  }) {
    return initialize(consultation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String consultationBookingId)?
        getConsultationCancellationInfo,
    TResult? Function(String reason)? cancelConsultation,
    TResult? Function()? resetErrorMessage,
    TResult? Function(String callType)? getRtcToken,
    TResult? Function()? cleanRtcToken,
  }) {
    return initialize?.call(consultation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String consultationBookingId)?
        getConsultationCancellationInfo,
    TResult Function(String reason)? cancelConsultation,
    TResult Function()? resetErrorMessage,
    TResult Function(String callType)? getRtcToken,
    TResult Function()? cleanRtcToken,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(consultation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetConsultationCancellationInfo value)
        getConsultationCancellationInfo,
    required TResult Function(_CancelConsultation value) cancelConsultation,
    required TResult Function(_ResetErrorMessage value) resetErrorMessage,
    required TResult Function(_GetRtcToken value) getRtcToken,
    required TResult Function(_CleanRtcToken value) cleanRtcToken,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetConsultationCancellationInfo value)?
        getConsultationCancellationInfo,
    TResult? Function(_CancelConsultation value)? cancelConsultation,
    TResult? Function(_ResetErrorMessage value)? resetErrorMessage,
    TResult? Function(_GetRtcToken value)? getRtcToken,
    TResult? Function(_CleanRtcToken value)? cleanRtcToken,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetConsultationCancellationInfo value)?
        getConsultationCancellationInfo,
    TResult Function(_CancelConsultation value)? cancelConsultation,
    TResult Function(_ResetErrorMessage value)? resetErrorMessage,
    TResult Function(_GetRtcToken value)? getRtcToken,
    TResult Function(_CleanRtcToken value)? cleanRtcToken,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ConsultationBookingDetailEvent {
  const factory _Initialize(final InternalConsultationModel consultation) =
      _$InitializeImpl;

  InternalConsultationModel get consultation;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetConsultationCancellationInfoImplCopyWith<$Res> {
  factory _$$GetConsultationCancellationInfoImplCopyWith(
          _$GetConsultationCancellationInfoImpl value,
          $Res Function(_$GetConsultationCancellationInfoImpl) then) =
      __$$GetConsultationCancellationInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String consultationBookingId});
}

/// @nodoc
class __$$GetConsultationCancellationInfoImplCopyWithImpl<$Res>
    extends _$ConsultationBookingDetailEventCopyWithImpl<$Res,
        _$GetConsultationCancellationInfoImpl>
    implements _$$GetConsultationCancellationInfoImplCopyWith<$Res> {
  __$$GetConsultationCancellationInfoImplCopyWithImpl(
      _$GetConsultationCancellationInfoImpl _value,
      $Res Function(_$GetConsultationCancellationInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultationBookingId = null,
  }) {
    return _then(_$GetConsultationCancellationInfoImpl(
      null == consultationBookingId
          ? _value.consultationBookingId
          : consultationBookingId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetConsultationCancellationInfoImpl
    implements _GetConsultationCancellationInfo {
  const _$GetConsultationCancellationInfoImpl(this.consultationBookingId);

  @override
  final String consultationBookingId;

  @override
  String toString() {
    return 'ConsultationBookingDetailEvent.getConsultationCancellationInfo(consultationBookingId: $consultationBookingId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetConsultationCancellationInfoImpl &&
            (identical(other.consultationBookingId, consultationBookingId) ||
                other.consultationBookingId == consultationBookingId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, consultationBookingId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetConsultationCancellationInfoImplCopyWith<
          _$GetConsultationCancellationInfoImpl>
      get copyWith => __$$GetConsultationCancellationInfoImplCopyWithImpl<
          _$GetConsultationCancellationInfoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String consultationBookingId)
        getConsultationCancellationInfo,
    required TResult Function(String reason) cancelConsultation,
    required TResult Function() resetErrorMessage,
    required TResult Function(String callType) getRtcToken,
    required TResult Function() cleanRtcToken,
  }) {
    return getConsultationCancellationInfo(consultationBookingId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String consultationBookingId)?
        getConsultationCancellationInfo,
    TResult? Function(String reason)? cancelConsultation,
    TResult? Function()? resetErrorMessage,
    TResult? Function(String callType)? getRtcToken,
    TResult? Function()? cleanRtcToken,
  }) {
    return getConsultationCancellationInfo?.call(consultationBookingId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String consultationBookingId)?
        getConsultationCancellationInfo,
    TResult Function(String reason)? cancelConsultation,
    TResult Function()? resetErrorMessage,
    TResult Function(String callType)? getRtcToken,
    TResult Function()? cleanRtcToken,
    required TResult orElse(),
  }) {
    if (getConsultationCancellationInfo != null) {
      return getConsultationCancellationInfo(consultationBookingId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetConsultationCancellationInfo value)
        getConsultationCancellationInfo,
    required TResult Function(_CancelConsultation value) cancelConsultation,
    required TResult Function(_ResetErrorMessage value) resetErrorMessage,
    required TResult Function(_GetRtcToken value) getRtcToken,
    required TResult Function(_CleanRtcToken value) cleanRtcToken,
  }) {
    return getConsultationCancellationInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetConsultationCancellationInfo value)?
        getConsultationCancellationInfo,
    TResult? Function(_CancelConsultation value)? cancelConsultation,
    TResult? Function(_ResetErrorMessage value)? resetErrorMessage,
    TResult? Function(_GetRtcToken value)? getRtcToken,
    TResult? Function(_CleanRtcToken value)? cleanRtcToken,
  }) {
    return getConsultationCancellationInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetConsultationCancellationInfo value)?
        getConsultationCancellationInfo,
    TResult Function(_CancelConsultation value)? cancelConsultation,
    TResult Function(_ResetErrorMessage value)? resetErrorMessage,
    TResult Function(_GetRtcToken value)? getRtcToken,
    TResult Function(_CleanRtcToken value)? cleanRtcToken,
    required TResult orElse(),
  }) {
    if (getConsultationCancellationInfo != null) {
      return getConsultationCancellationInfo(this);
    }
    return orElse();
  }
}

abstract class _GetConsultationCancellationInfo
    implements ConsultationBookingDetailEvent {
  const factory _GetConsultationCancellationInfo(
          final String consultationBookingId) =
      _$GetConsultationCancellationInfoImpl;

  String get consultationBookingId;
  @JsonKey(ignore: true)
  _$$GetConsultationCancellationInfoImplCopyWith<
          _$GetConsultationCancellationInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelConsultationImplCopyWith<$Res> {
  factory _$$CancelConsultationImplCopyWith(_$CancelConsultationImpl value,
          $Res Function(_$CancelConsultationImpl) then) =
      __$$CancelConsultationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$CancelConsultationImplCopyWithImpl<$Res>
    extends _$ConsultationBookingDetailEventCopyWithImpl<$Res,
        _$CancelConsultationImpl>
    implements _$$CancelConsultationImplCopyWith<$Res> {
  __$$CancelConsultationImplCopyWithImpl(_$CancelConsultationImpl _value,
      $Res Function(_$CancelConsultationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_$CancelConsultationImpl(
      null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CancelConsultationImpl implements _CancelConsultation {
  const _$CancelConsultationImpl(this.reason);

  @override
  final String reason;

  @override
  String toString() {
    return 'ConsultationBookingDetailEvent.cancelConsultation(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelConsultationImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelConsultationImplCopyWith<_$CancelConsultationImpl> get copyWith =>
      __$$CancelConsultationImplCopyWithImpl<_$CancelConsultationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String consultationBookingId)
        getConsultationCancellationInfo,
    required TResult Function(String reason) cancelConsultation,
    required TResult Function() resetErrorMessage,
    required TResult Function(String callType) getRtcToken,
    required TResult Function() cleanRtcToken,
  }) {
    return cancelConsultation(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String consultationBookingId)?
        getConsultationCancellationInfo,
    TResult? Function(String reason)? cancelConsultation,
    TResult? Function()? resetErrorMessage,
    TResult? Function(String callType)? getRtcToken,
    TResult? Function()? cleanRtcToken,
  }) {
    return cancelConsultation?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String consultationBookingId)?
        getConsultationCancellationInfo,
    TResult Function(String reason)? cancelConsultation,
    TResult Function()? resetErrorMessage,
    TResult Function(String callType)? getRtcToken,
    TResult Function()? cleanRtcToken,
    required TResult orElse(),
  }) {
    if (cancelConsultation != null) {
      return cancelConsultation(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetConsultationCancellationInfo value)
        getConsultationCancellationInfo,
    required TResult Function(_CancelConsultation value) cancelConsultation,
    required TResult Function(_ResetErrorMessage value) resetErrorMessage,
    required TResult Function(_GetRtcToken value) getRtcToken,
    required TResult Function(_CleanRtcToken value) cleanRtcToken,
  }) {
    return cancelConsultation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetConsultationCancellationInfo value)?
        getConsultationCancellationInfo,
    TResult? Function(_CancelConsultation value)? cancelConsultation,
    TResult? Function(_ResetErrorMessage value)? resetErrorMessage,
    TResult? Function(_GetRtcToken value)? getRtcToken,
    TResult? Function(_CleanRtcToken value)? cleanRtcToken,
  }) {
    return cancelConsultation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetConsultationCancellationInfo value)?
        getConsultationCancellationInfo,
    TResult Function(_CancelConsultation value)? cancelConsultation,
    TResult Function(_ResetErrorMessage value)? resetErrorMessage,
    TResult Function(_GetRtcToken value)? getRtcToken,
    TResult Function(_CleanRtcToken value)? cleanRtcToken,
    required TResult orElse(),
  }) {
    if (cancelConsultation != null) {
      return cancelConsultation(this);
    }
    return orElse();
  }
}

abstract class _CancelConsultation implements ConsultationBookingDetailEvent {
  const factory _CancelConsultation(final String reason) =
      _$CancelConsultationImpl;

  String get reason;
  @JsonKey(ignore: true)
  _$$CancelConsultationImplCopyWith<_$CancelConsultationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetErrorMessageImplCopyWith<$Res> {
  factory _$$ResetErrorMessageImplCopyWith(_$ResetErrorMessageImpl value,
          $Res Function(_$ResetErrorMessageImpl) then) =
      __$$ResetErrorMessageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetErrorMessageImplCopyWithImpl<$Res>
    extends _$ConsultationBookingDetailEventCopyWithImpl<$Res,
        _$ResetErrorMessageImpl>
    implements _$$ResetErrorMessageImplCopyWith<$Res> {
  __$$ResetErrorMessageImplCopyWithImpl(_$ResetErrorMessageImpl _value,
      $Res Function(_$ResetErrorMessageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetErrorMessageImpl implements _ResetErrorMessage {
  const _$ResetErrorMessageImpl();

  @override
  String toString() {
    return 'ConsultationBookingDetailEvent.resetErrorMessage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetErrorMessageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String consultationBookingId)
        getConsultationCancellationInfo,
    required TResult Function(String reason) cancelConsultation,
    required TResult Function() resetErrorMessage,
    required TResult Function(String callType) getRtcToken,
    required TResult Function() cleanRtcToken,
  }) {
    return resetErrorMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String consultationBookingId)?
        getConsultationCancellationInfo,
    TResult? Function(String reason)? cancelConsultation,
    TResult? Function()? resetErrorMessage,
    TResult? Function(String callType)? getRtcToken,
    TResult? Function()? cleanRtcToken,
  }) {
    return resetErrorMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String consultationBookingId)?
        getConsultationCancellationInfo,
    TResult Function(String reason)? cancelConsultation,
    TResult Function()? resetErrorMessage,
    TResult Function(String callType)? getRtcToken,
    TResult Function()? cleanRtcToken,
    required TResult orElse(),
  }) {
    if (resetErrorMessage != null) {
      return resetErrorMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetConsultationCancellationInfo value)
        getConsultationCancellationInfo,
    required TResult Function(_CancelConsultation value) cancelConsultation,
    required TResult Function(_ResetErrorMessage value) resetErrorMessage,
    required TResult Function(_GetRtcToken value) getRtcToken,
    required TResult Function(_CleanRtcToken value) cleanRtcToken,
  }) {
    return resetErrorMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetConsultationCancellationInfo value)?
        getConsultationCancellationInfo,
    TResult? Function(_CancelConsultation value)? cancelConsultation,
    TResult? Function(_ResetErrorMessage value)? resetErrorMessage,
    TResult? Function(_GetRtcToken value)? getRtcToken,
    TResult? Function(_CleanRtcToken value)? cleanRtcToken,
  }) {
    return resetErrorMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetConsultationCancellationInfo value)?
        getConsultationCancellationInfo,
    TResult Function(_CancelConsultation value)? cancelConsultation,
    TResult Function(_ResetErrorMessage value)? resetErrorMessage,
    TResult Function(_GetRtcToken value)? getRtcToken,
    TResult Function(_CleanRtcToken value)? cleanRtcToken,
    required TResult orElse(),
  }) {
    if (resetErrorMessage != null) {
      return resetErrorMessage(this);
    }
    return orElse();
  }
}

abstract class _ResetErrorMessage implements ConsultationBookingDetailEvent {
  const factory _ResetErrorMessage() = _$ResetErrorMessageImpl;
}

/// @nodoc
abstract class _$$GetRtcTokenImplCopyWith<$Res> {
  factory _$$GetRtcTokenImplCopyWith(
          _$GetRtcTokenImpl value, $Res Function(_$GetRtcTokenImpl) then) =
      __$$GetRtcTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String callType});
}

/// @nodoc
class __$$GetRtcTokenImplCopyWithImpl<$Res>
    extends _$ConsultationBookingDetailEventCopyWithImpl<$Res,
        _$GetRtcTokenImpl> implements _$$GetRtcTokenImplCopyWith<$Res> {
  __$$GetRtcTokenImplCopyWithImpl(
      _$GetRtcTokenImpl _value, $Res Function(_$GetRtcTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callType = null,
  }) {
    return _then(_$GetRtcTokenImpl(
      null == callType
          ? _value.callType
          : callType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetRtcTokenImpl implements _GetRtcToken {
  const _$GetRtcTokenImpl(this.callType);

  @override
  final String callType;

  @override
  String toString() {
    return 'ConsultationBookingDetailEvent.getRtcToken(callType: $callType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRtcTokenImpl &&
            (identical(other.callType, callType) ||
                other.callType == callType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, callType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRtcTokenImplCopyWith<_$GetRtcTokenImpl> get copyWith =>
      __$$GetRtcTokenImplCopyWithImpl<_$GetRtcTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String consultationBookingId)
        getConsultationCancellationInfo,
    required TResult Function(String reason) cancelConsultation,
    required TResult Function() resetErrorMessage,
    required TResult Function(String callType) getRtcToken,
    required TResult Function() cleanRtcToken,
  }) {
    return getRtcToken(callType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String consultationBookingId)?
        getConsultationCancellationInfo,
    TResult? Function(String reason)? cancelConsultation,
    TResult? Function()? resetErrorMessage,
    TResult? Function(String callType)? getRtcToken,
    TResult? Function()? cleanRtcToken,
  }) {
    return getRtcToken?.call(callType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String consultationBookingId)?
        getConsultationCancellationInfo,
    TResult Function(String reason)? cancelConsultation,
    TResult Function()? resetErrorMessage,
    TResult Function(String callType)? getRtcToken,
    TResult Function()? cleanRtcToken,
    required TResult orElse(),
  }) {
    if (getRtcToken != null) {
      return getRtcToken(callType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetConsultationCancellationInfo value)
        getConsultationCancellationInfo,
    required TResult Function(_CancelConsultation value) cancelConsultation,
    required TResult Function(_ResetErrorMessage value) resetErrorMessage,
    required TResult Function(_GetRtcToken value) getRtcToken,
    required TResult Function(_CleanRtcToken value) cleanRtcToken,
  }) {
    return getRtcToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetConsultationCancellationInfo value)?
        getConsultationCancellationInfo,
    TResult? Function(_CancelConsultation value)? cancelConsultation,
    TResult? Function(_ResetErrorMessage value)? resetErrorMessage,
    TResult? Function(_GetRtcToken value)? getRtcToken,
    TResult? Function(_CleanRtcToken value)? cleanRtcToken,
  }) {
    return getRtcToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetConsultationCancellationInfo value)?
        getConsultationCancellationInfo,
    TResult Function(_CancelConsultation value)? cancelConsultation,
    TResult Function(_ResetErrorMessage value)? resetErrorMessage,
    TResult Function(_GetRtcToken value)? getRtcToken,
    TResult Function(_CleanRtcToken value)? cleanRtcToken,
    required TResult orElse(),
  }) {
    if (getRtcToken != null) {
      return getRtcToken(this);
    }
    return orElse();
  }
}

abstract class _GetRtcToken implements ConsultationBookingDetailEvent {
  const factory _GetRtcToken(final String callType) = _$GetRtcTokenImpl;

  String get callType;
  @JsonKey(ignore: true)
  _$$GetRtcTokenImplCopyWith<_$GetRtcTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CleanRtcTokenImplCopyWith<$Res> {
  factory _$$CleanRtcTokenImplCopyWith(
          _$CleanRtcTokenImpl value, $Res Function(_$CleanRtcTokenImpl) then) =
      __$$CleanRtcTokenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CleanRtcTokenImplCopyWithImpl<$Res>
    extends _$ConsultationBookingDetailEventCopyWithImpl<$Res,
        _$CleanRtcTokenImpl> implements _$$CleanRtcTokenImplCopyWith<$Res> {
  __$$CleanRtcTokenImplCopyWithImpl(
      _$CleanRtcTokenImpl _value, $Res Function(_$CleanRtcTokenImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CleanRtcTokenImpl implements _CleanRtcToken {
  const _$CleanRtcTokenImpl();

  @override
  String toString() {
    return 'ConsultationBookingDetailEvent.cleanRtcToken()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CleanRtcTokenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InternalConsultationModel consultation)
        initialize,
    required TResult Function(String consultationBookingId)
        getConsultationCancellationInfo,
    required TResult Function(String reason) cancelConsultation,
    required TResult Function() resetErrorMessage,
    required TResult Function(String callType) getRtcToken,
    required TResult Function() cleanRtcToken,
  }) {
    return cleanRtcToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InternalConsultationModel consultation)? initialize,
    TResult? Function(String consultationBookingId)?
        getConsultationCancellationInfo,
    TResult? Function(String reason)? cancelConsultation,
    TResult? Function()? resetErrorMessage,
    TResult? Function(String callType)? getRtcToken,
    TResult? Function()? cleanRtcToken,
  }) {
    return cleanRtcToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InternalConsultationModel consultation)? initialize,
    TResult Function(String consultationBookingId)?
        getConsultationCancellationInfo,
    TResult Function(String reason)? cancelConsultation,
    TResult Function()? resetErrorMessage,
    TResult Function(String callType)? getRtcToken,
    TResult Function()? cleanRtcToken,
    required TResult orElse(),
  }) {
    if (cleanRtcToken != null) {
      return cleanRtcToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetConsultationCancellationInfo value)
        getConsultationCancellationInfo,
    required TResult Function(_CancelConsultation value) cancelConsultation,
    required TResult Function(_ResetErrorMessage value) resetErrorMessage,
    required TResult Function(_GetRtcToken value) getRtcToken,
    required TResult Function(_CleanRtcToken value) cleanRtcToken,
  }) {
    return cleanRtcToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetConsultationCancellationInfo value)?
        getConsultationCancellationInfo,
    TResult? Function(_CancelConsultation value)? cancelConsultation,
    TResult? Function(_ResetErrorMessage value)? resetErrorMessage,
    TResult? Function(_GetRtcToken value)? getRtcToken,
    TResult? Function(_CleanRtcToken value)? cleanRtcToken,
  }) {
    return cleanRtcToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetConsultationCancellationInfo value)?
        getConsultationCancellationInfo,
    TResult Function(_CancelConsultation value)? cancelConsultation,
    TResult Function(_ResetErrorMessage value)? resetErrorMessage,
    TResult Function(_GetRtcToken value)? getRtcToken,
    TResult Function(_CleanRtcToken value)? cleanRtcToken,
    required TResult orElse(),
  }) {
    if (cleanRtcToken != null) {
      return cleanRtcToken(this);
    }
    return orElse();
  }
}

abstract class _CleanRtcToken implements ConsultationBookingDetailEvent {
  const factory _CleanRtcToken() = _$CleanRtcTokenImpl;
}

/// @nodoc
mixin _$ConsultationBookingDetailState {
  InternalConsultationModel? get consultation =>
      throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get callType => throw _privateConstructorUsedError;
  Either<String, DefaultResponse>? get cancelConsultationResult =>
      throw _privateConstructorUsedError;
  ConsultationCancellationInfoModel? get cancellationInfo =>
      throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get rtcToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConsultationBookingDetailStateCopyWith<ConsultationBookingDetailState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationBookingDetailStateCopyWith<$Res> {
  factory $ConsultationBookingDetailStateCopyWith(
          ConsultationBookingDetailState value,
          $Res Function(ConsultationBookingDetailState) then) =
      _$ConsultationBookingDetailStateCopyWithImpl<$Res,
          ConsultationBookingDetailState>;
  @useResult
  $Res call(
      {InternalConsultationModel? consultation,
      LoadingState loadingState,
      String? errorMessage,
      String? callType,
      Either<String, DefaultResponse>? cancelConsultationResult,
      ConsultationCancellationInfoModel? cancellationInfo,
      String? userId,
      String? rtcToken});
}

/// @nodoc
class _$ConsultationBookingDetailStateCopyWithImpl<$Res,
        $Val extends ConsultationBookingDetailState>
    implements $ConsultationBookingDetailStateCopyWith<$Res> {
  _$ConsultationBookingDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultation = freezed,
    Object? loadingState = null,
    Object? errorMessage = freezed,
    Object? callType = freezed,
    Object? cancelConsultationResult = freezed,
    Object? cancellationInfo = freezed,
    Object? userId = freezed,
    Object? rtcToken = freezed,
  }) {
    return _then(_value.copyWith(
      consultation: freezed == consultation
          ? _value.consultation
          : consultation // ignore: cast_nullable_to_non_nullable
              as InternalConsultationModel?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      callType: freezed == callType
          ? _value.callType
          : callType // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelConsultationResult: freezed == cancelConsultationResult
          ? _value.cancelConsultationResult
          : cancelConsultationResult // ignore: cast_nullable_to_non_nullable
              as Either<String, DefaultResponse>?,
      cancellationInfo: freezed == cancellationInfo
          ? _value.cancellationInfo
          : cancellationInfo // ignore: cast_nullable_to_non_nullable
              as ConsultationCancellationInfoModel?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      rtcToken: freezed == rtcToken
          ? _value.rtcToken
          : rtcToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsultationBookingDetailStateImplCopyWith<$Res>
    implements $ConsultationBookingDetailStateCopyWith<$Res> {
  factory _$$ConsultationBookingDetailStateImplCopyWith(
          _$ConsultationBookingDetailStateImpl value,
          $Res Function(_$ConsultationBookingDetailStateImpl) then) =
      __$$ConsultationBookingDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {InternalConsultationModel? consultation,
      LoadingState loadingState,
      String? errorMessage,
      String? callType,
      Either<String, DefaultResponse>? cancelConsultationResult,
      ConsultationCancellationInfoModel? cancellationInfo,
      String? userId,
      String? rtcToken});
}

/// @nodoc
class __$$ConsultationBookingDetailStateImplCopyWithImpl<$Res>
    extends _$ConsultationBookingDetailStateCopyWithImpl<$Res,
        _$ConsultationBookingDetailStateImpl>
    implements _$$ConsultationBookingDetailStateImplCopyWith<$Res> {
  __$$ConsultationBookingDetailStateImplCopyWithImpl(
      _$ConsultationBookingDetailStateImpl _value,
      $Res Function(_$ConsultationBookingDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultation = freezed,
    Object? loadingState = null,
    Object? errorMessage = freezed,
    Object? callType = freezed,
    Object? cancelConsultationResult = freezed,
    Object? cancellationInfo = freezed,
    Object? userId = freezed,
    Object? rtcToken = freezed,
  }) {
    return _then(_$ConsultationBookingDetailStateImpl(
      consultation: freezed == consultation
          ? _value.consultation
          : consultation // ignore: cast_nullable_to_non_nullable
              as InternalConsultationModel?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      callType: freezed == callType
          ? _value.callType
          : callType // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelConsultationResult: freezed == cancelConsultationResult
          ? _value.cancelConsultationResult
          : cancelConsultationResult // ignore: cast_nullable_to_non_nullable
              as Either<String, DefaultResponse>?,
      cancellationInfo: freezed == cancellationInfo
          ? _value.cancellationInfo
          : cancellationInfo // ignore: cast_nullable_to_non_nullable
              as ConsultationCancellationInfoModel?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      rtcToken: freezed == rtcToken
          ? _value.rtcToken
          : rtcToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ConsultationBookingDetailStateImpl
    implements _ConsultationBookingDetailState {
  const _$ConsultationBookingDetailStateImpl(
      {required this.consultation,
      required this.loadingState,
      required this.errorMessage,
      required this.callType,
      required this.cancelConsultationResult,
      required this.cancellationInfo,
      required this.userId,
      required this.rtcToken});

  @override
  final InternalConsultationModel? consultation;
  @override
  final LoadingState loadingState;
  @override
  final String? errorMessage;
  @override
  final String? callType;
  @override
  final Either<String, DefaultResponse>? cancelConsultationResult;
  @override
  final ConsultationCancellationInfoModel? cancellationInfo;
  @override
  final String? userId;
  @override
  final String? rtcToken;

  @override
  String toString() {
    return 'ConsultationBookingDetailState(consultation: $consultation, loadingState: $loadingState, errorMessage: $errorMessage, callType: $callType, cancelConsultationResult: $cancelConsultationResult, cancellationInfo: $cancellationInfo, userId: $userId, rtcToken: $rtcToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationBookingDetailStateImpl &&
            (identical(other.consultation, consultation) ||
                other.consultation == consultation) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.callType, callType) ||
                other.callType == callType) &&
            (identical(
                    other.cancelConsultationResult, cancelConsultationResult) ||
                other.cancelConsultationResult == cancelConsultationResult) &&
            (identical(other.cancellationInfo, cancellationInfo) ||
                other.cancellationInfo == cancellationInfo) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.rtcToken, rtcToken) ||
                other.rtcToken == rtcToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      consultation,
      loadingState,
      errorMessage,
      callType,
      cancelConsultationResult,
      cancellationInfo,
      userId,
      rtcToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationBookingDetailStateImplCopyWith<
          _$ConsultationBookingDetailStateImpl>
      get copyWith => __$$ConsultationBookingDetailStateImplCopyWithImpl<
          _$ConsultationBookingDetailStateImpl>(this, _$identity);
}

abstract class _ConsultationBookingDetailState
    implements ConsultationBookingDetailState {
  const factory _ConsultationBookingDetailState(
      {required final InternalConsultationModel? consultation,
      required final LoadingState loadingState,
      required final String? errorMessage,
      required final String? callType,
      required final Either<String, DefaultResponse>? cancelConsultationResult,
      required final ConsultationCancellationInfoModel? cancellationInfo,
      required final String? userId,
      required final String? rtcToken}) = _$ConsultationBookingDetailStateImpl;

  @override
  InternalConsultationModel? get consultation;
  @override
  LoadingState get loadingState;
  @override
  String? get errorMessage;
  @override
  String? get callType;
  @override
  Either<String, DefaultResponse>? get cancelConsultationResult;
  @override
  ConsultationCancellationInfoModel? get cancellationInfo;
  @override
  String? get userId;
  @override
  String? get rtcToken;
  @override
  @JsonKey(ignore: true)
  _$$ConsultationBookingDetailStateImplCopyWith<
          _$ConsultationBookingDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
