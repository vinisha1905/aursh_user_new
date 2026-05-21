// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConsultationCheckoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() createOrder,
    required TResult Function(
            String razorpayPaymentId, String razorpaySignature)
        checkoutOrder,
    required TResult Function() resetError,
    required TResult Function(bool isConsumed) consumeOrderId,
    required TResult Function(Map<String, dynamic> data) trackPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? createOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature)?
        checkoutOrder,
    TResult? Function()? resetError,
    TResult? Function(bool isConsumed)? consumeOrderId,
    TResult? Function(Map<String, dynamic> data)? trackPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? createOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature)?
        checkoutOrder,
    TResult Function()? resetError,
    TResult Function(bool isConsumed)? consumeOrderId,
    TResult Function(Map<String, dynamic> data)? trackPayment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CheckoutOrder value) checkoutOrder,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_ConsumeOrderId value) consumeOrderId,
    required TResult Function(_TrackPayment value) trackPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CheckoutOrder value)? checkoutOrder,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_ConsumeOrderId value)? consumeOrderId,
    TResult? Function(_TrackPayment value)? trackPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CheckoutOrder value)? checkoutOrder,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_ConsumeOrderId value)? consumeOrderId,
    TResult Function(_TrackPayment value)? trackPayment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationCheckoutEventCopyWith<$Res> {
  factory $ConsultationCheckoutEventCopyWith(ConsultationCheckoutEvent value,
          $Res Function(ConsultationCheckoutEvent) then) =
      _$ConsultationCheckoutEventCopyWithImpl<$Res, ConsultationCheckoutEvent>;
}

