// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_bookings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyBookingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDoctorBookings,
    required TResult Function() getBookedTherapies,
    required TResult Function(int page) selectPage,
    required TResult Function() setForcedRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDoctorBookings,
    TResult? Function()? getBookedTherapies,
    TResult? Function(int page)? selectPage,
    TResult? Function()? setForcedRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDoctorBookings,
    TResult Function()? getBookedTherapies,
    TResult Function(int page)? selectPage,
    TResult Function()? setForcedRefresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDoctorBookings value) getDoctorBookings,
    required TResult Function(_GetBookedTherapies value) getBookedTherapies,
    required TResult Function(_SelectPage value) selectPage,
    required TResult Function(_SetForcedRefresh value) setForcedRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDoctorBookings value)? getDoctorBookings,
    TResult? Function(_GetBookedTherapies value)? getBookedTherapies,
    TResult? Function(_SelectPage value)? selectPage,
    TResult? Function(_SetForcedRefresh value)? setForcedRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDoctorBookings value)? getDoctorBookings,
    TResult Function(_GetBookedTherapies value)? getBookedTherapies,
    TResult Function(_SelectPage value)? selectPage,
    TResult Function(_SetForcedRefresh value)? setForcedRefresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyBookingsEventCopyWith<$Res> {
  factory $MyBookingsEventCopyWith(
          MyBookingsEvent value, $Res Function(MyBookingsEvent) then) =
      _$MyBookingsEventCopyWithImpl<$Res, MyBookingsEvent>;
}

/// @nodoc
class _$MyBookingsEventCopyWithImpl<$Res, $Val extends MyBookingsEvent>
    implements $MyBookingsEventCopyWith<$Res> {
  _$MyBookingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetDoctorBookingsImplCopyWith<$Res> {
  factory _$$GetDoctorBookingsImplCopyWith(_$GetDoctorBookingsImpl value,
          $Res Function(_$GetDoctorBookingsImpl) then) =
      __$$GetDoctorBookingsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDoctorBookingsImplCopyWithImpl<$Res>
    extends _$MyBookingsEventCopyWithImpl<$Res, _$GetDoctorBookingsImpl>
    implements _$$GetDoctorBookingsImplCopyWith<$Res> {
  __$$GetDoctorBookingsImplCopyWithImpl(_$GetDoctorBookingsImpl _value,
      $Res Function(_$GetDoctorBookingsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetDoctorBookingsImpl implements _GetDoctorBookings {
  const _$GetDoctorBookingsImpl();

  @override
  String toString() {
    return 'MyBookingsEvent.getDoctorBookings()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDoctorBookingsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDoctorBookings,
    required TResult Function() getBookedTherapies,
    required TResult Function(int page) selectPage,
    required TResult Function() setForcedRefresh,
  }) {
    return getDoctorBookings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDoctorBookings,
    TResult? Function()? getBookedTherapies,
    TResult? Function(int page)? selectPage,
    TResult? Function()? setForcedRefresh,
  }) {
    return getDoctorBookings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDoctorBookings,
    TResult Function()? getBookedTherapies,
    TResult Function(int page)? selectPage,
    TResult Function()? setForcedRefresh,
    required TResult orElse(),
  }) {
    if (getDoctorBookings != null) {
      return getDoctorBookings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDoctorBookings value) getDoctorBookings,
    required TResult Function(_GetBookedTherapies value) getBookedTherapies,
    required TResult Function(_SelectPage value) selectPage,
    required TResult Function(_SetForcedRefresh value) setForcedRefresh,
  }) {
    return getDoctorBookings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDoctorBookings value)? getDoctorBookings,
    TResult? Function(_GetBookedTherapies value)? getBookedTherapies,
    TResult? Function(_SelectPage value)? selectPage,
    TResult? Function(_SetForcedRefresh value)? setForcedRefresh,
  }) {
    return getDoctorBookings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDoctorBookings value)? getDoctorBookings,
    TResult Function(_GetBookedTherapies value)? getBookedTherapies,
    TResult Function(_SelectPage value)? selectPage,
    TResult Function(_SetForcedRefresh value)? setForcedRefresh,
    required TResult orElse(),
  }) {
    if (getDoctorBookings != null) {
      return getDoctorBookings(this);
    }
    return orElse();
  }
}

abstract class _GetDoctorBookings implements MyBookingsEvent {
  const factory _GetDoctorBookings() = _$GetDoctorBookingsImpl;
}

