// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_appointment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookAppointmentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(DaySlot daySlot) selectDaySlot,
    required TResult Function() rescheduleConsultation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(DaySlot daySlot)? selectDaySlot,
    TResult? Function()? rescheduleConsultation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(DaySlot daySlot)? selectDaySlot,
    TResult Function()? rescheduleConsultation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetSlots value) getSlots,
    required TResult Function(_SelectSlot value) selectSlot,
    required TResult Function(_SelectDaySlot value) selectDaySlot,
    required TResult Function(_RescheduleConsultation value)
        rescheduleConsultation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDaySlot value)? selectDaySlot,
    TResult? Function(_RescheduleConsultation value)? rescheduleConsultation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDaySlot value)? selectDaySlot,
    TResult Function(_RescheduleConsultation value)? rescheduleConsultation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookAppointmentEventCopyWith<$Res> {
  factory $BookAppointmentEventCopyWith(BookAppointmentEvent value,
          $Res Function(BookAppointmentEvent) then) =
      _$BookAppointmentEventCopyWithImpl<$Res, BookAppointmentEvent>;
}

/// @nodoc
class _$BookAppointmentEventCopyWithImpl<$Res,
        $Val extends BookAppointmentEvent>
    implements $BookAppointmentEventCopyWith<$Res> {
  _$BookAppointmentEventCopyWithImpl(this._value, this._then);

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
      {DoctorModel? doctorInfo,
      SessionSelectedInfo? sessionSelectedInfo,
      InternalConsultationModel? bookedConsultation});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$BookAppointmentEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorInfo = freezed,
    Object? sessionSelectedInfo = freezed,
    Object? bookedConsultation = freezed,
  }) {
    return _then(_$InitializeImpl(
      freezed == doctorInfo
          ? _value.doctorInfo
          : doctorInfo // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
      freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
      freezed == bookedConsultation
          ? _value.bookedConsultation
          : bookedConsultation // ignore: cast_nullable_to_non_nullable
              as InternalConsultationModel?,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(
      this.doctorInfo, this.sessionSelectedInfo, this.bookedConsultation);

  @override
  final DoctorModel? doctorInfo;
  @override
  final SessionSelectedInfo? sessionSelectedInfo;
  @override
  final InternalConsultationModel? bookedConsultation;

  @override
  String toString() {
    return 'BookAppointmentEvent.initialize(doctorInfo: $doctorInfo, sessionSelectedInfo: $sessionSelectedInfo, bookedConsultation: $bookedConsultation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.doctorInfo, doctorInfo) ||
                other.doctorInfo == doctorInfo) &&
            (identical(other.sessionSelectedInfo, sessionSelectedInfo) ||
                other.sessionSelectedInfo == sessionSelectedInfo) &&
            (identical(other.bookedConsultation, bookedConsultation) ||
                other.bookedConsultation == bookedConsultation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, doctorInfo, sessionSelectedInfo, bookedConsultation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(DaySlot daySlot) selectDaySlot,
    required TResult Function() rescheduleConsultation,
  }) {
    return initialize(doctorInfo, sessionSelectedInfo, bookedConsultation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(DaySlot daySlot)? selectDaySlot,
    TResult? Function()? rescheduleConsultation,
  }) {
    return initialize?.call(
        doctorInfo, sessionSelectedInfo, bookedConsultation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(DaySlot daySlot)? selectDaySlot,
    TResult Function()? rescheduleConsultation,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(doctorInfo, sessionSelectedInfo, bookedConsultation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetSlots value) getSlots,
    required TResult Function(_SelectSlot value) selectSlot,
    required TResult Function(_SelectDaySlot value) selectDaySlot,
    required TResult Function(_RescheduleConsultation value)
        rescheduleConsultation,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDaySlot value)? selectDaySlot,
    TResult? Function(_RescheduleConsultation value)? rescheduleConsultation,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDaySlot value)? selectDaySlot,
    TResult Function(_RescheduleConsultation value)? rescheduleConsultation,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements BookAppointmentEvent {
  const factory _Initialize(
      final DoctorModel? doctorInfo,
      final SessionSelectedInfo? sessionSelectedInfo,
      final InternalConsultationModel? bookedConsultation) = _$InitializeImpl;

  DoctorModel? get doctorInfo;
  SessionSelectedInfo? get sessionSelectedInfo;
  InternalConsultationModel? get bookedConsultation;
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
    extends _$BookAppointmentEventCopyWithImpl<$Res, _$GetSlotsImpl>
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
    return 'BookAppointmentEvent.getSlots()';
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
    required TResult Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(DaySlot daySlot) selectDaySlot,
    required TResult Function() rescheduleConsultation,
  }) {
    return getSlots();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(DaySlot daySlot)? selectDaySlot,
    TResult? Function()? rescheduleConsultation,
  }) {
    return getSlots?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(DaySlot daySlot)? selectDaySlot,
    TResult Function()? rescheduleConsultation,
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
    required TResult Function(_SelectDaySlot value) selectDaySlot,
    required TResult Function(_RescheduleConsultation value)
        rescheduleConsultation,
  }) {
    return getSlots(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDaySlot value)? selectDaySlot,
    TResult? Function(_RescheduleConsultation value)? rescheduleConsultation,
  }) {
    return getSlots?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDaySlot value)? selectDaySlot,
    TResult Function(_RescheduleConsultation value)? rescheduleConsultation,
    required TResult orElse(),
  }) {
    if (getSlots != null) {
      return getSlots(this);
    }
    return orElse();
  }
}