/// @nodoc
class _$ConsultationCheckoutEventCopyWithImpl<$Res,
        $Val extends ConsultationCheckoutEvent>
    implements $ConsultationCheckoutEventCopyWith<$Res> {
  _$ConsultationCheckoutEventCopyWithImpl(this._value, this._then);

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
      BookingUserModel bookingUser,
      SessionSelectedInfo? sessionSelectedInfo});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$ConsultationCheckoutEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorInfo = null,
    Object? bookingSlotInfo = null,
    Object? bookingUser = null,
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
      null == bookingUser
          ? _value.bookingUser
          : bookingUser // ignore: cast_nullable_to_non_nullable
              as BookingUserModel,
      freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.doctorInfo, this.bookingSlotInfo,
      this.bookingUser, this.sessionSelectedInfo);

  @override
  final DoctorModel doctorInfo;
  @override
  final BookingSlotInfo bookingSlotInfo;
  @override
  final BookingUserModel bookingUser;
  @override
  final SessionSelectedInfo? sessionSelectedInfo;

  @override
  String toString() {
    return 'ConsultationCheckoutEvent.initialize(doctorInfo: $doctorInfo, bookingSlotInfo: $bookingSlotInfo, bookingUser: $bookingUser, sessionSelectedInfo: $sessionSelectedInfo)';
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
            (identical(other.bookingUser, bookingUser) ||
                other.bookingUser == bookingUser) &&
            (identical(other.sessionSelectedInfo, sessionSelectedInfo) ||
                other.sessionSelectedInfo == sessionSelectedInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, doctorInfo, bookingSlotInfo,
      bookingUser, sessionSelectedInfo);

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
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() createOrder,
    required TResult Function(
            String razorpayPaymentId, String razorpaySignature)
        checkoutOrder,
    required TResult Function() resetError,
    required TResult Function(bool isConsumed) consumeOrderId,
    required TResult Function(Map<String, dynamic> data) trackPayment,
  }) {
    return initialize(
        doctorInfo, bookingSlotInfo, bookingUser, sessionSelectedInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? createOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature)?
        checkoutOrder,
    TResult? Function()? resetError,
    TResult? Function(bool isConsumed)? consumeOrderId,
    TResult? Function(Map<String, dynamic> data)? trackPayment,
  }) {
    return initialize?.call(
        doctorInfo, bookingSlotInfo, bookingUser, sessionSelectedInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? createOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature)?
        checkoutOrder,
    TResult Function()? resetError,
    TResult Function(bool isConsumed)? consumeOrderId,
    TResult Function(Map<String, dynamic> data)? trackPayment,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(
          doctorInfo, bookingSlotInfo, bookingUser, sessionSelectedInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CheckoutOrder value) checkoutOrder,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_ConsumeOrderId value) consumeOrderId,
    required TResult Function(_TrackPayment value) trackPayment,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CheckoutOrder value)? checkoutOrder,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_ConsumeOrderId value)? consumeOrderId,
    TResult? Function(_TrackPayment value)? trackPayment,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CheckoutOrder value)? checkoutOrder,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_ConsumeOrderId value)? consumeOrderId,
    TResult Function(_TrackPayment value)? trackPayment,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ConsultationCheckoutEvent {
  const factory _Initialize(
      final DoctorModel doctorInfo,
      final BookingSlotInfo bookingSlotInfo,
      final BookingUserModel bookingUser,
      final SessionSelectedInfo? sessionSelectedInfo) = _$InitializeImpl;

  DoctorModel get doctorInfo;
  BookingSlotInfo get bookingSlotInfo;
  BookingUserModel get bookingUser;
  SessionSelectedInfo? get sessionSelectedInfo;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateOrderImplCopyWith<$Res> {
  factory _$$CreateOrderImplCopyWith(
          _$CreateOrderImpl value, $Res Function(_$CreateOrderImpl) then) =
      __$$CreateOrderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateOrderImplCopyWithImpl<$Res>
    extends _$ConsultationCheckoutEventCopyWithImpl<$Res, _$CreateOrderImpl>
    implements _$$CreateOrderImplCopyWith<$Res> {
  __$$CreateOrderImplCopyWithImpl(
      _$CreateOrderImpl _value, $Res Function(_$CreateOrderImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateOrderImpl implements _CreateOrder {
  const _$CreateOrderImpl();

  @override
  String toString() {
    return 'ConsultationCheckoutEvent.createOrder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateOrderImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() createOrder,
    required TResult Function(
            String razorpayPaymentId, String razorpaySignature)
        checkoutOrder,
    required TResult Function() resetError,
    required TResult Function(bool isConsumed) consumeOrderId,
    required TResult Function(Map<String, dynamic> data) trackPayment,
  }) {
    return createOrder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? createOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature)?
        checkoutOrder,
    TResult? Function()? resetError,
    TResult? Function(bool isConsumed)? consumeOrderId,
    TResult? Function(Map<String, dynamic> data)? trackPayment,
  }) {
    return createOrder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? createOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature)?
        checkoutOrder,
    TResult Function()? resetError,
    TResult Function(bool isConsumed)? consumeOrderId,
    TResult Function(Map<String, dynamic> data)? trackPayment,
    required TResult orElse(),
  }) {
    if (createOrder != null) {
      return createOrder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CheckoutOrder value) checkoutOrder,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_ConsumeOrderId value) consumeOrderId,
    required TResult Function(_TrackPayment value) trackPayment,
  }) {
    return createOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CheckoutOrder value)? checkoutOrder,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_ConsumeOrderId value)? consumeOrderId,
    TResult? Function(_TrackPayment value)? trackPayment,
  }) {
    return createOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CheckoutOrder value)? checkoutOrder,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_ConsumeOrderId value)? consumeOrderId,
    TResult Function(_TrackPayment value)? trackPayment,
    required TResult orElse(),
  }) {
    if (createOrder != null) {
      return createOrder(this);
    }
    return orElse();
  }
}

abstract class _CreateOrder implements ConsultationCheckoutEvent {
  const factory _CreateOrder() = _$CreateOrderImpl;
}

