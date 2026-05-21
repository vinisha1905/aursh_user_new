// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_therapy_time_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookTherapyTimeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(TherapyDateSlot dateSlot) selectDateSlot,
    required TResult Function(AddressInfo addressInfo) setAddress,
    required TResult Function() bookNextSession,
    required TResult Function() resetError,
    required TResult Function() rescheduleBooking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult? Function(AddressInfo addressInfo)? setAddress,
    TResult? Function()? bookNextSession,
    TResult? Function()? resetError,
    TResult? Function()? rescheduleBooking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult Function(AddressInfo addressInfo)? setAddress,
    TResult Function()? bookNextSession,
    TResult Function()? resetError,
    TResult Function()? rescheduleBooking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetSlots value) getSlots,
    required TResult Function(_SelectSlot value) selectSlot,
    required TResult Function(_SelectDateSlot value) selectDateSlot,
    required TResult Function(_SetAddress value) setAddress,
    required TResult Function(_BookNextSession value) bookNextSession,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_RescheduleBooking value) rescheduleBooking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDateSlot value)? selectDateSlot,
    TResult? Function(_SetAddress value)? setAddress,
    TResult? Function(_BookNextSession value)? bookNextSession,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_RescheduleBooking value)? rescheduleBooking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDateSlot value)? selectDateSlot,
    TResult Function(_SetAddress value)? setAddress,
    TResult Function(_BookNextSession value)? bookNextSession,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_RescheduleBooking value)? rescheduleBooking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookTherapyTimeEventCopyWith<$Res> {
  factory $BookTherapyTimeEventCopyWith(BookTherapyTimeEvent value,
          $Res Function(BookTherapyTimeEvent) then) =
      _$BookTherapyTimeEventCopyWithImpl<$Res, BookTherapyTimeEvent>;
}

/// @nodoc
class _$BookTherapyTimeEventCopyWithImpl<$Res,
        $Val extends BookTherapyTimeEvent>
    implements $BookTherapyTimeEventCopyWith<$Res> {
  _$BookTherapyTimeEventCopyWithImpl(this._value, this._then);

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
      {TherapyBookingInfo? therapyBookingInfo,
      BookedTherapyInfo? bookedTherapyInfo});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$BookTherapyTimeEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? therapyBookingInfo = freezed,
    Object? bookedTherapyInfo = freezed,
  }) {
    return _then(_$InitializeImpl(
      freezed == therapyBookingInfo
          ? _value.therapyBookingInfo
          : therapyBookingInfo // ignore: cast_nullable_to_non_nullable
              as TherapyBookingInfo?,
      freezed == bookedTherapyInfo
          ? _value.bookedTherapyInfo
          : bookedTherapyInfo // ignore: cast_nullable_to_non_nullable
              as BookedTherapyInfo?,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.therapyBookingInfo, this.bookedTherapyInfo);

  @override
  final TherapyBookingInfo? therapyBookingInfo;
  @override
  final BookedTherapyInfo? bookedTherapyInfo;

  @override
  String toString() {
    return 'BookTherapyTimeEvent.initialize(therapyBookingInfo: $therapyBookingInfo, bookedTherapyInfo: $bookedTherapyInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.therapyBookingInfo, therapyBookingInfo) ||
                other.therapyBookingInfo == therapyBookingInfo) &&
            (identical(other.bookedTherapyInfo, bookedTherapyInfo) ||
                other.bookedTherapyInfo == bookedTherapyInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, therapyBookingInfo, bookedTherapyInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(TherapyDateSlot dateSlot) selectDateSlot,
    required TResult Function(AddressInfo addressInfo) setAddress,
    required TResult Function() bookNextSession,
    required TResult Function() resetError,
    required TResult Function() rescheduleBooking,
  }) {
    return initialize(therapyBookingInfo, bookedTherapyInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult? Function(AddressInfo addressInfo)? setAddress,
    TResult? Function()? bookNextSession,
    TResult? Function()? resetError,
    TResult? Function()? rescheduleBooking,
  }) {
    return initialize?.call(therapyBookingInfo, bookedTherapyInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult Function(AddressInfo addressInfo)? setAddress,
    TResult Function()? bookNextSession,
    TResult Function()? resetError,
    TResult Function()? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(therapyBookingInfo, bookedTherapyInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetSlots value) getSlots,
    required TResult Function(_SelectSlot value) selectSlot,
    required TResult Function(_SelectDateSlot value) selectDateSlot,
    required TResult Function(_SetAddress value) setAddress,
    required TResult Function(_BookNextSession value) bookNextSession,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_RescheduleBooking value) rescheduleBooking,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDateSlot value)? selectDateSlot,
    TResult? Function(_SetAddress value)? setAddress,
    TResult? Function(_BookNextSession value)? bookNextSession,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_RescheduleBooking value)? rescheduleBooking,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDateSlot value)? selectDateSlot,
    TResult Function(_SetAddress value)? setAddress,
    TResult Function(_BookNextSession value)? bookNextSession,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_RescheduleBooking value)? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements BookTherapyTimeEvent {
  const factory _Initialize(final TherapyBookingInfo? therapyBookingInfo,
      final BookedTherapyInfo? bookedTherapyInfo) = _$InitializeImpl;

  TherapyBookingInfo? get therapyBookingInfo;
  BookedTherapyInfo? get bookedTherapyInfo;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSlotsImplCopyWith<$Res> {
  factory _$$GetSlotsImplCopyWith(
          _$GetSlotsImpl value, $Res Function(_$GetSlotsImpl) then) =
      __$$GetSlotsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetSlotsImplCopyWithImpl<$Res>
    extends _$BookTherapyTimeEventCopyWithImpl<$Res, _$GetSlotsImpl>
    implements _$$GetSlotsImplCopyWith<$Res> {
  __$$GetSlotsImplCopyWithImpl(
      _$GetSlotsImpl _value, $Res Function(_$GetSlotsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetSlotsImpl implements _GetSlots {
  const _$GetSlotsImpl();

  @override
  String toString() {
    return 'BookTherapyTimeEvent.getSlots()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetSlotsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(TherapyDateSlot dateSlot) selectDateSlot,
    required TResult Function(AddressInfo addressInfo) setAddress,
    required TResult Function() bookNextSession,
    required TResult Function() resetError,
    required TResult Function() rescheduleBooking,
  }) {
    return getSlots();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult? Function(AddressInfo addressInfo)? setAddress,
    TResult? Function()? bookNextSession,
    TResult? Function()? resetError,
    TResult? Function()? rescheduleBooking,
  }) {
    return getSlots?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult Function(AddressInfo addressInfo)? setAddress,
    TResult Function()? bookNextSession,
    TResult Function()? resetError,
    TResult Function()? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (getSlots != null) {
      return getSlots();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetSlots value) getSlots,
    required TResult Function(_SelectSlot value) selectSlot,
    required TResult Function(_SelectDateSlot value) selectDateSlot,
    required TResult Function(_SetAddress value) setAddress,
    required TResult Function(_BookNextSession value) bookNextSession,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_RescheduleBooking value) rescheduleBooking,
  }) {
    return getSlots(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDateSlot value)? selectDateSlot,
    TResult? Function(_SetAddress value)? setAddress,
    TResult? Function(_BookNextSession value)? bookNextSession,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_RescheduleBooking value)? rescheduleBooking,
  }) {
    return getSlots?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDateSlot value)? selectDateSlot,
    TResult Function(_SetAddress value)? setAddress,
    TResult Function(_BookNextSession value)? bookNextSession,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_RescheduleBooking value)? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (getSlots != null) {
      return getSlots(this);
    }
    return orElse();
  }
}

