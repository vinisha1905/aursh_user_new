// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_user_consultation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingUserConsultationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() getBookingUsers,
    required TResult Function(BookingUserModel bookingUser) selectBookingUser,
    required TResult Function(BookingUserModel bookingUser) addBookingUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DoctorModel doctorInfo, BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? getBookingUsers,
    TResult? Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult? Function(BookingUserModel bookingUser)? addBookingUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DoctorModel doctorInfo, BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? getBookingUsers,
    TResult Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult Function(BookingUserModel bookingUser)? addBookingUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetBookingUsers value) getBookingUsers,
    required TResult Function(_SelectBookingUser value) selectBookingUser,
    required TResult Function(_AddBookingUser value) addBookingUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetBookingUsers value)? getBookingUsers,
    TResult? Function(_SelectBookingUser value)? selectBookingUser,
    TResult? Function(_AddBookingUser value)? addBookingUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetBookingUsers value)? getBookingUsers,
    TResult Function(_SelectBookingUser value)? selectBookingUser,
    TResult Function(_AddBookingUser value)? addBookingUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingUserConsultationEventCopyWith<$Res> {
  factory $BookingUserConsultationEventCopyWith(
          BookingUserConsultationEvent value,
          $Res Function(BookingUserConsultationEvent) then) =
      _$BookingUserConsultationEventCopyWithImpl<$Res,
          BookingUserConsultationEvent>;
}

/// @nodoc
class _$BookingUserConsultationEventCopyWithImpl<$Res,
        $Val extends BookingUserConsultationEvent>
    implements $BookingUserConsultationEventCopyWith<$Res> {
  _$BookingUserConsultationEventCopyWithImpl(this._value, this._then);

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
      {DoctorModel doctorInfo,
      BookingSlotInfo bookingSlotInfo,
      SessionSelectedInfo? sessionSelectedInfo});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$BookingUserConsultationEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorInfo = null,
    Object? bookingSlotInfo = null,
    Object? sessionSelectedInfo = freezed,
  }) {
    return _then(_$InitializeImpl(
      null == doctorInfo
          ? _value.doctorInfo
          : doctorInfo // ignore: cast_nullable_to_non_nullable
              as DoctorModel,
      null == bookingSlotInfo
          ? _value.bookingSlotInfo
          : bookingSlotInfo // ignore: cast_nullable_to_non_nullable
              as BookingSlotInfo,
      freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(
      this.doctorInfo, this.bookingSlotInfo, this.sessionSelectedInfo);

  @override
  final DoctorModel doctorInfo;
  @override
  final BookingSlotInfo bookingSlotInfo;
  @override
  final SessionSelectedInfo? sessionSelectedInfo;

  @override
  String toString() {
    return 'BookingUserConsultationEvent.initialize(doctorInfo: $doctorInfo, bookingSlotInfo: $bookingSlotInfo, sessionSelectedInfo: $sessionSelectedInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.doctorInfo, doctorInfo) ||
                other.doctorInfo == doctorInfo) &&
            (identical(other.bookingSlotInfo, bookingSlotInfo) ||
                other.bookingSlotInfo == bookingSlotInfo) &&
            (identical(other.sessionSelectedInfo, sessionSelectedInfo) ||
                other.sessionSelectedInfo == sessionSelectedInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, doctorInfo, bookingSlotInfo, sessionSelectedInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() getBookingUsers,
    required TResult Function(BookingUserModel bookingUser) selectBookingUser,
    required TResult Function(BookingUserModel bookingUser) addBookingUser,
  }) {
    return initialize(doctorInfo, bookingSlotInfo, sessionSelectedInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DoctorModel doctorInfo, BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? getBookingUsers,
    TResult? Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult? Function(BookingUserModel bookingUser)? addBookingUser,
  }) {
    return initialize?.call(doctorInfo, bookingSlotInfo, sessionSelectedInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DoctorModel doctorInfo, BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? getBookingUsers,
    TResult Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult Function(BookingUserModel bookingUser)? addBookingUser,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(doctorInfo, bookingSlotInfo, sessionSelectedInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetBookingUsers value) getBookingUsers,
    required TResult Function(_SelectBookingUser value) selectBookingUser,
    required TResult Function(_AddBookingUser value) addBookingUser,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetBookingUsers value)? getBookingUsers,
    TResult? Function(_SelectBookingUser value)? selectBookingUser,
    TResult? Function(_AddBookingUser value)? addBookingUser,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetBookingUsers value)? getBookingUsers,
    TResult Function(_SelectBookingUser value)? selectBookingUser,
    TResult Function(_AddBookingUser value)? addBookingUser,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements BookingUserConsultationEvent {
  const factory _Initialize(
      final DoctorModel doctorInfo,
      final BookingSlotInfo bookingSlotInfo,
      final SessionSelectedInfo? sessionSelectedInfo) = _$InitializeImpl;

  DoctorModel get doctorInfo;
  BookingSlotInfo get bookingSlotInfo;
  SessionSelectedInfo? get sessionSelectedInfo;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetBookingUsersImplCopyWith<$Res> {
  factory _$$GetBookingUsersImplCopyWith(_$GetBookingUsersImpl value,
          $Res Function(_$GetBookingUsersImpl) then) =
      __$$GetBookingUsersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBookingUsersImplCopyWithImpl<$Res>
    extends _$BookingUserConsultationEventCopyWithImpl<$Res,
        _$GetBookingUsersImpl> implements _$$GetBookingUsersImplCopyWith<$Res> {
  __$$GetBookingUsersImplCopyWithImpl(
      _$GetBookingUsersImpl _value, $Res Function(_$GetBookingUsersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetBookingUsersImpl implements _GetBookingUsers {
  const _$GetBookingUsersImpl();

  @override
  String toString() {
    return 'BookingUserConsultationEvent.getBookingUsers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetBookingUsersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() getBookingUsers,
    required TResult Function(BookingUserModel bookingUser) selectBookingUser,
    required TResult Function(BookingUserModel bookingUser) addBookingUser,
  }) {
    return getBookingUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DoctorModel doctorInfo, BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? getBookingUsers,
    TResult? Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult? Function(BookingUserModel bookingUser)? addBookingUser,
  }) {
    return getBookingUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DoctorModel doctorInfo, BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? getBookingUsers,
    TResult Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult Function(BookingUserModel bookingUser)? addBookingUser,
    required TResult orElse(),
  }) {
    if (getBookingUsers != null) {
      return getBookingUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetBookingUsers value) getBookingUsers,
    required TResult Function(_SelectBookingUser value) selectBookingUser,
    required TResult Function(_AddBookingUser value) addBookingUser,
  }) {
    return getBookingUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetBookingUsers value)? getBookingUsers,
    TResult? Function(_SelectBookingUser value)? selectBookingUser,
    TResult? Function(_AddBookingUser value)? addBookingUser,
  }) {
    return getBookingUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetBookingUsers value)? getBookingUsers,
    TResult Function(_SelectBookingUser value)? selectBookingUser,
    TResult Function(_AddBookingUser value)? addBookingUser,
    required TResult orElse(),
  }) {
    if (getBookingUsers != null) {
      return getBookingUsers(this);
    }
    return orElse();
  }
}