/// @nodoc
abstract class _$$CheckoutOrderImplCopyWith<$Res> {
  factory _$$CheckoutOrderImplCopyWith(
          _$CheckoutOrderImpl value, $Res Function(_$CheckoutOrderImpl) then) =
      __$$CheckoutOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String razorpayPaymentId, String razorpaySignature});
}

/// @nodoc
class __$$CheckoutOrderImplCopyWithImpl<$Res>
    extends _$ConsultationCheckoutEventCopyWithImpl<$Res, _$CheckoutOrderImpl>
    implements _$$CheckoutOrderImplCopyWith<$Res> {
  __$$CheckoutOrderImplCopyWithImpl(
      _$CheckoutOrderImpl _value, $Res Function(_$CheckoutOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? razorpayPaymentId = null,
    Object? razorpaySignature = null,
  }) {
    return _then(_$CheckoutOrderImpl(
      null == razorpayPaymentId
          ? _value.razorpayPaymentId
          : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
              as String,
      null == razorpaySignature
          ? _value.razorpaySignature
          : razorpaySignature // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckoutOrderImpl implements _CheckoutOrder {
  const _$CheckoutOrderImpl(this.razorpayPaymentId, this.razorpaySignature);

  @override
  final String razorpayPaymentId;
  @override
  final String razorpaySignature;

  @override
  String toString() {
    return 'ConsultationCheckoutEvent.checkoutOrder(razorpayPaymentId: $razorpayPaymentId, razorpaySignature: $razorpaySignature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutOrderImpl &&
            (identical(other.razorpayPaymentId, razorpayPaymentId) ||
                other.razorpayPaymentId == razorpayPaymentId) &&
            (identical(other.razorpaySignature, razorpaySignature) ||
                other.razorpaySignature == razorpaySignature));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, razorpayPaymentId, razorpaySignature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutOrderImplCopyWith<_$CheckoutOrderImpl> get copyWith =>
      __$$CheckoutOrderImplCopyWithImpl<_$CheckoutOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() createOrder,
    required TResult Function(
            String razorpayPaymentId, String razorpaySignature)
        checkoutOrder,
    required TResult Function() resetError,
    required TResult Function(bool isConsumed) consumeOrderId,
    required TResult Function(Map<String, dynamic> data) trackPayment,
  }) {
    return checkoutOrder(razorpayPaymentId, razorpaySignature);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? createOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature)?
        checkoutOrder,
    TResult? Function()? resetError,
    TResult? Function(bool isConsumed)? consumeOrderId,
    TResult? Function(Map<String, dynamic> data)? trackPayment,
  }) {
    return checkoutOrder?.call(razorpayPaymentId, razorpaySignature);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? createOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature)?
        checkoutOrder,
    TResult Function()? resetError,
    TResult Function(bool isConsumed)? consumeOrderId,
    TResult Function(Map<String, dynamic> data)? trackPayment,
    required TResult orElse(),
  }) {
    if (checkoutOrder != null) {
      return checkoutOrder(razorpayPaymentId, razorpaySignature);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CheckoutOrder value) checkoutOrder,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_ConsumeOrderId value) consumeOrderId,
    required TResult Function(_TrackPayment value) trackPayment,
  }) {
    return checkoutOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CheckoutOrder value)? checkoutOrder,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_ConsumeOrderId value)? consumeOrderId,
    TResult? Function(_TrackPayment value)? trackPayment,
  }) {
    return checkoutOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CheckoutOrder value)? checkoutOrder,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_ConsumeOrderId value)? consumeOrderId,
    TResult Function(_TrackPayment value)? trackPayment,
    required TResult orElse(),
  }) {
    if (checkoutOrder != null) {
      return checkoutOrder(this);
    }
    return orElse();
  }
}

abstract class _CheckoutOrder implements ConsultationCheckoutEvent {
  const factory _CheckoutOrder(
          final String razorpayPaymentId, final String razorpaySignature) =
      _$CheckoutOrderImpl;