abstract class _GetSlots implements BookTherapyTimeEvent {
  const factory _GetSlots() = _$GetSlotsImpl;
}

/// @nodoc
abstract class _$$SelectSlotImplCopyWith<$Res> {
  factory _$$SelectSlotImplCopyWith(
          _$SelectSlotImpl value, $Res Function(_$SelectSlotImpl) then) =
      __$$SelectSlotImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BookingSlotInfo? bookingSlot});
}

/// @nodoc
class __$$SelectSlotImplCopyWithImpl<$Res>
    extends _$BookTherapyTimeEventCopyWithImpl<$Res, _$SelectSlotImpl>
    implements _$$SelectSlotImplCopyWith<$Res> {
  __$$SelectSlotImplCopyWithImpl(
      _$SelectSlotImpl _value, $Res Function(_$SelectSlotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingSlot = freezed,
  }) {
    return _then(_$SelectSlotImpl(
      freezed == bookingSlot
          ? _value.bookingSlot
          : bookingSlot // ignore: cast_nullable_to_non_nullable
              as BookingSlotInfo?,
    ));
  }
}

/// @nodoc

class _$SelectSlotImpl implements _SelectSlot {
  const _$SelectSlotImpl(this.bookingSlot);

  @override
  final BookingSlotInfo? bookingSlot;

  @override
  String toString() {
    return 'BookTherapyTimeEvent.selectSlot(bookingSlot: $bookingSlot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectSlotImpl &&
            (identical(other.bookingSlot, bookingSlot) ||
                other.bookingSlot == bookingSlot));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookingSlot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectSlotImplCopyWith<_$SelectSlotImpl> get copyWith =>
      __$$SelectSlotImplCopyWithImpl<_$SelectSlotImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(TherapyDateSlot dateSlot) selectDateSlot,
    required TResult Function(AddressInfo addressInfo) setAddress,
    required TResult Function() bookNextSession,
    required TResult Function() resetError,
    required TResult Function() rescheduleBooking,
  }) {
    return selectSlot(bookingSlot);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult? Function(AddressInfo addressInfo)? setAddress,
    TResult? Function()? bookNextSession,
    TResult? Function()? resetError,
    TResult? Function()? rescheduleBooking,
  }) {
    return selectSlot?.call(bookingSlot);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult Function(AddressInfo addressInfo)? setAddress,
    TResult Function()? bookNextSession,
    TResult Function()? resetError,
    TResult Function()? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (selectSlot != null) {
      return selectSlot(bookingSlot);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetSlots value) getSlots,
    required TResult Function(_SelectSlot value) selectSlot,
    required TResult Function(_SelectDateSlot value) selectDateSlot,
    required TResult Function(_SetAddress value) setAddress,
    required TResult Function(_BookNextSession value) bookNextSession,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_RescheduleBooking value) rescheduleBooking,
  }) {
    return selectSlot(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDateSlot value)? selectDateSlot,
    TResult? Function(_SetAddress value)? setAddress,
    TResult? Function(_BookNextSession value)? bookNextSession,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_RescheduleBooking value)? rescheduleBooking,
  }) {
    return selectSlot?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDateSlot value)? selectDateSlot,
    TResult Function(_SetAddress value)? setAddress,
    TResult Function(_BookNextSession value)? bookNextSession,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_RescheduleBooking value)? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (selectSlot != null) {
      return selectSlot(this);
    }
    return orElse();
  }
}

