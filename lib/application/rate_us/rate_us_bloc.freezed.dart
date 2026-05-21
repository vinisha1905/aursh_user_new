// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_us_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RateUsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bookingId, String therapyName,
            String therapistName, String therapistImageUrl)
        initialize,
    required TResult Function(int? therapyPoint) setTherapyPoint,
    required TResult Function(int? therapistPoint) setTherapistPoint,
    required TResult Function(
            String therapyDescription, String therapistDescription)
        submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bookingId, String therapyName,
            String therapistName, String therapistImageUrl)?
        initialize,
    TResult? Function(int? therapyPoint)? setTherapyPoint,
    TResult? Function(int? therapistPoint)? setTherapistPoint,
    TResult? Function(String therapyDescription, String therapistDescription)?
        submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bookingId, String therapyName, String therapistName,
            String therapistImageUrl)?
        initialize,
    TResult Function(int? therapyPoint)? setTherapyPoint,
    TResult Function(int? therapistPoint)? setTherapistPoint,
    TResult Function(String therapyDescription, String therapistDescription)?
        submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetTherapyPoint value) setTherapyPoint,
    required TResult Function(_SetTherapistPoint value) setTherapistPoint,
    required TResult Function(_Submit value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetTherapyPoint value)? setTherapyPoint,
    TResult? Function(_SetTherapistPoint value)? setTherapistPoint,
    TResult? Function(_Submit value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetTherapyPoint value)? setTherapyPoint,
    TResult Function(_SetTherapistPoint value)? setTherapistPoint,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateUsEventCopyWith<$Res> {
  factory $RateUsEventCopyWith(
          RateUsEvent value, $Res Function(RateUsEvent) then) =
      _$RateUsEventCopyWithImpl<$Res, RateUsEvent>;
}

/// @nodoc
class _$RateUsEventCopyWithImpl<$Res, $Val extends RateUsEvent>
    implements $RateUsEventCopyWith<$Res> {
  _$RateUsEventCopyWithImpl(this._value, this._then);

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
      {String bookingId,
      String therapyName,
      String therapistName,
      String therapistImageUrl});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$RateUsEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? therapyName = null,
    Object? therapistName = null,
    Object? therapistImageUrl = null,
  }) {
    return _then(_$InitializeImpl(
      null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      null == therapyName
          ? _value.therapyName
          : therapyName // ignore: cast_nullable_to_non_nullable
              as String,
      null == therapistName
          ? _value.therapistName
          : therapistName // ignore: cast_nullable_to_non_nullable
              as String,
      null == therapistImageUrl
          ? _value.therapistImageUrl
          : therapistImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.bookingId, this.therapyName, this.therapistName,
      this.therapistImageUrl);

  @override
  final String bookingId;
  @override
  final String therapyName;
  @override
  final String therapistName;
  @override
  final String therapistImageUrl;

  @override
  String toString() {
    return 'RateUsEvent.initialize(bookingId: $bookingId, therapyName: $therapyName, therapistName: $therapistName, therapistImageUrl: $therapistImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.therapyName, therapyName) ||
                other.therapyName == therapyName) &&
            (identical(other.therapistName, therapistName) ||
                other.therapistName == therapistName) &&
            (identical(other.therapistImageUrl, therapistImageUrl) ||
                other.therapistImageUrl == therapistImageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bookingId, therapyName, therapistName, therapistImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bookingId, String therapyName,
            String therapistName, String therapistImageUrl)
        initialize,
    required TResult Function(int? therapyPoint) setTherapyPoint,
    required TResult Function(int? therapistPoint) setTherapistPoint,
    required TResult Function(
            String therapyDescription, String therapistDescription)
        submit,
  }) {
    return initialize(bookingId, therapyName, therapistName, therapistImageUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bookingId, String therapyName,
            String therapistName, String therapistImageUrl)?
        initialize,
    TResult? Function(int? therapyPoint)? setTherapyPoint,
    TResult? Function(int? therapistPoint)? setTherapistPoint,
    TResult? Function(String therapyDescription, String therapistDescription)?
        submit,
  }) {
    return initialize?.call(
        bookingId, therapyName, therapistName, therapistImageUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bookingId, String therapyName, String therapistName,
            String therapistImageUrl)?
        initialize,
    TResult Function(int? therapyPoint)? setTherapyPoint,
    TResult Function(int? therapistPoint)? setTherapistPoint,
    TResult Function(String therapyDescription, String therapistDescription)?
        submit,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(
          bookingId, therapyName, therapistName, therapistImageUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetTherapyPoint value) setTherapyPoint,
    required TResult Function(_SetTherapistPoint value) setTherapistPoint,
    required TResult Function(_Submit value) submit,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetTherapyPoint value)? setTherapyPoint,
    TResult? Function(_SetTherapistPoint value)? setTherapistPoint,
    TResult? Function(_Submit value)? submit,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetTherapyPoint value)? setTherapyPoint,
    TResult Function(_SetTherapistPoint value)? setTherapistPoint,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements RateUsEvent {
  const factory _Initialize(
      final String bookingId,
      final String therapyName,
      final String therapistName,
      final String therapistImageUrl) = _$InitializeImpl;

  String get bookingId;
  String get therapyName;
  String get therapistName;
  String get therapistImageUrl;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetTherapyPointImplCopyWith<$Res> {
  factory _$$SetTherapyPointImplCopyWith(_$SetTherapyPointImpl value,
          $Res Function(_$SetTherapyPointImpl) then) =
      __$$SetTherapyPointImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? therapyPoint});
}