  String get razorpayPaymentId;
  String get razorpaySignature;
  @JsonKey(ignore: true)
  _$$CheckoutOrderImplCopyWith<_$CheckoutOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetErrorImplCopyWith<$Res> {
  factory _$$ResetErrorImplCopyWith(
          _$ResetErrorImpl value, $Res Function(_$ResetErrorImpl) then) =
      __$$ResetErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetErrorImplCopyWithImpl<$Res>
    extends _$ConsultationCheckoutEventCopyWithImpl<$Res, _$ResetErrorImpl>
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
    return 'ConsultationCheckoutEvent.resetError()';
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
    required TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() createOrder,
    required TResult Function(
            String razorpayPaymentId, String razorpaySignature)
        checkoutOrder,
    required TResult Function() resetError,
    required TResult Function(bool isConsumed) consumeOrderId,
    required TResult Function(Map<String, dynamic> data) trackPayment,
  }) {
    return resetError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? createOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature)?
        checkoutOrder,
    TResult? Function()? resetError,
    TResult? Function(bool isConsumed)? consumeOrderId,
    TResult? Function(Map<String, dynamic> data)? trackPayment,
  }) {
    return resetError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? createOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature)?
        checkoutOrder,
    TResult Function()? resetError,
    TResult Function(bool isConsumed)? consumeOrderId,
    TResult Function(Map<String, dynamic> data)? trackPayment,
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
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CheckoutOrder value) checkoutOrder,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_ConsumeOrderId value) consumeOrderId,
    required TResult Function(_TrackPayment value) trackPayment,
  }) {
    return resetError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CheckoutOrder value)? checkoutOrder,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_ConsumeOrderId value)? consumeOrderId,
    TResult? Function(_TrackPayment value)? trackPayment,
  }) {
    return resetError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CheckoutOrder value)? checkoutOrder,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_ConsumeOrderId value)? consumeOrderId,
    TResult Function(_TrackPayment value)? trackPayment,
    required TResult orElse(),
  }) {
    if (resetError != null) {
      return resetError(this);
    }
    return orElse();
  }
}

abstract class _ResetError implements ConsultationCheckoutEvent {
  const factory _ResetError() = _$ResetErrorImpl;
}

/// @nodoc
abstract class _$$ConsumeOrderIdImplCopyWith<$Res> {
  factory _$$ConsumeOrderIdImplCopyWith(_$ConsumeOrderIdImpl value,
          $Res Function(_$ConsumeOrderIdImpl) then) =
      __$$ConsumeOrderIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isConsumed});
}

/// @nodoc
class __$$ConsumeOrderIdImplCopyWithImpl<$Res>
    extends _$ConsultationCheckoutEventCopyWithImpl<$Res, _$ConsumeOrderIdImpl>
    implements _$$ConsumeOrderIdImplCopyWith<$Res> {
  __$$ConsumeOrderIdImplCopyWithImpl(
      _$ConsumeOrderIdImpl _value, $Res Function(_$ConsumeOrderIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConsumed = null,
  }) {
    return _then(_$ConsumeOrderIdImpl(
      null == isConsumed
          ? _value.isConsumed
          : isConsumed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ConsumeOrderIdImpl implements _ConsumeOrderId {
  const _$ConsumeOrderIdImpl(this.isConsumed);

  @override
  final bool isConsumed;

  @override
  String toString() {
    return 'ConsultationCheckoutEvent.consumeOrderId(isConsumed: $isConsumed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsumeOrderIdImpl &&
            (identical(other.isConsumed, isConsumed) ||
                other.isConsumed == isConsumed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConsumed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsumeOrderIdImplCopyWith<_$ConsumeOrderIdImpl> get copyWith =>
      __$$ConsumeOrderIdImplCopyWithImpl<_$ConsumeOrderIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() createOrder,
    required TResult Function(
            String razorpayPaymentId, String razorpaySignature)
        checkoutOrder,
    required TResult Function() resetError,
    required TResult Function(bool isConsumed) consumeOrderId,
    required TResult Function(Map<String, dynamic> data) trackPayment,
  }) {
    return consumeOrderId(isConsumed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? createOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature)?
        checkoutOrder,
    TResult? Function()? resetError,
    TResult? Function(bool isConsumed)? consumeOrderId,
    TResult? Function(Map<String, dynamic> data)? trackPayment,
  }) {
    return consumeOrderId?.call(isConsumed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? createOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature)?
        checkoutOrder,
    TResult Function()? resetError,
    TResult Function(bool isConsumed)? consumeOrderId,
    TResult Function(Map<String, dynamic> data)? trackPayment,
    required TResult orElse(),
  }) {
    if (consumeOrderId != null) {
      return consumeOrderId(isConsumed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CheckoutOrder value) checkoutOrder,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_ConsumeOrderId value) consumeOrderId,
    required TResult Function(_TrackPayment value) trackPayment,
  }) {
    return consumeOrderId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CheckoutOrder value)? checkoutOrder,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_ConsumeOrderId value)? consumeOrderId,
    TResult? Function(_TrackPayment value)? trackPayment,
  }) {
    return consumeOrderId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CheckoutOrder value)? checkoutOrder,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_ConsumeOrderId value)? consumeOrderId,
    TResult Function(_TrackPayment value)? trackPayment,
    required TResult orElse(),
  }) {
    if (consumeOrderId != null) {
      return consumeOrderId(this);
    }
    return orElse();
  }
}