abstract class _SelectSlot implements BookTherapyTimeEvent {
  const factory _SelectSlot(final BookingSlotInfo? bookingSlot) =
      _$SelectSlotImpl;

  BookingSlotInfo? get bookingSlot;
  @JsonKey(ignore: true)
  _$$SelectSlotImplCopyWith<_$SelectSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectDateSlotImplCopyWith<$Res> {
  factory _$$SelectDateSlotImplCopyWith(_$SelectDateSlotImpl value,
          $Res Function(_$SelectDateSlotImpl) then) =
      __$$SelectDateSlotImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TherapyDateSlot dateSlot});
}

/// @nodoc
class __$$SelectDateSlotImplCopyWithImpl<$Res>
    extends _$BookTherapyTimeEventCopyWithImpl<$Res, _$SelectDateSlotImpl>
    implements _$$SelectDateSlotImplCopyWith<$Res> {
  __$$SelectDateSlotImplCopyWithImpl(
      _$SelectDateSlotImpl _value, $Res Function(_$SelectDateSlotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateSlot = null,
  }) {
    return _then(_$SelectDateSlotImpl(
      null == dateSlot
          ? _value.dateSlot
          : dateSlot // ignore: cast_nullable_to_non_nullable
              as TherapyDateSlot,
    ));
  }
}

/// @nodoc

class _$SelectDateSlotImpl implements _SelectDateSlot {
  const _$SelectDateSlotImpl(this.dateSlot);

  @override
  final TherapyDateSlot dateSlot;

  @override
  String toString() {
    return 'BookTherapyTimeEvent.selectDateSlot(dateSlot: $dateSlot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectDateSlotImpl &&
            (identical(other.dateSlot, dateSlot) ||
                other.dateSlot == dateSlot));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateSlot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectDateSlotImplCopyWith<_$SelectDateSlotImpl> get copyWith =>
      __$$SelectDateSlotImplCopyWithImpl<_$SelectDateSlotImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(TherapyDateSlot dateSlot) selectDateSlot,
    required TResult Function(AddressInfo addressInfo) setAddress,
    required TResult Function() bookNextSession,
    required TResult Function() resetError,
    required TResult Function() rescheduleBooking,
  }) {
    return selectDateSlot(dateSlot);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult? Function(AddressInfo addressInfo)? setAddress,
    TResult? Function()? bookNextSession,
    TResult? Function()? resetError,
    TResult? Function()? rescheduleBooking,
  }) {
    return selectDateSlot?.call(dateSlot);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult Function(AddressInfo addressInfo)? setAddress,
    TResult Function()? bookNextSession,
    TResult Function()? resetError,
    TResult Function()? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (selectDateSlot != null) {
      return selectDateSlot(dateSlot);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetSlots value) getSlots,
    required TResult Function(_SelectSlot value) selectSlot,
    required TResult Function(_SelectDateSlot value) selectDateSlot,
    required TResult Function(_SetAddress value) setAddress,
    required TResult Function(_BookNextSession value) bookNextSession,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_RescheduleBooking value) rescheduleBooking,
  }) {
    return selectDateSlot(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDateSlot value)? selectDateSlot,
    TResult? Function(_SetAddress value)? setAddress,
    TResult? Function(_BookNextSession value)? bookNextSession,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_RescheduleBooking value)? rescheduleBooking,
  }) {
    return selectDateSlot?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDateSlot value)? selectDateSlot,
    TResult Function(_SetAddress value)? setAddress,
    TResult Function(_BookNextSession value)? bookNextSession,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_RescheduleBooking value)? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (selectDateSlot != null) {
      return selectDateSlot(this);
    }
    return orElse();
  }
}

abstract class _SelectDateSlot implements BookTherapyTimeEvent {
  const factory _SelectDateSlot(final TherapyDateSlot dateSlot) =
      _$SelectDateSlotImpl;

  TherapyDateSlot get dateSlot;
  @JsonKey(ignore: true)
  _$$SelectDateSlotImplCopyWith<_$SelectDateSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetAddressImplCopyWith<$Res> {
  factory _$$SetAddressImplCopyWith(
          _$SetAddressImpl value, $Res Function(_$SetAddressImpl) then) =
      __$$SetAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressInfo addressInfo});
}