/// @nodoc
class __$$SetTherapyPointImplCopyWithImpl<$Res>
    extends _$RateUsEventCopyWithImpl<$Res, _$SetTherapyPointImpl>
    implements _$$SetTherapyPointImplCopyWith<$Res> {
  __$$SetTherapyPointImplCopyWithImpl(
      _$SetTherapyPointImpl _value, $Res Function(_$SetTherapyPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? therapyPoint = freezed,
  }) {
    return _then(_$SetTherapyPointImpl(
      freezed == therapyPoint
          ? _value.therapyPoint
          : therapyPoint // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SetTherapyPointImpl implements _SetTherapyPoint {
  const _$SetTherapyPointImpl(this.therapyPoint);

  @override
  final int? therapyPoint;

  @override
  String toString() {
    return 'RateUsEvent.setTherapyPoint(therapyPoint: $therapyPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetTherapyPointImpl &&
            (identical(other.therapyPoint, therapyPoint) ||
                other.therapyPoint == therapyPoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, therapyPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetTherapyPointImplCopyWith<_$SetTherapyPointImpl> get copyWith =>
      __$$SetTherapyPointImplCopyWithImpl<_$SetTherapyPointImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bookingId, String therapyName,
            String therapistName, String therapistImageUrl)
        initialize,
    required TResult Function(int? therapyPoint) setTherapyPoint,
    required TResult Function(int? therapistPoint) setTherapistPoint,
    required TResult Function(
            String therapyDescription, String therapistDescription)
        submit,
  }) {
    return setTherapyPoint(therapyPoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bookingId, String therapyName,
            String therapistName, String therapistImageUrl)?
        initialize,
    TResult? Function(int? therapyPoint)? setTherapyPoint,
    TResult? Function(int? therapistPoint)? setTherapistPoint,
    TResult? Function(String therapyDescription, String therapistDescription)?
        submit,
  }) {
    return setTherapyPoint?.call(therapyPoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bookingId, String therapyName, String therapistName,
            String therapistImageUrl)?
        initialize,
    TResult Function(int? therapyPoint)? setTherapyPoint,
    TResult Function(int? therapistPoint)? setTherapistPoint,
    TResult Function(String therapyDescription, String therapistDescription)?
        submit,
    required TResult orElse(),
  }) {
    if (setTherapyPoint != null) {
      return setTherapyPoint(therapyPoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetTherapyPoint value) setTherapyPoint,
    required TResult Function(_SetTherapistPoint value) setTherapistPoint,
    required TResult Function(_Submit value) submit,
  }) {
    return setTherapyPoint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetTherapyPoint value)? setTherapyPoint,
    TResult? Function(_SetTherapistPoint value)? setTherapistPoint,
    TResult? Function(_Submit value)? submit,
  }) {
    return setTherapyPoint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetTherapyPoint value)? setTherapyPoint,
    TResult Function(_SetTherapistPoint value)? setTherapistPoint,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (setTherapyPoint != null) {
      return setTherapyPoint(this);
    }
    return orElse();
  }
}