abstract class _ConsumeOrderId implements ConsultationCheckoutEvent {
  const factory _ConsumeOrderId(final bool isConsumed) = _$ConsumeOrderIdImpl;

  bool get isConsumed;
  @JsonKey(ignore: true)
  _$$ConsumeOrderIdImplCopyWith<_$ConsumeOrderIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrackPaymentImplCopyWith<$Res> {
  factory _$$TrackPaymentImplCopyWith(
          _$TrackPaymentImpl value, $Res Function(_$TrackPaymentImpl) then) =
      __$$TrackPaymentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$TrackPaymentImplCopyWithImpl<$Res>
    extends _$ConsultationCheckoutEventCopyWithImpl<$Res, _$TrackPaymentImpl>
    implements _$$TrackPaymentImplCopyWith<$Res> {
  __$$TrackPaymentImplCopyWithImpl(
      _$TrackPaymentImpl _value, $Res Function(_$TrackPaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$TrackPaymentImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$TrackPaymentImpl implements _TrackPayment {
  const _$TrackPaymentImpl(final Map<String, dynamic> data) : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'ConsultationCheckoutEvent.trackPayment(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackPaymentImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackPaymentImplCopyWith<_$TrackPaymentImpl> get copyWith =>
      __$$TrackPaymentImplCopyWithImpl<_$TrackPaymentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)
        initialize,
    required TResult Function() createOrder,
    required TResult Function(
            String razorpayPaymentId, String razorpaySignature)
        checkoutOrder,
    required TResult Function() resetError,
    required TResult Function(bool isConsumed) consumeOrderId,
    required TResult Function(Map<String, dynamic> data) trackPayment,
  }) {
    return trackPayment(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult? Function()? createOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature)?
        checkoutOrder,
    TResult? Function()? resetError,
    TResult? Function(bool isConsumed)? consumeOrderId,
    TResult? Function(Map<String, dynamic> data)? trackPayment,
  }) {
    return trackPayment?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DoctorModel doctorInfo,
            BookingSlotInfo bookingSlotInfo,
            BookingUserModel bookingUser,
            SessionSelectedInfo? sessionSelectedInfo)?
        initialize,
    TResult Function()? createOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature)?
        checkoutOrder,
    TResult Function()? resetError,
    TResult Function(bool isConsumed)? consumeOrderId,
    TResult Function(Map<String, dynamic> data)? trackPayment,
    required TResult orElse(),
  }) {
    if (trackPayment != null) {
      return trackPayment(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CheckoutOrder value) checkoutOrder,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_ConsumeOrderId value) consumeOrderId,
    required TResult Function(_TrackPayment value) trackPayment,
  }) {
    return trackPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CheckoutOrder value)? checkoutOrder,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_ConsumeOrderId value)? consumeOrderId,
    TResult? Function(_TrackPayment value)? trackPayment,
  }) {
    return trackPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CheckoutOrder value)? checkoutOrder,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_ConsumeOrderId value)? consumeOrderId,
    TResult Function(_TrackPayment value)? trackPayment,
    required TResult orElse(),
  }) {
    if (trackPayment != null) {
      return trackPayment(this);
    }
    return orElse();
  }
}