abstract class _GetBookingUsers implements BookingUserConsultationEvent {
  const factory _GetBookingUsers() = _$GetBookingUsersImpl;
}

/// @nodoc
abstract class _$$SelectBookingUserImplCopyWith<$Res> {
  factory _$$SelectBookingUserImplCopyWith(_$SelectBookingUserImpl value,
          $Res Function(_$SelectBookingUserImpl) then) =
      __$$SelectBookingUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BookingUserModel bookingUser});
}

/// @nodoc
class __$$SelectBookingUserImplCopyWithImpl<$Res>
    extends _$BookingUserConsultationEventCopyWithImpl<$Res,
        _$SelectBookingUserImpl>
    implements _$$SelectBookingUserImplCopyWith<$Res> {
  __$$SelectBookingUserImplCopyWithImpl(_$SelectBookingUserImpl _value,
      $Res Function(_$SelectBookingUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingUser = null,
  }) {
    return _then(_$SelectBookingUserImpl(
      null == bookingUser
          ? _value.bookingUser
          : bookingUser // ignore: cast_nullable_to_non_nullable
              as BookingUserModel,
    ));
  }
}

/// @nodoc

class _$SelectBookingUserImpl implements _SelectBookingUser {
  const _$SelectBookingUserImpl(this.bookingUser);

  @override
  final BookingUserModel bookingUser;