abstract class _SetTherapyPoint implements RateUsEvent {
  const factory _SetTherapyPoint(final int? therapyPoint) =
      _$SetTherapyPointImpl;

  int? get therapyPoint;
  @JsonKey(ignore: true)
  _$$SetTherapyPointImplCopyWith<_$SetTherapyPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetTherapistPointImplCopyWith<$Res> {
  factory _$$SetTherapistPointImplCopyWith(_$SetTherapistPointImpl value,
          $Res Function(_$SetTherapistPointImpl) then) =
      __$$SetTherapistPointImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? therapistPoint});
}

/// @nodoc
class __$$SetTherapistPointImplCopyWithImpl<$Res>
    extends _$RateUsEventCopyWithImpl<$Res, _$SetTherapistPointImpl>
    implements _$$SetTherapistPointImplCopyWith<$Res> {
  __$$SetTherapistPointImplCopyWithImpl(_$SetTherapistPointImpl _value,
      $Res Function(_$SetTherapistPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? therapistPoint = freezed,
  }) {
    return _then(_$SetTherapistPointImpl(
      freezed == therapistPoint
          ? _value.therapistPoint
          : therapistPoint // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SetTherapistPointImpl implements _SetTherapistPoint {
  const _$SetTherapistPointImpl(this.therapistPoint);

  @override
  final int? therapistPoint;

  @override
  String toString() {
    return 'RateUsEvent.setTherapistPoint(therapistPoint: $therapistPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetTherapistPointImpl &&
            (identical(other.therapistPoint, therapistPoint) ||
                other.therapistPoint == therapistPoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, therapistPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetTherapistPointImplCopyWith<_$SetTherapistPointImpl> get copyWith =>
      __$$SetTherapistPointImplCopyWithImpl<_$SetTherapistPointImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bookingId, String therapyName,
            String therapistName, String therapistImageUrl)
        initialize,
    required TResult Function(int? therapyPoint) setTherapyPoint,
    required TResult Function(int? therapistPoint) setTherapistPoint,
    required TResult Function(
            String therapyDescription, String therapistDescription)
        submit,
  }) {
    return setTherapistPoint(therapistPoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bookingId, String therapyName,
            String therapistName, String therapistImageUrl)?
        initialize,
    TResult? Function(int? therapyPoint)? setTherapyPoint,
    TResult? Function(int? therapistPoint)? setTherapistPoint,
    TResult? Function(String therapyDescription, String therapistDescription)?
        submit,
  }) {
    return setTherapistPoint?.call(therapistPoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bookingId, String therapyName, String therapistName,
            String therapistImageUrl)?
        initialize,
    TResult Function(int? therapyPoint)? setTherapyPoint,
    TResult Function(int? therapistPoint)? setTherapistPoint,
    TResult Function(String therapyDescription, String therapistDescription)?
        submit,
    required TResult orElse(),
  }) {
    if (setTherapistPoint != null) {
      return setTherapistPoint(therapistPoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetTherapyPoint value) setTherapyPoint,
    required TResult Function(_SetTherapistPoint value) setTherapistPoint,
    required TResult Function(_Submit value) submit,
  }) {
    return setTherapistPoint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetTherapyPoint value)? setTherapyPoint,
    TResult? Function(_SetTherapistPoint value)? setTherapistPoint,
    TResult? Function(_Submit value)? submit,
  }) {
    return setTherapistPoint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetTherapyPoint value)? setTherapyPoint,
    TResult Function(_SetTherapistPoint value)? setTherapistPoint,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (setTherapistPoint != null) {
      return setTherapistPoint(this);
    }
    return orElse();
  }
}

abstract class _SetTherapistPoint implements RateUsEvent {
  const factory _SetTherapistPoint(final int? therapistPoint) =
      _$SetTherapistPointImpl;