abstract class _TrackPayment implements ConsultationCheckoutEvent {
  const factory _TrackPayment(final Map<String, dynamic> data) =
      _$TrackPaymentImpl;

  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$TrackPaymentImplCopyWith<_$TrackPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConsultationCheckoutState {
  DoctorModel? get doctorInfo => throw _privateConstructorUsedError;
  BookingSlotInfo? get bookingSlotInfo => throw _privateConstructorUsedError;
  BookingUserModel? get bookingUser => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  SessionSelectedInfo? get sessionSelectedInfo =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isConsumedOrderId => throw _privateConstructorUsedError;
  String? get razorpayPaymentId => throw _privateConstructorUsedError;
  String? get razorpaySignature => throw _privateConstructorUsedError;
  bool get bookingCompleted => throw _privateConstructorUsedError;
  ConsultationCreateOrderModel? get createOrderResult =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConsultationCheckoutStateCopyWith<ConsultationCheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationCheckoutStateCopyWith<$Res> {
  factory $ConsultationCheckoutStateCopyWith(ConsultationCheckoutState value,
          $Res Function(ConsultationCheckoutState) then) =
      _$ConsultationCheckoutStateCopyWithImpl<$Res, ConsultationCheckoutState>;
  @useResult
  $Res call(
      {DoctorModel? doctorInfo,
      BookingSlotInfo? bookingSlotInfo,
      BookingUserModel? bookingUser,
      LoadingState loadingState,
      SessionSelectedInfo? sessionSelectedInfo,
      String? errorMessage,
      bool isConsumedOrderId,
      String? razorpayPaymentId,
      String? razorpaySignature,
      bool bookingCompleted,
      ConsultationCreateOrderModel? createOrderResult});
}

/// @nodoc
class _$ConsultationCheckoutStateCopyWithImpl<$Res,
        $Val extends ConsultationCheckoutState>
    implements $ConsultationCheckoutStateCopyWith<$Res> {
  _$ConsultationCheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorInfo = freezed,
    Object? bookingSlotInfo = freezed,
    Object? bookingUser = freezed,
    Object? loadingState = null,
    Object? sessionSelectedInfo = freezed,
    Object? errorMessage = freezed,
    Object? isConsumedOrderId = null,
    Object? razorpayPaymentId = freezed,
    Object? razorpaySignature = freezed,
    Object? bookingCompleted = null,
    Object? createOrderResult = freezed,
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
      bookingUser: freezed == bookingUser
          ? _value.bookingUser
          : bookingUser // ignore: cast_nullable_to_non_nullable
              as BookingUserModel?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      sessionSelectedInfo: freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isConsumedOrderId: null == isConsumedOrderId
          ? _value.isConsumedOrderId
          : isConsumedOrderId // ignore: cast_nullable_to_non_nullable
              as bool,
      razorpayPaymentId: freezed == razorpayPaymentId
          ? _value.razorpayPaymentId
          : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      razorpaySignature: freezed == razorpaySignature
          ? _value.razorpaySignature
          : razorpaySignature // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingCompleted: null == bookingCompleted
          ? _value.bookingCompleted
          : bookingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createOrderResult: freezed == createOrderResult
          ? _value.createOrderResult
          : createOrderResult // ignore: cast_nullable_to_non_nullable
              as ConsultationCreateOrderModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsultationCheckoutStateImplCopyWith<$Res>
    implements $ConsultationCheckoutStateCopyWith<$Res> {
  factory _$$ConsultationCheckoutStateImplCopyWith(
          _$ConsultationCheckoutStateImpl value,
          $Res Function(_$ConsultationCheckoutStateImpl) then) =
      __$$ConsultationCheckoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DoctorModel? doctorInfo,
      BookingSlotInfo? bookingSlotInfo,
      BookingUserModel? bookingUser,
      LoadingState loadingState,
      SessionSelectedInfo? sessionSelectedInfo,
      String? errorMessage,
      bool isConsumedOrderId,
      String? razorpayPaymentId,
      String? razorpaySignature,
      bool bookingCompleted,
      ConsultationCreateOrderModel? createOrderResult});
}

/// @nodoc
class __$$ConsultationCheckoutStateImplCopyWithImpl<$Res>
    extends _$ConsultationCheckoutStateCopyWithImpl<$Res,
        _$ConsultationCheckoutStateImpl>
    implements _$$ConsultationCheckoutStateImplCopyWith<$Res> {
  __$$ConsultationCheckoutStateImplCopyWithImpl(
      _$ConsultationCheckoutStateImpl _value,
      $Res Function(_$ConsultationCheckoutStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorInfo = freezed,
    Object? bookingSlotInfo = freezed,
    Object? bookingUser = freezed,
    Object? loadingState = null,
    Object? sessionSelectedInfo = freezed,
    Object? errorMessage = freezed,
    Object? isConsumedOrderId = null,
    Object? razorpayPaymentId = freezed,
    Object? razorpaySignature = freezed,
    Object? bookingCompleted = null,
    Object? createOrderResult = freezed,
  }) {
    return _then(_$ConsultationCheckoutStateImpl(
      doctorInfo: freezed == doctorInfo
          ? _value.doctorInfo
          : doctorInfo // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
      bookingSlotInfo: freezed == bookingSlotInfo
          ? _value.bookingSlotInfo
          : bookingSlotInfo // ignore: cast_nullable_to_non_nullable
              as BookingSlotInfo?,
      bookingUser: freezed == bookingUser
          ? _value.bookingUser
          : bookingUser // ignore: cast_nullable_to_non_nullable
              as BookingUserModel?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      sessionSelectedInfo: freezed == sessionSelectedInfo
          ? _value.sessionSelectedInfo
          : sessionSelectedInfo // ignore: cast_nullable_to_non_nullable
              as SessionSelectedInfo?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isConsumedOrderId: null == isConsumedOrderId
          ? _value.isConsumedOrderId
          : isConsumedOrderId // ignore: cast_nullable_to_non_nullable
              as bool,
      razorpayPaymentId: freezed == razorpayPaymentId
          ? _value.razorpayPaymentId
          : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      razorpaySignature: freezed == razorpaySignature
          ? _value.razorpaySignature
          : razorpaySignature // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingCompleted: null == bookingCompleted
          ? _value.bookingCompleted
          : bookingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createOrderResult: freezed == createOrderResult
          ? _value.createOrderResult
          : createOrderResult // ignore: cast_nullable_to_non_nullable
              as ConsultationCreateOrderModel?,
    ));
  }
}

/// @nodoc

class _$ConsultationCheckoutStateImpl implements _ConsultationCheckoutState {
  const _$ConsultationCheckoutStateImpl(
      {required this.doctorInfo,
      required this.bookingSlotInfo,
      required this.bookingUser,
      required this.loadingState,
      this.sessionSelectedInfo,
      required this.errorMessage,
      required this.isConsumedOrderId,
      required this.razorpayPaymentId,
      required this.razorpaySignature,
      required this.bookingCompleted,
      required this.createOrderResult});