/// @nodoc
class __$$SetAddressImplCopyWithImpl<$Res>
    extends _$BookTherapyTimeEventCopyWithImpl<$Res, _$SetAddressImpl>
    implements _$$SetAddressImplCopyWith<$Res> {
  __$$SetAddressImplCopyWithImpl(
      _$SetAddressImpl _value, $Res Function(_$SetAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressInfo = null,
  }) {
    return _then(_$SetAddressImpl(
      null == addressInfo
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo,
    ));
  }
}

/// @nodoc

class _$SetAddressImpl implements _SetAddress {
  const _$SetAddressImpl(this.addressInfo);

  @override
  final AddressInfo addressInfo;

  @override
  String toString() {
    return 'BookTherapyTimeEvent.setAddress(addressInfo: $addressInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetAddressImpl &&
            (identical(other.addressInfo, addressInfo) ||
                other.addressInfo == addressInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addressInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetAddressImplCopyWith<_$SetAddressImpl> get copyWith =>
      __$$SetAddressImplCopyWithImpl<_$SetAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(TherapyDateSlot dateSlot) selectDateSlot,
    required TResult Function(AddressInfo addressInfo) setAddress,
    required TResult Function() bookNextSession,
    required TResult Function() resetError,
    required TResult Function() rescheduleBooking,
  }) {
    return setAddress(addressInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult? Function(AddressInfo addressInfo)? setAddress,
    TResult? Function()? bookNextSession,
    TResult? Function()? resetError,
    TResult? Function()? rescheduleBooking,
  }) {
    return setAddress?.call(addressInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult Function(AddressInfo addressInfo)? setAddress,
    TResult Function()? bookNextSession,
    TResult Function()? resetError,
    TResult Function()? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (setAddress != null) {
      return setAddress(addressInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetSlots value) getSlots,
    required TResult Function(_SelectSlot value) selectSlot,
    required TResult Function(_SelectDateSlot value) selectDateSlot,
    required TResult Function(_SetAddress value) setAddress,
    required TResult Function(_BookNextSession value) bookNextSession,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_RescheduleBooking value) rescheduleBooking,
  }) {
    return setAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDateSlot value)? selectDateSlot,
    TResult? Function(_SetAddress value)? setAddress,
    TResult? Function(_BookNextSession value)? bookNextSession,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_RescheduleBooking value)? rescheduleBooking,
  }) {
    return setAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDateSlot value)? selectDateSlot,
    TResult Function(_SetAddress value)? setAddress,
    TResult Function(_BookNextSession value)? bookNextSession,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_RescheduleBooking value)? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (setAddress != null) {
      return setAddress(this);
    }
    return orElse();
  }
}

abstract class _SetAddress implements BookTherapyTimeEvent {
  const factory _SetAddress(final AddressInfo addressInfo) = _$SetAddressImpl;

  AddressInfo get addressInfo;
  @JsonKey(ignore: true)
  _$$SetAddressImplCopyWith<_$SetAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookNextSessionImplCopyWith<$Res> {
  factory _$$BookNextSessionImplCopyWith(_$BookNextSessionImpl value,
          $Res Function(_$BookNextSessionImpl) then) =
      __$$BookNextSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BookNextSessionImplCopyWithImpl<$Res>
    extends _$BookTherapyTimeEventCopyWithImpl<$Res, _$BookNextSessionImpl>
    implements _$$BookNextSessionImplCopyWith<$Res> {
  __$$BookNextSessionImplCopyWithImpl(
      _$BookNextSessionImpl _value, $Res Function(_$BookNextSessionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BookNextSessionImpl implements _BookNextSession {
  const _$BookNextSessionImpl();

  @override
  String toString() {
    return 'BookTherapyTimeEvent.bookNextSession()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BookNextSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(TherapyDateSlot dateSlot) selectDateSlot,
    required TResult Function(AddressInfo addressInfo) setAddress,
    required TResult Function() bookNextSession,
    required TResult Function() resetError,
    required TResult Function() rescheduleBooking,
  }) {
    return bookNextSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult? Function(AddressInfo addressInfo)? setAddress,
    TResult? Function()? bookNextSession,
    TResult? Function()? resetError,
    TResult? Function()? rescheduleBooking,
  }) {
    return bookNextSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult Function(AddressInfo addressInfo)? setAddress,
    TResult Function()? bookNextSession,
    TResult Function()? resetError,
    TResult Function()? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (bookNextSession != null) {
      return bookNextSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetSlots value) getSlots,
    required TResult Function(_SelectSlot value) selectSlot,
    required TResult Function(_SelectDateSlot value) selectDateSlot,
    required TResult Function(_SetAddress value) setAddress,
    required TResult Function(_BookNextSession value) bookNextSession,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_RescheduleBooking value) rescheduleBooking,
  }) {
    return bookNextSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDateSlot value)? selectDateSlot,
    TResult? Function(_SetAddress value)? setAddress,
    TResult? Function(_BookNextSession value)? bookNextSession,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_RescheduleBooking value)? rescheduleBooking,
  }) {
    return bookNextSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDateSlot value)? selectDateSlot,
    TResult Function(_SetAddress value)? setAddress,
    TResult Function(_BookNextSession value)? bookNextSession,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_RescheduleBooking value)? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (bookNextSession != null) {
      return bookNextSession(this);
    }
    return orElse();
  }
}