  int? get therapistPoint;
  @JsonKey(ignore: true)
  _$$SetTherapistPointImplCopyWith<_$SetTherapistPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String therapyDescription, String therapistDescription});
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$RateUsEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? therapyDescription = null,
    Object? therapistDescription = null,
  }) {
    return _then(_$SubmitImpl(
      null == therapyDescription
          ? _value.therapyDescription
          : therapyDescription // ignore: cast_nullable_to_non_nullable
              as String,
      null == therapistDescription
          ? _value.therapistDescription
          : therapistDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl(this.therapyDescription, this.therapistDescription);

  @override
  final String therapyDescription;
  @override
  final String therapistDescription;

  @override
  String toString() {
    return 'RateUsEvent.submit(therapyDescription: $therapyDescription, therapistDescription: $therapistDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitImpl &&
            (identical(other.therapyDescription, therapyDescription) ||
                other.therapyDescription == therapyDescription) &&
            (identical(other.therapistDescription, therapistDescription) ||
                other.therapistDescription == therapistDescription));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, therapyDescription, therapistDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      __$$SubmitImplCopyWithImpl<_$SubmitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bookingId, String therapyName,
            String therapistName, String therapistImageUrl)
        initialize,
    required TResult Function(int? therapyPoint) setTherapyPoint,
    required TResult Function(int? therapistPoint) setTherapistPoint,
    required TResult Function(
            String therapyDescription, String therapistDescription)
        submit,
  }) {
    return submit(therapyDescription, therapistDescription);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bookingId, String therapyName,
            String therapistName, String therapistImageUrl)?
        initialize,
    TResult? Function(int? therapyPoint)? setTherapyPoint,
    TResult? Function(int? therapistPoint)? setTherapistPoint,
    TResult? Function(String therapyDescription, String therapistDescription)?
        submit,
  }) {
    return submit?.call(therapyDescription, therapistDescription);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bookingId, String therapyName, String therapistName,
            String therapistImageUrl)?
        initialize,
    TResult Function(int? therapyPoint)? setTherapyPoint,
    TResult Function(int? therapistPoint)? setTherapistPoint,
    TResult Function(String therapyDescription, String therapistDescription)?
        submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(therapyDescription, therapistDescription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetTherapyPoint value) setTherapyPoint,
    required TResult Function(_SetTherapistPoint value) setTherapistPoint,
    required TResult Function(_Submit value) submit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetTherapyPoint value)? setTherapyPoint,
    TResult? Function(_SetTherapistPoint value)? setTherapistPoint,
    TResult? Function(_Submit value)? submit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetTherapyPoint value)? setTherapyPoint,
    TResult Function(_SetTherapistPoint value)? setTherapistPoint,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements RateUsEvent {
  const factory _Submit(
          final String therapyDescription, final String therapistDescription) =
      _$SubmitImpl;

  String get therapyDescription;
  String get therapistDescription;
  @JsonKey(ignore: true)
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RateUsState {
  String? get bookingId => throw _privateConstructorUsedError;
  String? get therapyName => throw _privateConstructorUsedError;
  String? get therapistName => throw _privateConstructorUsedError;
  String? get therapistImageUrl => throw _privateConstructorUsedError;
  int? get therapyPoint => throw _privateConstructorUsedError;
  int? get therapistPoint => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RateUsStateCopyWith<RateUsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateUsStateCopyWith<$Res> {
  factory $RateUsStateCopyWith(
          RateUsState value, $Res Function(RateUsState) then) =
      _$RateUsStateCopyWithImpl<$Res, RateUsState>;
  @useResult
  $Res call(
      {String? bookingId,
      String? therapyName,
      String? therapistName,
      String? therapistImageUrl,
      int? therapyPoint,
      int? therapistPoint,
      LoadingState loadingState,
      bool isSuccess});
}

/// @nodoc
class _$RateUsStateCopyWithImpl<$Res, $Val extends RateUsState>
    implements $RateUsStateCopyWith<$Res> {
  _$RateUsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = freezed,
    Object? therapyName = freezed,
    Object? therapistName = freezed,
    Object? therapistImageUrl = freezed,
    Object? therapyPoint = freezed,
    Object? therapistPoint = freezed,
    Object? loadingState = null,
    Object? isSuccess = null,
  }) {
    return _then(_value.copyWith(
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      therapyName: freezed == therapyName
          ? _value.therapyName
          : therapyName // ignore: cast_nullable_to_non_nullable
              as String?,
      therapistName: freezed == therapistName
          ? _value.therapistName
          : therapistName // ignore: cast_nullable_to_non_nullable
              as String?,
      therapistImageUrl: freezed == therapistImageUrl
          ? _value.therapistImageUrl
          : therapistImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      therapyPoint: freezed == therapyPoint
          ? _value.therapyPoint
          : therapyPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      therapistPoint: freezed == therapistPoint
          ? _value.therapistPoint
          : therapistPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RateUsStateImplCopyWith<$Res>
    implements $RateUsStateCopyWith<$Res> {
  factory _$$RateUsStateImplCopyWith(
          _$RateUsStateImpl value, $Res Function(_$RateUsStateImpl) then) =
      __$$RateUsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? bookingId,
      String? therapyName,
      String? therapistName,
      String? therapistImageUrl,
      int? therapyPoint,
      int? therapistPoint,
      LoadingState loadingState,
      bool isSuccess});
}

/// @nodoc
class __$$RateUsStateImplCopyWithImpl<$Res>
    extends _$RateUsStateCopyWithImpl<$Res, _$RateUsStateImpl>
    implements _$$RateUsStateImplCopyWith<$Res> {
  __$$RateUsStateImplCopyWithImpl(
      _$RateUsStateImpl _value, $Res Function(_$RateUsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = freezed,
    Object? therapyName = freezed,
    Object? therapistName = freezed,
    Object? therapistImageUrl = freezed,
    Object? therapyPoint = freezed,
    Object? therapistPoint = freezed,
    Object? loadingState = null,
    Object? isSuccess = null,
  }) {
    return _then(_$RateUsStateImpl(
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      therapyName: freezed == therapyName
          ? _value.therapyName
          : therapyName // ignore: cast_nullable_to_non_nullable
              as String?,
      therapistName: freezed == therapistName
          ? _value.therapistName
          : therapistName // ignore: cast_nullable_to_non_nullable
              as String?,
      therapistImageUrl: freezed == therapistImageUrl
          ? _value.therapistImageUrl
          : therapistImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      therapyPoint: freezed == therapyPoint
          ? _value.therapyPoint
          : therapyPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      therapistPoint: freezed == therapistPoint
          ? _value.therapistPoint
          : therapistPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RateUsStateImpl implements _RateUsState {
  const _$RateUsStateImpl(
      {required this.bookingId,
      required this.therapyName,
      required this.therapistName,
      required this.therapistImageUrl,
      required this.therapyPoint,
      required this.therapistPoint,
      required this.loadingState,
      required this.isSuccess});

  @override
  final String? bookingId;
  @override
  final String? therapyName;
  @override
  final String? therapistName;
  @override
  final String? therapistImageUrl;
  @override
  final int? therapyPoint;
  @override
  final int? therapistPoint;
  @override
  final LoadingState loadingState;
  @override
  final bool isSuccess;

  @override
  String toString() {
    return 'RateUsState(bookingId: $bookingId, therapyName: $therapyName, therapistName: $therapistName, therapistImageUrl: $therapistImageUrl, therapyPoint: $therapyPoint, therapistPoint: $therapistPoint, loadingState: $loadingState, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateUsStateImpl &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.therapyName, therapyName) ||
                other.therapyName == therapyName) &&
            (identical(other.therapistName, therapistName) ||
                other.therapistName == therapistName) &&
            (identical(other.therapistImageUrl, therapistImageUrl) ||
                other.therapistImageUrl == therapistImageUrl) &&
            (identical(other.therapyPoint, therapyPoint) ||
                other.therapyPoint == therapyPoint) &&
            (identical(other.therapistPoint, therapistPoint) ||
                other.therapistPoint == therapistPoint) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookingId,
      therapyName,
      therapistName,
      therapistImageUrl,
      therapyPoint,
      therapistPoint,
      loadingState,
      isSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RateUsStateImplCopyWith<_$RateUsStateImpl> get copyWith =>
      __$$RateUsStateImplCopyWithImpl<_$RateUsStateImpl>(this, _$identity);
}

abstract class _RateUsState implements RateUsState {
  const factory _RateUsState(
      {required final String? bookingId,
      required final String? therapyName,
      required final String? therapistName,
      required final String? therapistImageUrl,
      required final int? therapyPoint,
      required final int? therapistPoint,
      required final LoadingState loadingState,
      required final bool isSuccess}) = _$RateUsStateImpl;

  @override
  String? get bookingId;
  @override
  String? get therapyName;
  @override
  String? get therapistName;
  @override
  String? get therapistImageUrl;
  @override
  int? get therapyPoint;
  @override
  int? get therapistPoint;
  @override
  LoadingState get loadingState;
  @override
  bool get isSuccess;
  @override
  @JsonKey(ignore: true)
  _$$RateUsStateImplCopyWith<_$RateUsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