abstract class _GetSlots implements BookAppointmentEvent {
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
    extends _$BookAppointmentEventCopyWithImpl<$Res, _$SelectSlotImpl>
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
    return 'BookAppointmentEvent.selectSlot(bookingSlot: $bookingSlot)';
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
    required TResult Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(DaySlot daySlot) selectDaySlot,
    required TResult Function() rescheduleConsultation,
  }) {
    return selectSlot(bookingSlot);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(DaySlot daySlot)? selectDaySlot,
    TResult? Function()? rescheduleConsultation,
  }) {
    return selectSlot?.call(bookingSlot);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(DaySlot daySlot)? selectDaySlot,
    TResult Function()? rescheduleConsultation,
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
    required TResult Function(_SelectDaySlot value) selectDaySlot,
    required TResult Function(_RescheduleConsultation value)
        rescheduleConsultation,
  }) {
    return selectSlot(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDaySlot value)? selectDaySlot,
    TResult? Function(_RescheduleConsultation value)? rescheduleConsultation,
  }) {
    return selectSlot?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDaySlot value)? selectDaySlot,
    TResult Function(_RescheduleConsultation value)? rescheduleConsultation,
    required TResult orElse(),
  }) {
    if (selectSlot != null) {
      return selectSlot(this);
    }
    return orElse();
  }
}

abstract class _SelectSlot implements BookAppointmentEvent {
  const factory _SelectSlot(final BookingSlotInfo? bookingSlot) =
      _$SelectSlotImpl;

  BookingSlotInfo? get bookingSlot;
  @JsonKey(ignore: true)
  _$$SelectSlotImplCopyWith<_$SelectSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectDaySlotImplCopyWith<$Res> {
  factory _$$SelectDaySlotImplCopyWith(
          _$SelectDaySlotImpl value, $Res Function(_$SelectDaySlotImpl) then) =
      __$$SelectDaySlotImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DaySlot daySlot});
}

/// @nodoc
class __$$SelectDaySlotImplCopyWithImpl<$Res>
    extends _$BookAppointmentEventCopyWithImpl<$Res, _$SelectDaySlotImpl>
    implements _$$SelectDaySlotImplCopyWith<$Res> {
  __$$SelectDaySlotImplCopyWithImpl(
      _$SelectDaySlotImpl _value, $Res Function(_$SelectDaySlotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daySlot = null,
  }) {
    return _then(_$SelectDaySlotImpl(
      null == daySlot
          ? _value.daySlot
          : daySlot // ignore: cast_nullable_to_non_nullable
              as DaySlot,
    ));
  }
}

/// @nodoc

class _$SelectDaySlotImpl implements _SelectDaySlot {
  const _$SelectDaySlotImpl(this.daySlot);

  @override
  final DaySlot daySlot;

  @override
  String toString() {
    return 'BookAppointmentEvent.selectDaySlot(daySlot: $daySlot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectDaySlotImpl &&
            (identical(other.daySlot, daySlot) || other.daySlot == daySlot));
  }

  @override
  int get hashCode => Object.hash(runtimeType, daySlot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectDaySlotImplCopyWith<_$SelectDaySlotImpl> get copyWith =>
      __$$SelectDaySlotImplCopyWithImpl<_$SelectDaySlotImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(DaySlot daySlot) selectDaySlot,
    required TResult Function() rescheduleConsultation,
  }) {
    return selectDaySlot(daySlot);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(DaySlot daySlot)? selectDaySlot,
    TResult? Function()? rescheduleConsultation,
  }) {
    return selectDaySlot?.call(daySlot);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(DaySlot daySlot)? selectDaySlot,
    TResult Function()? rescheduleConsultation,
    required TResult orElse(),
  }) {
    if (selectDaySlot != null) {
      return selectDaySlot(daySlot);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetSlots value) getSlots,
    required TResult Function(_SelectSlot value) selectSlot,
    required TResult Function(_SelectDaySlot value) selectDaySlot,
    required TResult Function(_RescheduleConsultation value)
        rescheduleConsultation,
  }) {
    return selectDaySlot(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDaySlot value)? selectDaySlot,
    TResult? Function(_RescheduleConsultation value)? rescheduleConsultation,
  }) {
    return selectDaySlot?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDaySlot value)? selectDaySlot,
    TResult Function(_RescheduleConsultation value)? rescheduleConsultation,
    required TResult orElse(),
  }) {
    if (selectDaySlot != null) {
      return selectDaySlot(this);
    }
    return orElse();
  }
}