/// @nodoc
abstract class _$$GetBookedTherapiesImplCopyWith<$Res> {
  factory _$$GetBookedTherapiesImplCopyWith(_$GetBookedTherapiesImpl value,
          $Res Function(_$GetBookedTherapiesImpl) then) =
      __$$GetBookedTherapiesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBookedTherapiesImplCopyWithImpl<$Res>
    extends _$MyBookingsEventCopyWithImpl<$Res, _$GetBookedTherapiesImpl>
    implements _$$GetBookedTherapiesImplCopyWith<$Res> {
  __$$GetBookedTherapiesImplCopyWithImpl(_$GetBookedTherapiesImpl _value,
      $Res Function(_$GetBookedTherapiesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetBookedTherapiesImpl implements _GetBookedTherapies {
  const _$GetBookedTherapiesImpl();

  @override
  String toString() {
    return 'MyBookingsEvent.getBookedTherapies()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetBookedTherapiesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDoctorBookings,
    required TResult Function() getBookedTherapies,
    required TResult Function(int page) selectPage,
    required TResult Function() setForcedRefresh,
  }) {
    return getBookedTherapies();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDoctorBookings,
    TResult? Function()? getBookedTherapies,
    TResult? Function(int page)? selectPage,
    TResult? Function()? setForcedRefresh,
  }) {
    return getBookedTherapies?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDoctorBookings,
    TResult Function()? getBookedTherapies,
    TResult Function(int page)? selectPage,
    TResult Function()? setForcedRefresh,
    required TResult orElse(),
  }) {
    if (getBookedTherapies != null) {
      return getBookedTherapies();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDoctorBookings value) getDoctorBookings,
    required TResult Function(_GetBookedTherapies value) getBookedTherapies,
    required TResult Function(_SelectPage value) selectPage,
    required TResult Function(_SetForcedRefresh value) setForcedRefresh,
  }) {
    return getBookedTherapies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDoctorBookings value)? getDoctorBookings,
    TResult? Function(_GetBookedTherapies value)? getBookedTherapies,
    TResult? Function(_SelectPage value)? selectPage,
    TResult? Function(_SetForcedRefresh value)? setForcedRefresh,
  }) {
    return getBookedTherapies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDoctorBookings value)? getDoctorBookings,
    TResult Function(_GetBookedTherapies value)? getBookedTherapies,
    TResult Function(_SelectPage value)? selectPage,
    TResult Function(_SetForcedRefresh value)? setForcedRefresh,
    required TResult orElse(),
  }) {
    if (getBookedTherapies != null) {
      return getBookedTherapies(this);
    }
    return orElse();
  }
}

abstract class _GetBookedTherapies implements MyBookingsEvent {
  const factory _GetBookedTherapies() = _$GetBookedTherapiesImpl;
}

/// @nodoc
abstract class _$$SelectPageImplCopyWith<$Res> {
  factory _$$SelectPageImplCopyWith(
          _$SelectPageImpl value, $Res Function(_$SelectPageImpl) then) =
      __$$SelectPageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$SelectPageImplCopyWithImpl<$Res>
    extends _$MyBookingsEventCopyWithImpl<$Res, _$SelectPageImpl>
    implements _$$SelectPageImplCopyWith<$Res> {
  __$$SelectPageImplCopyWithImpl(
      _$SelectPageImpl _value, $Res Function(_$SelectPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$SelectPageImpl(
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectPageImpl implements _SelectPage {
  const _$SelectPageImpl(this.page);

  @override
  final int page;

  @override
  String toString() {
    return 'MyBookingsEvent.selectPage(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectPageImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectPageImplCopyWith<_$SelectPageImpl> get copyWith =>
      __$$SelectPageImplCopyWithImpl<_$SelectPageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDoctorBookings,
    required TResult Function() getBookedTherapies,
    required TResult Function(int page) selectPage,
    required TResult Function() setForcedRefresh,
  }) {
    return selectPage(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDoctorBookings,
    TResult? Function()? getBookedTherapies,
    TResult? Function(int page)? selectPage,
    TResult? Function()? setForcedRefresh,
  }) {
    return selectPage?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDoctorBookings,
    TResult Function()? getBookedTherapies,
    TResult Function(int page)? selectPage,
    TResult Function()? setForcedRefresh,
    required TResult orElse(),
  }) {
    if (selectPage != null) {
      return selectPage(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDoctorBookings value) getDoctorBookings,
    required TResult Function(_GetBookedTherapies value) getBookedTherapies,
    required TResult Function(_SelectPage value) selectPage,
    required TResult Function(_SetForcedRefresh value) setForcedRefresh,
  }) {
    return selectPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDoctorBookings value)? getDoctorBookings,
    TResult? Function(_GetBookedTherapies value)? getBookedTherapies,
    TResult? Function(_SelectPage value)? selectPage,
    TResult? Function(_SetForcedRefresh value)? setForcedRefresh,
  }) {
    return selectPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDoctorBookings value)? getDoctorBookings,
    TResult Function(_GetBookedTherapies value)? getBookedTherapies,
    TResult Function(_SelectPage value)? selectPage,
    TResult Function(_SetForcedRefresh value)? setForcedRefresh,
    required TResult orElse(),
  }) {
    if (selectPage != null) {
      return selectPage(this);
    }
    return orElse();
  }
}