abstract class _BookNextSession implements BookTherapyTimeEvent {
  const factory _BookNextSession() = _$BookNextSessionImpl;
}

/// @nodoc
abstract class _$$ResetErrorImplCopyWith<$Res> {
  factory _$$ResetErrorImplCopyWith(
          _$ResetErrorImpl value, $Res Function(_$ResetErrorImpl) then) =
      __$$ResetErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetErrorImplCopyWithImpl<$Res>
    extends _$BookTherapyTimeEventCopyWithImpl<$Res, _$ResetErrorImpl>
    implements _$$ResetErrorImplCopyWith<$Res> {
  __$$ResetErrorImplCopyWithImpl(
      _$ResetErrorImpl _value, $Res Function(_$ResetErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetErrorImpl implements _ResetError {
  const _$ResetErrorImpl();

  @override
  String toString() {
    return 'BookTherapyTimeEvent.resetError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(TherapyDateSlot dateSlot) selectDateSlot,
    required TResult Function(AddressInfo addressInfo) setAddress,
    required TResult Function() bookNextSession,
    required TResult Function() resetError,
    required TResult Function() rescheduleBooking,
  }) {
    return resetError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult? Function(AddressInfo addressInfo)? setAddress,
    TResult? Function()? bookNextSession,
    TResult? Function()? resetError,
    TResult? Function()? rescheduleBooking,
  }) {
    return resetError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult Function(AddressInfo addressInfo)? setAddress,
    TResult Function()? bookNextSession,
    TResult Function()? resetError,
    TResult Function()? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (resetError != null) {
      return resetError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetSlots value) getSlots,
    required TResult Function(_SelectSlot value) selectSlot,
    required TResult Function(_SelectDateSlot value) selectDateSlot,
    required TResult Function(_SetAddress value) setAddress,
    required TResult Function(_BookNextSession value) bookNextSession,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_RescheduleBooking value) rescheduleBooking,
  }) {
    return resetError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDateSlot value)? selectDateSlot,
    TResult? Function(_SetAddress value)? setAddress,
    TResult? Function(_BookNextSession value)? bookNextSession,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_RescheduleBooking value)? rescheduleBooking,
  }) {
    return resetError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDateSlot value)? selectDateSlot,
    TResult Function(_SetAddress value)? setAddress,
    TResult Function(_BookNextSession value)? bookNextSession,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_RescheduleBooking value)? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (resetError != null) {
      return resetError(this);
    }
    return orElse();
  }
}

abstract class _ResetError implements BookTherapyTimeEvent {
  const factory _ResetError() = _$ResetErrorImpl;
}

/// @nodoc
abstract class _$$RescheduleBookingImplCopyWith<$Res> {
  factory _$$RescheduleBookingImplCopyWith(_$RescheduleBookingImpl value,
          $Res Function(_$RescheduleBookingImpl) then) =
      __$$RescheduleBookingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RescheduleBookingImplCopyWithImpl<$Res>
    extends _$BookTherapyTimeEventCopyWithImpl<$Res, _$RescheduleBookingImpl>
    implements _$$RescheduleBookingImplCopyWith<$Res> {
  __$$RescheduleBookingImplCopyWithImpl(_$RescheduleBookingImpl _value,
      $Res Function(_$RescheduleBookingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RescheduleBookingImpl implements _RescheduleBooking {
  const _$RescheduleBookingImpl();

  @override
  String toString() {
    return 'BookTherapyTimeEvent.rescheduleBooking()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RescheduleBookingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(TherapyDateSlot dateSlot) selectDateSlot,
    required TResult Function(AddressInfo addressInfo) setAddress,
    required TResult Function() bookNextSession,
    required TResult Function() resetError,
    required TResult Function() rescheduleBooking,
  }) {
    return rescheduleBooking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult? Function(AddressInfo addressInfo)? setAddress,
    TResult? Function()? bookNextSession,
    TResult? Function()? resetError,
    TResult? Function()? rescheduleBooking,
  }) {
    return rescheduleBooking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo? therapyBookingInfo,
            BookedTherapyInfo? bookedTherapyInfo)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(TherapyDateSlot dateSlot)? selectDateSlot,
    TResult Function(AddressInfo addressInfo)? setAddress,
    TResult Function()? bookNextSession,
    TResult Function()? resetError,
    TResult Function()? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (rescheduleBooking != null) {
      return rescheduleBooking();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetSlots value) getSlots,
    required TResult Function(_SelectSlot value) selectSlot,
    required TResult Function(_SelectDateSlot value) selectDateSlot,
    required TResult Function(_SetAddress value) setAddress,
    required TResult Function(_BookNextSession value) bookNextSession,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_RescheduleBooking value) rescheduleBooking,
  }) {
    return rescheduleBooking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDateSlot value)? selectDateSlot,
    TResult? Function(_SetAddress value)? setAddress,
    TResult? Function(_BookNextSession value)? bookNextSession,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_RescheduleBooking value)? rescheduleBooking,
  }) {
    return rescheduleBooking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDateSlot value)? selectDateSlot,
    TResult Function(_SetAddress value)? setAddress,
    TResult Function(_BookNextSession value)? bookNextSession,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_RescheduleBooking value)? rescheduleBooking,
    required TResult orElse(),
  }) {
    if (rescheduleBooking != null) {
      return rescheduleBooking(this);
    }
    return orElse();
  }
}