  @override
  String toString() {
    return 'BookingUserConsultationEvent.selectBookingUser(bookingUser: $bookingUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectBookingUserImpl &&
            (identical(other.bookingUser, bookingUser) ||
                other.bookingUser == bookingUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookingUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectBookingUserImplCopyWith<_$SelectBookingUserImpl> get copyWith =>
      __$$SelectBookingUserImplCopyWithImpl<_$SelectBookingUserImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() getBookingUsers,
    required TResult Function(BookingUserModel bookingUser) selectBookingUser,
    required TResult Function(BookingUserModel bookingUser) addBookingUser,
  }) {
    return selectBookingUser(bookingUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DoctorModel doctorInfo, BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? getBookingUsers,
    TResult? Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult? Function(BookingUserModel bookingUser)? addBookingUser,
  }) {
    return selectBookingUser?.call(bookingUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DoctorModel doctorInfo, BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? getBookingUsers,
    TResult Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult Function(BookingUserModel bookingUser)? addBookingUser,
    required TResult orElse(),
  }) {
    if (selectBookingUser != null) {
      return selectBookingUser(bookingUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetBookingUsers value) getBookingUsers,
    required TResult Function(_SelectBookingUser value) selectBookingUser,
    required TResult Function(_AddBookingUser value) addBookingUser,
  }) {
    return selectBookingUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetBookingUsers value)? getBookingUsers,
    TResult? Function(_SelectBookingUser value)? selectBookingUser,
    TResult? Function(_AddBookingUser value)? addBookingUser,
  }) {
    return selectBookingUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetBookingUsers value)? getBookingUsers,
    TResult Function(_SelectBookingUser value)? selectBookingUser,
    TResult Function(_AddBookingUser value)? addBookingUser,
    required TResult orElse(),
  }) {
    if (selectBookingUser != null) {
      return selectBookingUser(this);
    }
    return orElse();
  }
}

abstract class _SelectBookingUser implements BookingUserConsultationEvent {
  const factory _SelectBookingUser(final BookingUserModel bookingUser) =
      _$SelectBookingUserImpl;

  BookingUserModel get bookingUser;
  @JsonKey(ignore: true)
  _$$SelectBookingUserImplCopyWith<_$SelectBookingUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddBookingUserImplCopyWith<$Res> {
  factory _$$AddBookingUserImplCopyWith(_$AddBookingUserImpl value,
          $Res Function(_$AddBookingUserImpl) then) =
      __$$AddBookingUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BookingUserModel bookingUser});
}

/// @nodoc
class __$$AddBookingUserImplCopyWithImpl<$Res>
    extends _$BookingUserConsultationEventCopyWithImpl<$Res,
        _$AddBookingUserImpl> implements _$$AddBookingUserImplCopyWith<$Res> {
  __$$AddBookingUserImplCopyWithImpl(
      _$AddBookingUserImpl _value, $Res Function(_$AddBookingUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingUser = null,
  }) {
    return _then(_$AddBookingUserImpl(
      null == bookingUser
          ? _value.bookingUser
          : bookingUser // ignore: cast_nullable_to_non_nullable
              as BookingUserModel,
    ));
  }
}

/// @nodoc

class _$AddBookingUserImpl implements _AddBookingUser {
  const _$AddBookingUserImpl(this.bookingUser);

  @override
  final BookingUserModel bookingUser;

  @override
  String toString() {
    return 'BookingUserConsultationEvent.addBookingUser(bookingUser: $bookingUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBookingUserImpl &&
            (identical(other.bookingUser, bookingUser) ||
                other.bookingUser == bookingUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookingUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddBookingUserImplCopyWith<_$AddBookingUserImpl> get copyWith =>
      __$$AddBookingUserImplCopyWithImpl<_$AddBookingUserImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() getBookingUsers,
    required TResult Function(BookingUserModel bookingUser) selectBookingUser,
    required TResult Function(BookingUserModel bookingUser) addBookingUser,
  }) {
    return addBookingUser(bookingUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DoctorModel doctorInfo, BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? getBookingUsers,
    TResult? Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult? Function(BookingUserModel bookingUser)? addBookingUser,
  }) {
    return addBookingUser?.call(bookingUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DoctorModel doctorInfo, BookingSlotInfo bookingSlotInfo,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? getBookingUsers,
    TResult Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult Function(BookingUserModel bookingUser)? addBookingUser,
    required TResult orElse(),
  }) {
    if (addBookingUser != null) {
      return addBookingUser(bookingUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetBookingUsers value) getBookingUsers,
    required TResult Function(_SelectBookingUser value) selectBookingUser,
    required TResult Function(_AddBookingUser value) addBookingUser,
  }) {
    return addBookingUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetBookingUsers value)? getBookingUsers,
    TResult? Function(_SelectBookingUser value)? selectBookingUser,
    TResult? Function(_AddBookingUser value)? addBookingUser,
  }) {
    return addBookingUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetBookingUsers value)? getBookingUsers,
    TResult Function(_SelectBookingUser value)? selectBookingUser,
    TResult Function(_AddBookingUser value)? addBookingUser,
    required TResult orElse(),
  }) {
    if (addBookingUser != null) {
      return addBookingUser(this);
    }
    return orElse();
  }
}