  @override
  final DoctorModel? doctorInfo;
  @override
  final BookingSlotInfo? bookingSlotInfo;
  @override
  final BookingUserModel? bookingUser;
  @override
  final LoadingState loadingState;
  @override
  final SessionSelectedInfo? sessionSelectedInfo;
  @override
  final String? errorMessage;
  @override
  final bool isConsumedOrderId;
  @override
  final String? razorpayPaymentId;
  @override
  final String? razorpaySignature;
  @override
  final bool bookingCompleted;
  @override
  final ConsultationCreateOrderModel? createOrderResult;

  @override
  String toString() {
    return 'ConsultationCheckoutState(doctorInfo: $doctorInfo, bookingSlotInfo: $bookingSlotInfo, bookingUser: $bookingUser, loadingState: $loadingState, sessionSelectedInfo: $sessionSelectedInfo, errorMessage: $errorMessage, isConsumedOrderId: $isConsumedOrderId, razorpayPaymentId: $razorpayPaymentId, razorpaySignature: $razorpaySignature, bookingCompleted: $bookingCompleted, createOrderResult: $createOrderResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationCheckoutStateImpl &&
            (identical(other.doctorInfo, doctorInfo) ||
                other.doctorInfo == doctorInfo) &&
            (identical(other.bookingSlotInfo, bookingSlotInfo) ||
                other.bookingSlotInfo == bookingSlotInfo) &&
            (identical(other.bookingUser, bookingUser) ||
                other.bookingUser == bookingUser) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.sessionSelectedInfo, sessionSelectedInfo) ||
                other.sessionSelectedInfo == sessionSelectedInfo) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isConsumedOrderId, isConsumedOrderId) ||
                other.isConsumedOrderId == isConsumedOrderId) &&
            (identical(other.razorpayPaymentId, razorpayPaymentId) ||
                other.razorpayPaymentId == razorpayPaymentId) &&
            (identical(other.razorpaySignature, razorpaySignature) ||
                other.razorpaySignature == razorpaySignature) &&
            (identical(other.bookingCompleted, bookingCompleted) ||
                other.bookingCompleted == bookingCompleted) &&
            (identical(other.createOrderResult, createOrderResult) ||
                other.createOrderResult == createOrderResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      doctorInfo,
      bookingSlotInfo,
      bookingUser,
      loadingState,
      sessionSelectedInfo,
      errorMessage,
      isConsumedOrderId,
      razorpayPaymentId,
      razorpaySignature,
      bookingCompleted,
      createOrderResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationCheckoutStateImplCopyWith<_$ConsultationCheckoutStateImpl>
      get copyWith => __$$ConsultationCheckoutStateImplCopyWithImpl<
          _$ConsultationCheckoutStateImpl>(this, _$identity);
}