abstract class _RescheduleBooking implements BookTherapyTimeEvent {
  const factory _RescheduleBooking() = _$RescheduleBookingImpl;
}

/// @nodoc
mixin _$BookTherapyTimeState {
  BookingSlotInfo? get selectedSlot => throw _privateConstructorUsedError;
  TherapyDateSlot? get selectedDateSlot => throw _privateConstructorUsedError;
  TherapyDateSlot? get initDateSlot => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  TherapyBookingInfo? get therapyBookingInfo =>
      throw _privateConstructorUsedError;
  BookedTherapyInfo? get bookedTherapyInfo =>
      throw _privateConstructorUsedError;
  List<TherapyDateSlot> get dateSlots => throw _privateConstructorUsedError;
  List<String> get singleSessionTerms => throw _privateConstructorUsedError;
  List<String> get multiSessionTerms => throw _privateConstructorUsedError;
  bool get isBookNext => throw _privateConstructorUsedError;
  bool? get isBookNextSuccess => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  AddressInfo? get addressInfo => throw _privateConstructorUsedError;
  bool get rescheduledBookingSuccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookTherapyTimeStateCopyWith<BookTherapyTimeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookTherapyTimeStateCopyWith<$Res> {
  factory $BookTherapyTimeStateCopyWith(BookTherapyTimeState value,
          $Res Function(BookTherapyTimeState) then) =
      _$BookTherapyTimeStateCopyWithImpl<$Res, BookTherapyTimeState>;
  @useResult
  $Res call(
      {BookingSlotInfo? selectedSlot,
      TherapyDateSlot? selectedDateSlot,
      TherapyDateSlot? initDateSlot,
      LoadingState loadingState,
      TherapyBookingInfo? therapyBookingInfo,
      BookedTherapyInfo? bookedTherapyInfo,
      List<TherapyDateSlot> dateSlots,
      List<String> singleSessionTerms,
      List<String> multiSessionTerms,
      bool isBookNext,
      bool? isBookNextSuccess,
      String? error,
      AddressInfo? addressInfo,
      bool rescheduledBookingSuccess});
}

/// @nodoc
class _$BookTherapyTimeStateCopyWithImpl<$Res,
        $Val extends BookTherapyTimeState>
    implements $BookTherapyTimeStateCopyWith<$Res> {
  _$BookTherapyTimeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSlot = freezed,
    Object? selectedDateSlot = freezed,
    Object? initDateSlot = freezed,
    Object? loadingState = null,
    Object? therapyBookingInfo = freezed,
    Object? bookedTherapyInfo = freezed,
    Object? dateSlots = null,
    Object? singleSessionTerms = null,
    Object? multiSessionTerms = null,
    Object? isBookNext = null,
    Object? isBookNextSuccess = freezed,
    Object? error = freezed,
    Object? addressInfo = freezed,
    Object? rescheduledBookingSuccess = null,
  }) {
    return _then(_value.copyWith(
      selectedSlot: freezed == selectedSlot
          ? _value.selectedSlot
          : selectedSlot // ignore: cast_nullable_to_non_nullable
              as BookingSlotInfo?,
      selectedDateSlot: freezed == selectedDateSlot
          ? _value.selectedDateSlot
          : selectedDateSlot // ignore: cast_nullable_to_non_nullable
              as TherapyDateSlot?,
      initDateSlot: freezed == initDateSlot
          ? _value.initDateSlot
          : initDateSlot // ignore: cast_nullable_to_non_nullable
              as TherapyDateSlot?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      therapyBookingInfo: freezed == therapyBookingInfo
          ? _value.therapyBookingInfo
          : therapyBookingInfo // ignore: cast_nullable_to_non_nullable
              as TherapyBookingInfo?,
      bookedTherapyInfo: freezed == bookedTherapyInfo
          ? _value.bookedTherapyInfo
          : bookedTherapyInfo // ignore: cast_nullable_to_non_nullable
              as BookedTherapyInfo?,
      dateSlots: null == dateSlots
          ? _value.dateSlots
          : dateSlots // ignore: cast_nullable_to_non_nullable
              as List<TherapyDateSlot>,
      singleSessionTerms: null == singleSessionTerms
          ? _value.singleSessionTerms
          : singleSessionTerms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      multiSessionTerms: null == multiSessionTerms
          ? _value.multiSessionTerms
          : multiSessionTerms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isBookNext: null == isBookNext
          ? _value.isBookNext
          : isBookNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookNextSuccess: freezed == isBookNextSuccess
          ? _value.isBookNextSuccess
          : isBookNextSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      addressInfo: freezed == addressInfo
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo?,
      rescheduledBookingSuccess: null == rescheduledBookingSuccess
          ? _value.rescheduledBookingSuccess
          : rescheduledBookingSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookTherapyTimeStateImplCopyWith<$Res>
    implements $BookTherapyTimeStateCopyWith<$Res> {
  factory _$$BookTherapyTimeStateImplCopyWith(_$BookTherapyTimeStateImpl value,
          $Res Function(_$BookTherapyTimeStateImpl) then) =
      __$$BookTherapyTimeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BookingSlotInfo? selectedSlot,
      TherapyDateSlot? selectedDateSlot,
      TherapyDateSlot? initDateSlot,
      LoadingState loadingState,
      TherapyBookingInfo? therapyBookingInfo,
      BookedTherapyInfo? bookedTherapyInfo,
      List<TherapyDateSlot> dateSlots,
      List<String> singleSessionTerms,
      List<String> multiSessionTerms,
      bool isBookNext,
      bool? isBookNextSuccess,
      String? error,
      AddressInfo? addressInfo,
      bool rescheduledBookingSuccess});
}

/// @nodoc
class __$$BookTherapyTimeStateImplCopyWithImpl<$Res>
    extends _$BookTherapyTimeStateCopyWithImpl<$Res, _$BookTherapyTimeStateImpl>
    implements _$$BookTherapyTimeStateImplCopyWith<$Res> {
  __$$BookTherapyTimeStateImplCopyWithImpl(_$BookTherapyTimeStateImpl _value,
      $Res Function(_$BookTherapyTimeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSlot = freezed,
    Object? selectedDateSlot = freezed,
    Object? initDateSlot = freezed,
    Object? loadingState = null,
    Object? therapyBookingInfo = freezed,
    Object? bookedTherapyInfo = freezed,
    Object? dateSlots = null,
    Object? singleSessionTerms = null,
    Object? multiSessionTerms = null,
    Object? isBookNext = null,
    Object? isBookNextSuccess = freezed,
    Object? error = freezed,
    Object? addressInfo = freezed,
    Object? rescheduledBookingSuccess = null,
  }) {
    return _then(_$BookTherapyTimeStateImpl(
      selectedSlot: freezed == selectedSlot
          ? _value.selectedSlot
          : selectedSlot // ignore: cast_nullable_to_non_nullable
              as BookingSlotInfo?,
      selectedDateSlot: freezed == selectedDateSlot
          ? _value.selectedDateSlot
          : selectedDateSlot // ignore: cast_nullable_to_non_nullable
              as TherapyDateSlot?,
      initDateSlot: freezed == initDateSlot
          ? _value.initDateSlot
          : initDateSlot // ignore: cast_nullable_to_non_nullable
              as TherapyDateSlot?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      therapyBookingInfo: freezed == therapyBookingInfo
          ? _value.therapyBookingInfo
          : therapyBookingInfo // ignore: cast_nullable_to_non_nullable
              as TherapyBookingInfo?,
      bookedTherapyInfo: freezed == bookedTherapyInfo
          ? _value.bookedTherapyInfo
          : bookedTherapyInfo // ignore: cast_nullable_to_non_nullable
              as BookedTherapyInfo?,
      dateSlots: null == dateSlots
          ? _value._dateSlots
          : dateSlots // ignore: cast_nullable_to_non_nullable
              as List<TherapyDateSlot>,
      singleSessionTerms: null == singleSessionTerms
          ? _value._singleSessionTerms
          : singleSessionTerms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      multiSessionTerms: null == multiSessionTerms
          ? _value._multiSessionTerms
          : multiSessionTerms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isBookNext: null == isBookNext
          ? _value.isBookNext
          : isBookNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookNextSuccess: freezed == isBookNextSuccess
          ? _value.isBookNextSuccess
          : isBookNextSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      addressInfo: freezed == addressInfo
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo?,
      rescheduledBookingSuccess: null == rescheduledBookingSuccess
          ? _value.rescheduledBookingSuccess
          : rescheduledBookingSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BookTherapyTimeStateImpl implements _BookTherapyTimeState {
  const _$BookTherapyTimeStateImpl(
      {required this.selectedSlot,
      required this.selectedDateSlot,
      required this.initDateSlot,
      required this.loadingState,
      required this.therapyBookingInfo,
      required this.bookedTherapyInfo,
      required final List<TherapyDateSlot> dateSlots,
      required final List<String> singleSessionTerms,
      required final List<String> multiSessionTerms,
      required this.isBookNext,
      required this.isBookNextSuccess,
      required this.error,
      required this.addressInfo,
      required this.rescheduledBookingSuccess})
      : _dateSlots = dateSlots,
        _singleSessionTerms = singleSessionTerms,
        _multiSessionTerms = multiSessionTerms;

  @override
  final BookingSlotInfo? selectedSlot;
  @override
  final TherapyDateSlot? selectedDateSlot;
  @override
  final TherapyDateSlot? initDateSlot;
  @override
  final LoadingState loadingState;
  @override
  final TherapyBookingInfo? therapyBookingInfo;
  @override
  final BookedTherapyInfo? bookedTherapyInfo;
  final List<TherapyDateSlot> _dateSlots;
  @override
  List<TherapyDateSlot> get dateSlots {
    if (_dateSlots is EqualUnmodifiableListView) return _dateSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dateSlots);
  }

  final List<String> _singleSessionTerms;
  @override
  List<String> get singleSessionTerms {
    if (_singleSessionTerms is EqualUnmodifiableListView)
      return _singleSessionTerms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_singleSessionTerms);
  }

  final List<String> _multiSessionTerms;
  @override
  List<String> get multiSessionTerms {
    if (_multiSessionTerms is EqualUnmodifiableListView)
      return _multiSessionTerms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_multiSessionTerms);
  }

  @override
  final bool isBookNext;
  @override
  final bool? isBookNextSuccess;
  @override
  final String? error;
  @override
  final AddressInfo? addressInfo;
  @override
  final bool rescheduledBookingSuccess;

  @override
  String toString() {
    return 'BookTherapyTimeState(selectedSlot: $selectedSlot, selectedDateSlot: $selectedDateSlot, initDateSlot: $initDateSlot, loadingState: $loadingState, therapyBookingInfo: $therapyBookingInfo, bookedTherapyInfo: $bookedTherapyInfo, dateSlots: $dateSlots, singleSessionTerms: $singleSessionTerms, multiSessionTerms: $multiSessionTerms, isBookNext: $isBookNext, isBookNextSuccess: $isBookNextSuccess, error: $error, addressInfo: $addressInfo, rescheduledBookingSuccess: $rescheduledBookingSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookTherapyTimeStateImpl &&
            (identical(other.selectedSlot, selectedSlot) ||
                other.selectedSlot == selectedSlot) &&
            (identical(other.selectedDateSlot, selectedDateSlot) ||
                other.selectedDateSlot == selectedDateSlot) &&
            (identical(other.initDateSlot, initDateSlot) ||
                other.initDateSlot == initDateSlot) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.therapyBookingInfo, therapyBookingInfo) ||
                other.therapyBookingInfo == therapyBookingInfo) &&
            (identical(other.bookedTherapyInfo, bookedTherapyInfo) ||
                other.bookedTherapyInfo == bookedTherapyInfo) &&
            const DeepCollectionEquality()
                .equals(other._dateSlots, _dateSlots) &&
            const DeepCollectionEquality()
                .equals(other._singleSessionTerms, _singleSessionTerms) &&
            const DeepCollectionEquality()
                .equals(other._multiSessionTerms, _multiSessionTerms) &&
            (identical(other.isBookNext, isBookNext) ||
                other.isBookNext == isBookNext) &&
            (identical(other.isBookNextSuccess, isBookNextSuccess) ||
                other.isBookNextSuccess == isBookNextSuccess) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.addressInfo, addressInfo) ||
                other.addressInfo == addressInfo) &&
            (identical(other.rescheduledBookingSuccess,
                    rescheduledBookingSuccess) ||
                other.rescheduledBookingSuccess == rescheduledBookingSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedSlot,
      selectedDateSlot,
      initDateSlot,
      loadingState,
      therapyBookingInfo,
      bookedTherapyInfo,
      const DeepCollectionEquality().hash(_dateSlots),
      const DeepCollectionEquality().hash(_singleSessionTerms),
      const DeepCollectionEquality().hash(_multiSessionTerms),
      isBookNext,
      isBookNextSuccess,
      error,
      addressInfo,
      rescheduledBookingSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookTherapyTimeStateImplCopyWith<_$BookTherapyTimeStateImpl>
      get copyWith =>
          __$$BookTherapyTimeStateImplCopyWithImpl<_$BookTherapyTimeStateImpl>(
              this, _$identity);
}