abstract class _SelectDaySlot implements BookAppointmentEvent {
  const factory _SelectDaySlot(final DaySlot daySlot) = _$SelectDaySlotImpl;

  DaySlot get daySlot;
  @JsonKey(ignore: true)
  _$$SelectDaySlotImplCopyWith<_$SelectDaySlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RescheduleConsultationImplCopyWith<$Res> {
  factory _$$RescheduleConsultationImplCopyWith(
          _$RescheduleConsultationImpl value,
          $Res Function(_$RescheduleConsultationImpl) then) =
      __$$RescheduleConsultationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RescheduleConsultationImplCopyWithImpl<$Res>
    extends _$BookAppointmentEventCopyWithImpl<$Res,
        _$RescheduleConsultationImpl>
    implements _$$RescheduleConsultationImplCopyWith<$Res> {
  __$$RescheduleConsultationImplCopyWithImpl(
      _$RescheduleConsultationImpl _value,
      $Res Function(_$RescheduleConsultationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RescheduleConsultationImpl implements _RescheduleConsultation {
  const _$RescheduleConsultationImpl();

  @override
  String toString() {
    return 'BookAppointmentEvent.rescheduleConsultation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RescheduleConsultationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)
        initialize,
    required TResult Function() getSlots,
    required TResult Function(BookingSlotInfo? bookingSlot) selectSlot,
    required TResult Function(DaySlot daySlot) selectDaySlot,
    required TResult Function() rescheduleConsultation,
  }) {
    return rescheduleConsultation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)?
        initialize,
    TResult? Function()? getSlots,
    TResult? Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult? Function(DaySlot daySlot)? selectDaySlot,
    TResult? Function()? rescheduleConsultation,
  }) {
    return rescheduleConsultation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel? doctorInfo,
            SessionSelectedInfo? sessionSelectedInfo,
            InternalConsultationModel? bookedConsultation)?
        initialize,
    TResult Function()? getSlots,
    TResult Function(BookingSlotInfo? bookingSlot)? selectSlot,
    TResult Function(DaySlot daySlot)? selectDaySlot,
    TResult Function()? rescheduleConsultation,
    required TResult orElse(),
  }) {
    if (rescheduleConsultation != null) {
      return rescheduleConsultation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetSlots value) getSlots,
    required TResult Function(_SelectSlot value) selectSlot,
    required TResult Function(_SelectDaySlot value) selectDaySlot,
    required TResult Function(_RescheduleConsultation value)
        rescheduleConsultation,
  }) {
    return rescheduleConsultation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetSlots value)? getSlots,
    TResult? Function(_SelectSlot value)? selectSlot,
    TResult? Function(_SelectDaySlot value)? selectDaySlot,
    TResult? Function(_RescheduleConsultation value)? rescheduleConsultation,
  }) {
    return rescheduleConsultation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetSlots value)? getSlots,
    TResult Function(_SelectSlot value)? selectSlot,
    TResult Function(_SelectDaySlot value)? selectDaySlot,
    TResult Function(_RescheduleConsultation value)? rescheduleConsultation,
    required TResult orElse(),
  }) {
    if (rescheduleConsultation != null) {
      return rescheduleConsultation(this);
    }
    return orElse();
  }
}

abstract class _RescheduleConsultation implements BookAppointmentEvent {
  const factory _RescheduleConsultation() = _$RescheduleConsultationImpl;
}