abstract class _AddBookingUser implements BookingUserConsultationEvent {
  const factory _AddBookingUser(final BookingUserModel bookingUser) =
      _$AddBookingUserImpl;

  BookingUserModel get bookingUser;
  @JsonKey(ignore: true)
  _$$AddBookingUserImplCopyWith<_$AddBookingUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookingUserConsultationState {
  DoctorModel? get doctorInfo => throw _privateConstructorUsedError;
  BookingSlotInfo? get bookingSlotInfo => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  BookingUserModel? get selectedBookingUser =>
      throw _privateConstructorUsedError;
  SessionSelectedInfo? get sessionSelectedInfo =>
      throw _privateConstructorUsedError;
  List<BookingUserModel?> get bookingUsers =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingUserConsultationStateCopyWith<BookingUserConsultationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingUserConsultationStateCopyWith<$Res> {
  factory $BookingUserConsultationStateCopyWith(
          BookingUserConsultationState value,
          $Res Function(BookingUserConsultationState) then) =
      _$BookingUserConsultationStateCopyWithImpl<$Res,
          BookingUserConsultationState>;
  @useResult
  $Res call(
      {DoctorModel? doctorInfo,
      BookingSlotInfo? bookingSlotInfo,
      LoadingState loadingState,
      BookingUserModel? selectedBookingUser,
      SessionSelectedInfo? sessionSelectedInfo,
      List<BookingUserModel?> bookingUsers});
}

/// @nodoc
class _$BookingUserConsultationStateCopyWithImpl<$Res,
        $Val extends BookingUserConsultationState>
    implements $BookingUserConsultationStateCopyWith<$Res> {
  _$BookingUserConsultationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorInfo = freezed,
    Object? bookingSlotInfo = freezed,
    Object? loadingState = null,
    Object? selectedBookingUser = freezed,
    Object? sessionSelectedInfo = freezed,
    Object? bookingUsers = null,
  }) {
    return _then(_value.copyWith(
      doctorInfo: freezed == doctorInfo
          ? _value.doctorInfo
          : doctorInfo // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
      bookingSlotInfo: freezed == bookingSlotInfo
          ? _value.bookingSlotInfo
          : bookingSlotInfo // ignore: cast_nullable_to_non_nullable
              as BookingSlotInfo?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      selectedBookingUser: freezed == selectedBookingUser
          ? _value.selectedBookingUser
          : selectedBookingUser // ignore: cast_nullable_to_non_nullable
              as BookingUserModel?,
      sessionSelectedInfo: freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
      bookingUsers: null == bookingUsers
          ? _value.bookingUsers
          : bookingUsers // ignore: cast_nullable_to_non_nullable
              as List<BookingUserModel?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingUserConsultationStateImplCopyWith<$Res>
    implements $BookingUserConsultationStateCopyWith<$Res> {
  factory _$$BookingUserConsultationStateImplCopyWith(
          _$BookingUserConsultationStateImpl value,
          $Res Function(_$BookingUserConsultationStateImpl) then) =
      __$$BookingUserConsultationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DoctorModel? doctorInfo,
      BookingSlotInfo? bookingSlotInfo,
      LoadingState loadingState,
      BookingUserModel? selectedBookingUser,
      SessionSelectedInfo? sessionSelectedInfo,
      List<BookingUserModel?> bookingUsers});
}

/// @nodoc
class __$$BookingUserConsultationStateImplCopyWithImpl<$Res>
    extends _$BookingUserConsultationStateCopyWithImpl<$Res,
        _$BookingUserConsultationStateImpl>
    implements _$$BookingUserConsultationStateImplCopyWith<$Res> {
  __$$BookingUserConsultationStateImplCopyWithImpl(
      _$BookingUserConsultationStateImpl _value,
      $Res Function(_$BookingUserConsultationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorInfo = freezed,
    Object? bookingSlotInfo = freezed,
    Object? loadingState = null,
    Object? selectedBookingUser = freezed,
    Object? sessionSelectedInfo = freezed,
    Object? bookingUsers = null,
  }) {
    return _then(_$BookingUserConsultationStateImpl(
      doctorInfo: freezed == doctorInfo
          ? _value.doctorInfo
          : doctorInfo // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
      bookingSlotInfo: freezed == bookingSlotInfo
          ? _value.bookingSlotInfo
          : bookingSlotInfo // ignore: cast_nullable_to_non_nullable
              as BookingSlotInfo?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      selectedBookingUser: freezed == selectedBookingUser
          ? _value.selectedBookingUser
          : selectedBookingUser // ignore: cast_nullable_to_non_nullable
              as BookingUserModel?,
      sessionSelectedInfo: freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
      bookingUsers: null == bookingUsers
          ? _value._bookingUsers
          : bookingUsers // ignore: cast_nullable_to_non_nullable
              as List<BookingUserModel?>,
    ));
  }
}

/// @nodoc

class _$BookingUserConsultationStateImpl
    implements _BookingUserConsultationState {
  const _$BookingUserConsultationStateImpl(
      {required this.doctorInfo,
      required this.bookingSlotInfo,
      required this.loadingState,
      required this.selectedBookingUser,
      this.sessionSelectedInfo,
      required final List<BookingUserModel?> bookingUsers})
      : _bookingUsers = bookingUsers;

  @override
  final DoctorModel? doctorInfo;
  @override
  final BookingSlotInfo? bookingSlotInfo;
  @override
  final LoadingState loadingState;
  @override
  final BookingUserModel? selectedBookingUser;
  @override
  final SessionSelectedInfo? sessionSelectedInfo;
  final List<BookingUserModel?> _bookingUsers;
  @override
  List<BookingUserModel?> get bookingUsers {
    if (_bookingUsers is EqualUnmodifiableListView) return _bookingUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookingUsers);
  }

  @override
  String toString() {
    return 'BookingUserConsultationState(doctorInfo: $doctorInfo, bookingSlotInfo: $bookingSlotInfo, loadingState: $loadingState, selectedBookingUser: $selectedBookingUser, sessionSelectedInfo: $sessionSelectedInfo, bookingUsers: $bookingUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingUserConsultationStateImpl &&
            (identical(other.doctorInfo, doctorInfo) ||
                other.doctorInfo == doctorInfo) &&
            (identical(other.bookingSlotInfo, bookingSlotInfo) ||
                other.bookingSlotInfo == bookingSlotInfo) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.selectedBookingUser, selectedBookingUser) ||
                other.selectedBookingUser == selectedBookingUser) &&
            (identical(other.sessionSelectedInfo, sessionSelectedInfo) ||
                other.sessionSelectedInfo == sessionSelectedInfo) &&
            const DeepCollectionEquality()
                .equals(other._bookingUsers, _bookingUsers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      doctorInfo,
      bookingSlotInfo,
      loadingState,
      selectedBookingUser,
      sessionSelectedInfo,
      const DeepCollectionEquality().hash(_bookingUsers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingUserConsultationStateImplCopyWith<
          _$BookingUserConsultationStateImpl>
      get copyWith => __$$BookingUserConsultationStateImplCopyWithImpl<
          _$BookingUserConsultationStateImpl>(this, _$identity);
}

abstract class _BookingUserConsultationState
    implements BookingUserConsultationState {
  const factory _BookingUserConsultationState(
          {required final DoctorModel? doctorInfo,
          required final BookingSlotInfo? bookingSlotInfo,
          required final LoadingState loadingState,
          required final BookingUserModel? selectedBookingUser,
          final SessionSelectedInfo? sessionSelectedInfo,
          required final List<BookingUserModel?> bookingUsers}) =
      _$BookingUserConsultationStateImpl;

  @override
  DoctorModel? get doctorInfo;
  @override
  BookingSlotInfo? get bookingSlotInfo;
  @override
  LoadingState get loadingState;
  @override
  BookingUserModel? get selectedBookingUser;
  @override
  SessionSelectedInfo? get sessionSelectedInfo;
  @override
  List<BookingUserModel?> get bookingUsers;
  @override
  @JsonKey(ignore: true)
  _$$BookingUserConsultationStateImplCopyWith<
          _$BookingUserConsultationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