abstract class _SelectPage implements MyBookingsEvent {
  const factory _SelectPage(final int page) = _$SelectPageImpl;

  int get page;
  @JsonKey(ignore: true)
  _$$SelectPageImplCopyWith<_$SelectPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetForcedRefreshImplCopyWith<$Res> {
  factory _$$SetForcedRefreshImplCopyWith(_$SetForcedRefreshImpl value,
          $Res Function(_$SetForcedRefreshImpl) then) =
      __$$SetForcedRefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetForcedRefreshImplCopyWithImpl<$Res>
    extends _$MyBookingsEventCopyWithImpl<$Res, _$SetForcedRefreshImpl>
    implements _$$SetForcedRefreshImplCopyWith<$Res> {
  __$$SetForcedRefreshImplCopyWithImpl(_$SetForcedRefreshImpl _value,
      $Res Function(_$SetForcedRefreshImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SetForcedRefreshImpl implements _SetForcedRefresh {
  const _$SetForcedRefreshImpl();

  @override
  String toString() {
    return 'MyBookingsEvent.setForcedRefresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SetForcedRefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDoctorBookings,
    required TResult Function() getBookedTherapies,
    required TResult Function(int page) selectPage,
    required TResult Function() setForcedRefresh,
  }) {
    return setForcedRefresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDoctorBookings,
    TResult? Function()? getBookedTherapies,
    TResult? Function(int page)? selectPage,
    TResult? Function()? setForcedRefresh,
  }) {
    return setForcedRefresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDoctorBookings,
    TResult Function()? getBookedTherapies,
    TResult Function(int page)? selectPage,
    TResult Function()? setForcedRefresh,
    required TResult orElse(),
  }) {
    if (setForcedRefresh != null) {
      return setForcedRefresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDoctorBookings value) getDoctorBookings,
    required TResult Function(_GetBookedTherapies value) getBookedTherapies,
    required TResult Function(_SelectPage value) selectPage,
    required TResult Function(_SetForcedRefresh value) setForcedRefresh,
  }) {
    return setForcedRefresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDoctorBookings value)? getDoctorBookings,
    TResult? Function(_GetBookedTherapies value)? getBookedTherapies,
    TResult? Function(_SelectPage value)? selectPage,
    TResult? Function(_SetForcedRefresh value)? setForcedRefresh,
  }) {
    return setForcedRefresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDoctorBookings value)? getDoctorBookings,
    TResult Function(_GetBookedTherapies value)? getBookedTherapies,
    TResult Function(_SelectPage value)? selectPage,
    TResult Function(_SetForcedRefresh value)? setForcedRefresh,
    required TResult orElse(),
  }) {
    if (setForcedRefresh != null) {
      return setForcedRefresh(this);
    }
    return orElse();
  }
}

abstract class _SetForcedRefresh implements MyBookingsEvent {
  const factory _SetForcedRefresh() = _$SetForcedRefreshImpl;
}