abstract class _ConsultationCheckoutState implements ConsultationCheckoutState {
  const factory _ConsultationCheckoutState(
          {required final DoctorModel? doctorInfo,
          required final BookingSlotInfo? bookingSlotInfo,
          required final BookingUserModel? bookingUser,
          required final LoadingState loadingState,
          final SessionSelectedInfo? sessionSelectedInfo,
          required final String? errorMessage,
          required final bool isConsumedOrderId,
          required final String? razorpayPaymentId,
          required final String? razorpaySignature,
          required final bool bookingCompleted,
          required final ConsultationCreateOrderModel? createOrderResult}) =
      _$ConsultationCheckoutStateImpl;

  @override
  DoctorModel? get doctorInfo;
  @override
  BookingSlotInfo? get bookingSlotInfo;
  @override
  BookingUserModel? get bookingUser;
  @override
  LoadingState get loadingState;
  @override
  SessionSelectedInfo? get sessionSelectedInfo;
  @override
  String? get errorMessage;
  @override
  bool get isConsumedOrderId;
  @override
  String? get razorpayPaymentId;
  @override
  String? get razorpaySignature;
  @override
  bool get bookingCompleted;
  @override
  ConsultationCreateOrderModel? get createOrderResult;
  @override
  @JsonKey(ignore: true)
  _$$ConsultationCheckoutStateImplCopyWith<_$ConsultationCheckoutStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