/// @nodoc
mixin _$BookAppointmentState {
  BookingSlotInfo? get selectedSlot => throw _privateConstructorUsedError;
  DaySlot? get selectedDaySlot => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  DoctorModel? get doctorInfo => throw _privateConstructorUsedError;
  InternalConsultationModel? get bookedConsultation =>
      throw _privateConstructorUsedError;
  Either<String, DefaultResponse>? get rescheduleConsultationResult =>
      throw _privateConstructorUsedError;
  SessionSelectedInfo? get sessionSelectedInfo =>
      throw _privateConstructorUsedError;
  List<DaySlot> get daySlots => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookAppointmentStateCopyWith<BookAppointmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookAppointmentStateCopyWith<$Res> {
  factory $BookAppointmentStateCopyWith(BookAppointmentState value,
          $Res Function(BookAppointmentState) then) =
      _$BookAppointmentStateCopyWithImpl<$Res, BookAppointmentState>;
  @useResult
  $Res call(
      {BookingSlotInfo? selectedSlot,
      DaySlot? selectedDaySlot,
      LoadingState loadingState,
      DoctorModel? doctorInfo,
      InternalConsultationModel? bookedConsultation,
      Either<String, DefaultResponse>? rescheduleConsultationResult,
      SessionSelectedInfo? sessionSelectedInfo,
      List<DaySlot> daySlots});
}

/// @nodoc
class _$BookAppointmentStateCopyWithImpl<$Res,
        $Val extends BookAppointmentState>
    implements $BookAppointmentStateCopyWith<$Res> {
  _$BookAppointmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSlot = freezed,
    Object? selectedDaySlot = freezed,
    Object? loadingState = null,
    Object? doctorInfo = freezed,
    Object? bookedConsultation = freezed,
    Object? rescheduleConsultationResult = freezed,
    Object? sessionSelectedInfo = freezed,
    Object? daySlots = null,
  }) {
    return _then(_value.copyWith(
      selectedSlot: freezed == selectedSlot
          ? _value.selectedSlot
          : selectedSlot // ignore: cast_nullable_to_non_nullable
              as BookingSlotInfo?,
      selectedDaySlot: freezed == selectedDaySlot
          ? _value.selectedDaySlot
          : selectedDaySlot // ignore: cast_nullable_to_non_nullable
              as DaySlot?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      doctorInfo: freezed == doctorInfo
          ? _value.doctorInfo
          : doctorInfo // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
      bookedConsultation: freezed == bookedConsultation
          ? _value.bookedConsultation
          : bookedConsultation // ignore: cast_nullable_to_non_nullable
              as InternalConsultationModel?,
      rescheduleConsultationResult: freezed == rescheduleConsultationResult
          ? _value.rescheduleConsultationResult
          : rescheduleConsultationResult // ignore: cast_nullable_to_non_nullable
              as Either<String, DefaultResponse>?,
      sessionSelectedInfo: freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
      daySlots: null == daySlots
          ? _value.daySlots
          : daySlots // ignore: cast_nullable_to_non_nullable
              as List<DaySlot>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookAppointmentStateImplCopyWith<$Res>
    implements $BookAppointmentStateCopyWith<$Res> {
  factory _$$BookAppointmentStateImplCopyWith(_$BookAppointmentStateImpl value,
          $Res Function(_$BookAppointmentStateImpl) then) =
      __$$BookAppointmentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BookingSlotInfo? selectedSlot,
      DaySlot? selectedDaySlot,
      LoadingState loadingState,
      DoctorModel? doctorInfo,
      InternalConsultationModel? bookedConsultation,
      Either<String, DefaultResponse>? rescheduleConsultationResult,
      SessionSelectedInfo? sessionSelectedInfo,
      List<DaySlot> daySlots});
}

/// @nodoc
class __$$BookAppointmentStateImplCopyWithImpl<$Res>
    extends _$BookAppointmentStateCopyWithImpl<$Res, _$BookAppointmentStateImpl>
    implements _$$BookAppointmentStateImplCopyWith<$Res> {
  __$$BookAppointmentStateImplCopyWithImpl(_$BookAppointmentStateImpl _value,
      $Res Function(_$BookAppointmentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSlot = freezed,
    Object? selectedDaySlot = freezed,
    Object? loadingState = null,
    Object? doctorInfo = freezed,
    Object? bookedConsultation = freezed,
    Object? rescheduleConsultationResult = freezed,
    Object? sessionSelectedInfo = freezed,
    Object? daySlots = null,
  }) {
    return _then(_$BookAppointmentStateImpl(
      selectedSlot: freezed == selectedSlot
          ? _value.selectedSlot
          : selectedSlot // ignore: cast_nullable_to_non_nullable
              as BookingSlotInfo?,
      selectedDaySlot: freezed == selectedDaySlot
          ? _value.selectedDaySlot
          : selectedDaySlot // ignore: cast_nullable_to_non_nullable
              as DaySlot?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      doctorInfo: freezed == doctorInfo
          ? _value.doctorInfo
          : doctorInfo // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
      bookedConsultation: freezed == bookedConsultation
          ? _value.bookedConsultation
          : bookedConsultation // ignore: cast_nullable_to_non_nullable
              as InternalConsultationModel?,
      rescheduleConsultationResult: freezed == rescheduleConsultationResult
          ? _value.rescheduleConsultationResult
          : rescheduleConsultationResult // ignore: cast_nullable_to_non_nullable
              as Either<String, DefaultResponse>?,
      sessionSelectedInfo: freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
      daySlots: null == daySlots
          ? _value._daySlots
          : daySlots // ignore: cast_nullable_to_non_nullable
              as List<DaySlot>,
    ));
  }
}

/// @nodoc

class _$BookAppointmentStateImpl implements _BookAppointmentState {
  const _$BookAppointmentStateImpl(
      {required this.selectedSlot,
      required this.selectedDaySlot,
      required this.loadingState,
      required this.doctorInfo,
      required this.bookedConsultation,
      required this.rescheduleConsultationResult,
      this.sessionSelectedInfo,
      required final List<DaySlot> daySlots})
      : _daySlots = daySlots;

  @override
  final BookingSlotInfo? selectedSlot;
  @override
  final DaySlot? selectedDaySlot;
  @override
  final LoadingState loadingState;
  @override
  final DoctorModel? doctorInfo;
  @override
  final InternalConsultationModel? bookedConsultation;
  @override
  final Either<String, DefaultResponse>? rescheduleConsultationResult;
  @override
  final SessionSelectedInfo? sessionSelectedInfo;
  final List<DaySlot> _daySlots;
  @override
  List<DaySlot> get daySlots {
    if (_daySlots is EqualUnmodifiableListView) return _daySlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daySlots);
  }

  @override
  String toString() {
    return 'BookAppointmentState(selectedSlot: $selectedSlot, selectedDaySlot: $selectedDaySlot, loadingState: $loadingState, doctorInfo: $doctorInfo, bookedConsultation: $bookedConsultation, rescheduleConsultationResult: $rescheduleConsultationResult, sessionSelectedInfo: $sessionSelectedInfo, daySlots: $daySlots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookAppointmentStateImpl &&
            (identical(other.selectedSlot, selectedSlot) ||
                other.selectedSlot == selectedSlot) &&
            (identical(other.selectedDaySlot, selectedDaySlot) ||
                other.selectedDaySlot == selectedDaySlot) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.doctorInfo, doctorInfo) ||
                other.doctorInfo == doctorInfo) &&
            (identical(other.bookedConsultation, bookedConsultation) ||
                other.bookedConsultation == bookedConsultation) &&
            (identical(other.rescheduleConsultationResult,
                    rescheduleConsultationResult) ||
                other.rescheduleConsultationResult ==
                    rescheduleConsultationResult) &&
            (identical(other.sessionSelectedInfo, sessionSelectedInfo) ||
                other.sessionSelectedInfo == sessionSelectedInfo) &&
            const DeepCollectionEquality().equals(other._daySlots, _daySlots));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedSlot,
      selectedDaySlot,
      loadingState,
      doctorInfo,
      bookedConsultation,
      rescheduleConsultationResult,
      sessionSelectedInfo,
      const DeepCollectionEquality().hash(_daySlots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookAppointmentStateImplCopyWith<_$BookAppointmentStateImpl>
      get copyWith =>
          __$$BookAppointmentStateImplCopyWithImpl<_$BookAppointmentStateImpl>(
              this, _$identity);
}

abstract class _BookAppointmentState implements BookAppointmentState {
  const factory _BookAppointmentState(
      {required final BookingSlotInfo? selectedSlot,
      required final DaySlot? selectedDaySlot,
      required final LoadingState loadingState,
      required final DoctorModel? doctorInfo,
      required final InternalConsultationModel? bookedConsultation,
      required final Either<String, DefaultResponse>?
          rescheduleConsultationResult,
      final SessionSelectedInfo? sessionSelectedInfo,
      required final List<DaySlot> daySlots}) = _$BookAppointmentStateImpl;

  @override
  BookingSlotInfo? get selectedSlot;
  @override
  DaySlot? get selectedDaySlot;
  @override
  LoadingState get loadingState;
  @override
  DoctorModel? get doctorInfo;
  @override
  InternalConsultationModel? get bookedConsultation;
  @override
  Either<String, DefaultResponse>? get rescheduleConsultationResult;
  @override
  SessionSelectedInfo? get sessionSelectedInfo;
  @override
  List<DaySlot> get daySlots;
  @override
  @JsonKey(ignore: true)
  _$$BookAppointmentStateImplCopyWith<_$BookAppointmentStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