/// @nodoc
mixin _$MyBookingsState {
  LoadingState get loadingState => throw _privateConstructorUsedError;
  int get selectedPage => throw _privateConstructorUsedError;
  List<BookedTherapyInfo>? get bookedTherapies =>
      throw _privateConstructorUsedError;
  DoctorConsultationModel? get doctorBookingModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyBookingsStateCopyWith<MyBookingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyBookingsStateCopyWith<$Res> {
  factory $MyBookingsStateCopyWith(
          MyBookingsState value, $Res Function(MyBookingsState) then) =
      _$MyBookingsStateCopyWithImpl<$Res, MyBookingsState>;
  @useResult
  $Res call(
      {LoadingState loadingState,
      int selectedPage,
      List<BookedTherapyInfo>? bookedTherapies,
      DoctorConsultationModel? doctorBookingModel});
}

/// @nodoc
class _$MyBookingsStateCopyWithImpl<$Res, $Val extends MyBookingsState>
    implements $MyBookingsStateCopyWith<$Res> {
  _$MyBookingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? selectedPage = null,
    Object? bookedTherapies = freezed,
    Object? doctorBookingModel = freezed,
  }) {
    return _then(_value.copyWith(
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      selectedPage: null == selectedPage
          ? _value.selectedPage
          : selectedPage // ignore: cast_nullable_to_non_nullable
              as int,
      bookedTherapies: freezed == bookedTherapies
          ? _value.bookedTherapies
          : bookedTherapies // ignore: cast_nullable_to_non_nullable
              as List<BookedTherapyInfo>?,
      doctorBookingModel: freezed == doctorBookingModel
          ? _value.doctorBookingModel
          : doctorBookingModel // ignore: cast_nullable_to_non_nullable
              as DoctorConsultationModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyBookingsStateImplCopyWith<$Res>
    implements $MyBookingsStateCopyWith<$Res> {
  factory _$$MyBookingsStateImplCopyWith(_$MyBookingsStateImpl value,
          $Res Function(_$MyBookingsStateImpl) then) =
      __$$MyBookingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingState loadingState,
      int selectedPage,
      List<BookedTherapyInfo>? bookedTherapies,
      DoctorConsultationModel? doctorBookingModel});
}

/// @nodoc
class __$$MyBookingsStateImplCopyWithImpl<$Res>
    extends _$MyBookingsStateCopyWithImpl<$Res, _$MyBookingsStateImpl>
    implements _$$MyBookingsStateImplCopyWith<$Res> {
  __$$MyBookingsStateImplCopyWithImpl(
      _$MyBookingsStateImpl _value, $Res Function(_$MyBookingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? selectedPage = null,
    Object? bookedTherapies = freezed,
    Object? doctorBookingModel = freezed,
  }) {
    return _then(_$MyBookingsStateImpl(
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      selectedPage: null == selectedPage
          ? _value.selectedPage
          : selectedPage // ignore: cast_nullable_to_non_nullable
              as int,
      bookedTherapies: freezed == bookedTherapies
          ? _value._bookedTherapies
          : bookedTherapies // ignore: cast_nullable_to_non_nullable
              as List<BookedTherapyInfo>?,
      doctorBookingModel: freezed == doctorBookingModel
          ? _value.doctorBookingModel
          : doctorBookingModel // ignore: cast_nullable_to_non_nullable
              as DoctorConsultationModel?,
    ));
  }
}

/// @nodoc

class _$MyBookingsStateImpl implements _MyBookingsState {
  const _$MyBookingsStateImpl(
      {required this.loadingState,
      required this.selectedPage,
      required final List<BookedTherapyInfo>? bookedTherapies,
      required this.doctorBookingModel})
      : _bookedTherapies = bookedTherapies;

  @override
  final LoadingState loadingState;
  @override
  final int selectedPage;
  final List<BookedTherapyInfo>? _bookedTherapies;
  @override
  List<BookedTherapyInfo>? get bookedTherapies {
    final value = _bookedTherapies;
    if (value == null) return null;
    if (_bookedTherapies is EqualUnmodifiableListView) return _bookedTherapies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DoctorConsultationModel? doctorBookingModel;

  @override
  String toString() {
    return 'MyBookingsState(loadingState: $loadingState, selectedPage: $selectedPage, bookedTherapies: $bookedTherapies, doctorBookingModel: $doctorBookingModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyBookingsStateImpl &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.selectedPage, selectedPage) ||
                other.selectedPage == selectedPage) &&
            const DeepCollectionEquality()
                .equals(other._bookedTherapies, _bookedTherapies) &&
            (identical(other.doctorBookingModel, doctorBookingModel) ||
                other.doctorBookingModel == doctorBookingModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadingState,
      selectedPage,
      const DeepCollectionEquality().hash(_bookedTherapies),
      doctorBookingModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyBookingsStateImplCopyWith<_$MyBookingsStateImpl> get copyWith =>
      __$$MyBookingsStateImplCopyWithImpl<_$MyBookingsStateImpl>(
          this, _$identity);
}

abstract class _MyBookingsState implements MyBookingsState {
  const factory _MyBookingsState(
          {required final LoadingState loadingState,
          required final int selectedPage,
          required final List<BookedTherapyInfo>? bookedTherapies,
          required final DoctorConsultationModel? doctorBookingModel}) =
      _$MyBookingsStateImpl;

  @override
  LoadingState get loadingState;
  @override
  int get selectedPage;
  @override
  List<BookedTherapyInfo>? get bookedTherapies;
  @override
  DoctorConsultationModel? get doctorBookingModel;
  @override
  @JsonKey(ignore: true)
  _$$MyBookingsStateImplCopyWith<_$MyBookingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
