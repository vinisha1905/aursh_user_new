// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_user_therapy_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingUserTherapyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo therapyBookingInfo) initialize,
    required TResult Function() getBookingUsers,
    required TResult Function(BookingUserModel bookingUser) selectBookingUser,
    required TResult Function(BookingUserModel bookingUser) addBookingUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo therapyBookingInfo)? initialize,
    TResult? Function()? getBookingUsers,
    TResult? Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult? Function(BookingUserModel bookingUser)? addBookingUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo therapyBookingInfo)? initialize,
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
abstract class $BookingUserTherapyEventCopyWith<$Res> {
  factory $BookingUserTherapyEventCopyWith(BookingUserTherapyEvent value,
          $Res Function(BookingUserTherapyEvent) then) =
      _$BookingUserTherapyEventCopyWithImpl<$Res, BookingUserTherapyEvent>;
}

/// @nodoc
class _$BookingUserTherapyEventCopyWithImpl<$Res,
        $Val extends BookingUserTherapyEvent>
    implements $BookingUserTherapyEventCopyWith<$Res> {
  _$BookingUserTherapyEventCopyWithImpl(this._value, this._then);

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
  $Res call({TherapyBookingInfo therapyBookingInfo});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$BookingUserTherapyEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? therapyBookingInfo = null,
  }) {
    return _then(_$InitializeImpl(
      null == therapyBookingInfo
          ? _value.therapyBookingInfo
          : therapyBookingInfo // ignore: cast_nullable_to_non_nullable
              as TherapyBookingInfo,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.therapyBookingInfo);

  @override
  final TherapyBookingInfo therapyBookingInfo;

  @override
  String toString() {
    return 'BookingUserTherapyEvent.initialize(therapyBookingInfo: $therapyBookingInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.therapyBookingInfo, therapyBookingInfo) ||
                other.therapyBookingInfo == therapyBookingInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, therapyBookingInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo therapyBookingInfo) initialize,
    required TResult Function() getBookingUsers,
    required TResult Function(BookingUserModel bookingUser) selectBookingUser,
    required TResult Function(BookingUserModel bookingUser) addBookingUser,
  }) {
    return initialize(therapyBookingInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo therapyBookingInfo)? initialize,
    TResult? Function()? getBookingUsers,
    TResult? Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult? Function(BookingUserModel bookingUser)? addBookingUser,
  }) {
    return initialize?.call(therapyBookingInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo therapyBookingInfo)? initialize,
    TResult Function()? getBookingUsers,
    TResult Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult Function(BookingUserModel bookingUser)? addBookingUser,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(therapyBookingInfo);
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

abstract class _Initialize implements BookingUserTherapyEvent {
  const factory _Initialize(final TherapyBookingInfo therapyBookingInfo) =
      _$InitializeImpl;

  TherapyBookingInfo get therapyBookingInfo;
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
    extends _$BookingUserTherapyEventCopyWithImpl<$Res, _$GetBookingUsersImpl>
    implements _$$GetBookingUsersImplCopyWith<$Res> {
  __$$GetBookingUsersImplCopyWithImpl(
      _$GetBookingUsersImpl _value, $Res Function(_$GetBookingUsersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetBookingUsersImpl implements _GetBookingUsers {
  const _$GetBookingUsersImpl();

  @override
  String toString() {
    return 'BookingUserTherapyEvent.getBookingUsers()';
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
    required TResult Function(TherapyBookingInfo therapyBookingInfo) initialize,
    required TResult Function() getBookingUsers,
    required TResult Function(BookingUserModel bookingUser) selectBookingUser,
    required TResult Function(BookingUserModel bookingUser) addBookingUser,
  }) {
    return getBookingUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo therapyBookingInfo)? initialize,
    TResult? Function()? getBookingUsers,
    TResult? Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult? Function(BookingUserModel bookingUser)? addBookingUser,
  }) {
    return getBookingUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo therapyBookingInfo)? initialize,
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

abstract class _GetBookingUsers implements BookingUserTherapyEvent {
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
    extends _$BookingUserTherapyEventCopyWithImpl<$Res, _$SelectBookingUserImpl>
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
    return 'BookingUserTherapyEvent.selectBookingUser(bookingUser: $bookingUser)';
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
    required TResult Function(TherapyBookingInfo therapyBookingInfo) initialize,
    required TResult Function() getBookingUsers,
    required TResult Function(BookingUserModel bookingUser) selectBookingUser,
    required TResult Function(BookingUserModel bookingUser) addBookingUser,
  }) {
    return selectBookingUser(bookingUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo therapyBookingInfo)? initialize,
    TResult? Function()? getBookingUsers,
    TResult? Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult? Function(BookingUserModel bookingUser)? addBookingUser,
  }) {
    return selectBookingUser?.call(bookingUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo therapyBookingInfo)? initialize,
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

abstract class _SelectBookingUser implements BookingUserTherapyEvent {
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
    extends _$BookingUserTherapyEventCopyWithImpl<$Res, _$AddBookingUserImpl>
    implements _$$AddBookingUserImplCopyWith<$Res> {
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
    return 'BookingUserTherapyEvent.addBookingUser(bookingUser: $bookingUser)';
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
    required TResult Function(TherapyBookingInfo therapyBookingInfo) initialize,
    required TResult Function() getBookingUsers,
    required TResult Function(BookingUserModel bookingUser) selectBookingUser,
    required TResult Function(BookingUserModel bookingUser) addBookingUser,
  }) {
    return addBookingUser(bookingUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo therapyBookingInfo)? initialize,
    TResult? Function()? getBookingUsers,
    TResult? Function(BookingUserModel bookingUser)? selectBookingUser,
    TResult? Function(BookingUserModel bookingUser)? addBookingUser,
  }) {
    return addBookingUser?.call(bookingUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo therapyBookingInfo)? initialize,
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

abstract class _AddBookingUser implements BookingUserTherapyEvent {
  const factory _AddBookingUser(final BookingUserModel bookingUser) =
      _$AddBookingUserImpl;

  BookingUserModel get bookingUser;
  @JsonKey(ignore: true)
  _$$AddBookingUserImplCopyWith<_$AddBookingUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookingUserTherapyState {
  TherapyBookingInfo? get therapyBookingInfo =>
      throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  BookingUserModel? get selectedBookingUser =>
      throw _privateConstructorUsedError;
  List<BookingUserModel?> get bookingUsers =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingUserTherapyStateCopyWith<BookingUserTherapyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingUserTherapyStateCopyWith<$Res> {
  factory $BookingUserTherapyStateCopyWith(BookingUserTherapyState value,
          $Res Function(BookingUserTherapyState) then) =
      _$BookingUserTherapyStateCopyWithImpl<$Res, BookingUserTherapyState>;
  @useResult
  $Res call(
      {TherapyBookingInfo? therapyBookingInfo,
      LoadingState loadingState,
      BookingUserModel? selectedBookingUser,
      List<BookingUserModel?> bookingUsers});
}

/// @nodoc
class _$BookingUserTherapyStateCopyWithImpl<$Res,
        $Val extends BookingUserTherapyState>
    implements $BookingUserTherapyStateCopyWith<$Res> {
  _$BookingUserTherapyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? therapyBookingInfo = freezed,
    Object? loadingState = null,
    Object? selectedBookingUser = freezed,
    Object? bookingUsers = null,
  }) {
    return _then(_value.copyWith(
      therapyBookingInfo: freezed == therapyBookingInfo
          ? _value.therapyBookingInfo
          : therapyBookingInfo // ignore: cast_nullable_to_non_nullable
              as TherapyBookingInfo?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      selectedBookingUser: freezed == selectedBookingUser
          ? _value.selectedBookingUser
          : selectedBookingUser // ignore: cast_nullable_to_non_nullable
              as BookingUserModel?,
      bookingUsers: null == bookingUsers
          ? _value.bookingUsers
          : bookingUsers // ignore: cast_nullable_to_non_nullable
              as List<BookingUserModel?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingUserTherapyStateImplCopyWith<$Res>
    implements $BookingUserTherapyStateCopyWith<$Res> {
  factory _$$BookingUserTherapyStateImplCopyWith(
          _$BookingUserTherapyStateImpl value,
          $Res Function(_$BookingUserTherapyStateImpl) then) =
      __$$BookingUserTherapyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TherapyBookingInfo? therapyBookingInfo,
      LoadingState loadingState,
      BookingUserModel? selectedBookingUser,
      List<BookingUserModel?> bookingUsers});
}

/// @nodoc
class __$$BookingUserTherapyStateImplCopyWithImpl<$Res>
    extends _$BookingUserTherapyStateCopyWithImpl<$Res,
        _$BookingUserTherapyStateImpl>
    implements _$$BookingUserTherapyStateImplCopyWith<$Res> {
  __$$BookingUserTherapyStateImplCopyWithImpl(
      _$BookingUserTherapyStateImpl _value,
      $Res Function(_$BookingUserTherapyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? therapyBookingInfo = freezed,
    Object? loadingState = null,
    Object? selectedBookingUser = freezed,
    Object? bookingUsers = null,
  }) {
    return _then(_$BookingUserTherapyStateImpl(
      therapyBookingInfo: freezed == therapyBookingInfo
          ? _value.therapyBookingInfo
          : therapyBookingInfo // ignore: cast_nullable_to_non_nullable
              as TherapyBookingInfo?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      selectedBookingUser: freezed == selectedBookingUser
          ? _value.selectedBookingUser
          : selectedBookingUser // ignore: cast_nullable_to_non_nullable
              as BookingUserModel?,
      bookingUsers: null == bookingUsers
          ? _value._bookingUsers
          : bookingUsers // ignore: cast_nullable_to_non_nullable
              as List<BookingUserModel?>,
    ));
  }
}

/// @nodoc

class _$BookingUserTherapyStateImpl implements _BookingUserTherapyState {
  const _$BookingUserTherapyStateImpl(
      {required this.therapyBookingInfo,
      required this.loadingState,
      required this.selectedBookingUser,
      required final List<BookingUserModel?> bookingUsers})
      : _bookingUsers = bookingUsers;

  @override
  final TherapyBookingInfo? therapyBookingInfo;
  @override
  final LoadingState loadingState;
  @override
  final BookingUserModel? selectedBookingUser;
  final List<BookingUserModel?> _bookingUsers;
  @override
  List<BookingUserModel?> get bookingUsers {
    if (_bookingUsers is EqualUnmodifiableListView) return _bookingUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookingUsers);
  }

  @override
  String toString() {
    return 'BookingUserTherapyState(therapyBookingInfo: $therapyBookingInfo, loadingState: $loadingState, selectedBookingUser: $selectedBookingUser, bookingUsers: $bookingUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingUserTherapyStateImpl &&
            (identical(other.therapyBookingInfo, therapyBookingInfo) ||
                other.therapyBookingInfo == therapyBookingInfo) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.selectedBookingUser, selectedBookingUser) ||
                other.selectedBookingUser == selectedBookingUser) &&
            const DeepCollectionEquality()
                .equals(other._bookingUsers, _bookingUsers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, therapyBookingInfo, loadingState,
      selectedBookingUser, const DeepCollectionEquality().hash(_bookingUsers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingUserTherapyStateImplCopyWith<_$BookingUserTherapyStateImpl>
      get copyWith => __$$BookingUserTherapyStateImplCopyWithImpl<
          _$BookingUserTherapyStateImpl>(this, _$identity);
}

abstract class _BookingUserTherapyState implements BookingUserTherapyState {
  const factory _BookingUserTherapyState(
          {required final TherapyBookingInfo? therapyBookingInfo,
          required final LoadingState loadingState,
          required final BookingUserModel? selectedBookingUser,
          required final List<BookingUserModel?> bookingUsers}) =
      _$BookingUserTherapyStateImpl;

  @override
  TherapyBookingInfo? get therapyBookingInfo;
  @override
  LoadingState get loadingState;
  @override
  BookingUserModel? get selectedBookingUser;
  @override
  List<BookingUserModel?> get bookingUsers;
  @override
  @JsonKey(ignore: true)
  _$$BookingUserTherapyStateImplCopyWith<_$BookingUserTherapyStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