abstract class _BookTherapyTimeState implements BookTherapyTimeState {
  const factory _BookTherapyTimeState(
          {required final BookingSlotInfo? selectedSlot,
          required final TherapyDateSlot? selectedDateSlot,
          required final TherapyDateSlot? initDateSlot,
          required final LoadingState loadingState,
          required final TherapyBookingInfo? therapyBookingInfo,
          required final BookedTherapyInfo? bookedTherapyInfo,
          required final List<TherapyDateSlot> dateSlots,
          required final List<String> singleSessionTerms,
          required final List<String> multiSessionTerms,
          required final bool isBookNext,
          required final bool? isBookNextSuccess,
          required final String? error,
          required final AddressInfo? addressInfo,
          required final bool rescheduledBookingSuccess}) =
      _$BookTherapyTimeStateImpl;

  @override
  BookingSlotInfo? get selectedSlot;
  @override
  TherapyDateSlot? get selectedDateSlot;
  @override
  TherapyDateSlot? get initDateSlot;
  @override
  LoadingState get loadingState;
  @override
  TherapyBookingInfo? get therapyBookingInfo;
  @override
  BookedTherapyInfo? get bookedTherapyInfo;
  @override
  List<TherapyDateSlot> get dateSlots;
  @override
  List<String> get singleSessionTerms;
  @override
  List<String> get multiSessionTerms;
  @override
  bool get isBookNext;
  @override
  bool? get isBookNextSuccess;
  @override
  String? get error;
  @override
  AddressInfo? get addressInfo;
  @override
  bool get rescheduledBookingSuccess;
  @override
  @JsonKey(ignore: true)
  _$$BookTherapyTimeStateImplCopyWith<_$BookTherapyTimeStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
