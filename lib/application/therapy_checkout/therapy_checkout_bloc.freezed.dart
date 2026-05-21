// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'therapy_checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TherapyCheckoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)
        initialize,
    required TResult Function(ReferralModal? referralModal) createOrder,
    required TResult Function(ReferralModal? referralModal) createCODOrder,
    required TResult Function(String razorpayPaymentId,
            String razorpaySignature, ReferralModal? referralModal)
        checkoutOrder,
    required TResult Function() resetError,
    required TResult Function(bool isConsumed) consumeOrderId,
    required TResult Function(Map<String, dynamic> data) trackPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult? Function(ReferralModal? referralModal)? createOrder,
    TResult? Function(ReferralModal? referralModal)? createCODOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
        checkoutOrder,
    TResult? Function()? resetError,
    TResult? Function(bool isConsumed)? consumeOrderId,
    TResult? Function(Map<String, dynamic> data)? trackPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult Function(ReferralModal? referralModal)? createOrder,
    TResult Function(ReferralModal? referralModal)? createCODOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
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
    required TResult Function(_CreateCODOrder value) createCODOrder,
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
    TResult? Function(_CreateCODOrder value)? createCODOrder,
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
    TResult Function(_CreateCODOrder value)? createCODOrder,
    TResult Function(_CheckoutOrder value)? checkoutOrder,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_ConsumeOrderId value)? consumeOrderId,
    TResult Function(_TrackPayment value)? trackPayment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TherapyCheckoutEventCopyWith<$Res> {
  factory $TherapyCheckoutEventCopyWith(TherapyCheckoutEvent value,
          $Res Function(TherapyCheckoutEvent) then) =
      _$TherapyCheckoutEventCopyWithImpl<$Res, TherapyCheckoutEvent>;
}

/// @nodoc
class _$TherapyCheckoutEventCopyWithImpl<$Res,
        $Val extends TherapyCheckoutEvent>
    implements $TherapyCheckoutEventCopyWith<$Res> {
  _$TherapyCheckoutEventCopyWithImpl(this._value, this._then);

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
      {TherapyBookingInfo therapyBookingInfo,
      BookingSlotInfo bookingSlotInfo,
      AddressInfo addressInfo});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$TherapyCheckoutEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? therapyBookingInfo = null,
    Object? bookingSlotInfo = null,
    Object? addressInfo = null,
  }) {
    return _then(_$InitializeImpl(
      null == therapyBookingInfo
          ? _value.therapyBookingInfo
          : therapyBookingInfo // ignore: cast_nullable_to_non_nullable
              as TherapyBookingInfo,
      null == bookingSlotInfo
          ? _value.bookingSlotInfo
          : bookingSlotInfo // ignore: cast_nullable_to_non_nullable
              as BookingSlotInfo,
      null == addressInfo
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(
      this.therapyBookingInfo, this.bookingSlotInfo, this.addressInfo);

  @override
  final TherapyBookingInfo therapyBookingInfo;
  @override
  final BookingSlotInfo bookingSlotInfo;
  @override
  final AddressInfo addressInfo;

  @override
  String toString() {
    return 'TherapyCheckoutEvent.initialize(therapyBookingInfo: $therapyBookingInfo, bookingSlotInfo: $bookingSlotInfo, addressInfo: $addressInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.therapyBookingInfo, therapyBookingInfo) ||
                other.therapyBookingInfo == therapyBookingInfo) &&
            (identical(other.bookingSlotInfo, bookingSlotInfo) ||
                other.bookingSlotInfo == bookingSlotInfo) &&
            (identical(other.addressInfo, addressInfo) ||
                other.addressInfo == addressInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, therapyBookingInfo, bookingSlotInfo, addressInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)
        initialize,
    required TResult Function(ReferralModal? referralModal) createOrder,
    required TResult Function(ReferralModal? referralModal) createCODOrder,
    required TResult Function(String razorpayPaymentId,
            String razorpaySignature, ReferralModal? referralModal)
        checkoutOrder,
    required TResult Function() resetError,
    required TResult Function(bool isConsumed) consumeOrderId,
    required TResult Function(Map<String, dynamic> data) trackPayment,
  }) {
    return initialize(therapyBookingInfo, bookingSlotInfo, addressInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult? Function(ReferralModal? referralModal)? createOrder,
    TResult? Function(ReferralModal? referralModal)? createCODOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
        checkoutOrder,
    TResult? Function()? resetError,
    TResult? Function(bool isConsumed)? consumeOrderId,
    TResult? Function(Map<String, dynamic> data)? trackPayment,
  }) {
    return initialize?.call(therapyBookingInfo, bookingSlotInfo, addressInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult Function(ReferralModal? referralModal)? createOrder,
    TResult Function(ReferralModal? referralModal)? createCODOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
        checkoutOrder,
    TResult Function()? resetError,
    TResult Function(bool isConsumed)? consumeOrderId,
    TResult Function(Map<String, dynamic> data)? trackPayment,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(therapyBookingInfo, bookingSlotInfo, addressInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CreateCODOrder value) createCODOrder,
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
    TResult? Function(_CreateCODOrder value)? createCODOrder,
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
    TResult Function(_CreateCODOrder value)? createCODOrder,
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

abstract class _Initialize implements TherapyCheckoutEvent {
  const factory _Initialize(
      final TherapyBookingInfo therapyBookingInfo,
      final BookingSlotInfo bookingSlotInfo,
      final AddressInfo addressInfo) = _$InitializeImpl;

  TherapyBookingInfo get therapyBookingInfo;
  BookingSlotInfo get bookingSlotInfo;
  AddressInfo get addressInfo;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateOrderImplCopyWith<$Res> {
  factory _$$CreateOrderImplCopyWith(
          _$CreateOrderImpl value, $Res Function(_$CreateOrderImpl) then) =
      __$$CreateOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReferralModal? referralModal});
}

/// @nodoc
class __$$CreateOrderImplCopyWithImpl<$Res>
    extends _$TherapyCheckoutEventCopyWithImpl<$Res, _$CreateOrderImpl>
    implements _$$CreateOrderImplCopyWith<$Res> {
  __$$CreateOrderImplCopyWithImpl(
      _$CreateOrderImpl _value, $Res Function(_$CreateOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralModal = freezed,
  }) {
    return _then(_$CreateOrderImpl(
      freezed == referralModal
          ? _value.referralModal
          : referralModal // ignore: cast_nullable_to_non_nullable
              as ReferralModal?,
    ));
  }
}

/// @nodoc

class _$CreateOrderImpl implements _CreateOrder {
  const _$CreateOrderImpl(this.referralModal);

  @override
  final ReferralModal? referralModal;

  @override
  String toString() {
    return 'TherapyCheckoutEvent.createOrder(referralModal: $referralModal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderImpl &&
            (identical(other.referralModal, referralModal) ||
                other.referralModal == referralModal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, referralModal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderImplCopyWith<_$CreateOrderImpl> get copyWith =>
      __$$CreateOrderImplCopyWithImpl<_$CreateOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)
        initialize,
    required TResult Function(ReferralModal? referralModal) createOrder,
    required TResult Function(ReferralModal? referralModal) createCODOrder,
    required TResult Function(String razorpayPaymentId,
            String razorpaySignature, ReferralModal? referralModal)
        checkoutOrder,
    required TResult Function() resetError,
    required TResult Function(bool isConsumed) consumeOrderId,
    required TResult Function(Map<String, dynamic> data) trackPayment,
  }) {
    return createOrder(referralModal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult? Function(ReferralModal? referralModal)? createOrder,
    TResult? Function(ReferralModal? referralModal)? createCODOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
        checkoutOrder,
    TResult? Function()? resetError,
    TResult? Function(bool isConsumed)? consumeOrderId,
    TResult? Function(Map<String, dynamic> data)? trackPayment,
  }) {
    return createOrder?.call(referralModal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult Function(ReferralModal? referralModal)? createOrder,
    TResult Function(ReferralModal? referralModal)? createCODOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
        checkoutOrder,
    TResult Function()? resetError,
    TResult Function(bool isConsumed)? consumeOrderId,
    TResult Function(Map<String, dynamic> data)? trackPayment,
    required TResult orElse(),
  }) {
    if (createOrder != null) {
      return createOrder(referralModal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CreateCODOrder value) createCODOrder,
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
    TResult? Function(_CreateCODOrder value)? createCODOrder,
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
    TResult Function(_CreateCODOrder value)? createCODOrder,
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

abstract class _CreateOrder implements TherapyCheckoutEvent {
  const factory _CreateOrder(final ReferralModal? referralModal) =
      _$CreateOrderImpl;

  ReferralModal? get referralModal;
  @JsonKey(ignore: true)
  _$$CreateOrderImplCopyWith<_$CreateOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateCODOrderImplCopyWith<$Res> {
  factory _$$CreateCODOrderImplCopyWith(_$CreateCODOrderImpl value,
          $Res Function(_$CreateCODOrderImpl) then) =
      __$$CreateCODOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReferralModal? referralModal});
}

/// @nodoc
class __$$CreateCODOrderImplCopyWithImpl<$Res>
    extends _$TherapyCheckoutEventCopyWithImpl<$Res, _$CreateCODOrderImpl>
    implements _$$CreateCODOrderImplCopyWith<$Res> {
  __$$CreateCODOrderImplCopyWithImpl(
      _$CreateCODOrderImpl _value, $Res Function(_$CreateCODOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralModal = freezed,
  }) {
    return _then(_$CreateCODOrderImpl(
      freezed == referralModal
          ? _value.referralModal
          : referralModal // ignore: cast_nullable_to_non_nullable
              as ReferralModal?,
    ));
  }
}

/// @nodoc

class _$CreateCODOrderImpl implements _CreateCODOrder {
  const _$CreateCODOrderImpl(this.referralModal);

  @override
  final ReferralModal? referralModal;

  @override
  String toString() {
    return 'TherapyCheckoutEvent.createCODOrder(referralModal: $referralModal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCODOrderImpl &&
            (identical(other.referralModal, referralModal) ||
                other.referralModal == referralModal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, referralModal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCODOrderImplCopyWith<_$CreateCODOrderImpl> get copyWith =>
      __$$CreateCODOrderImplCopyWithImpl<_$CreateCODOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)
        initialize,
    required TResult Function(ReferralModal? referralModal) createOrder,
    required TResult Function(ReferralModal? referralModal) createCODOrder,
    required TResult Function(String razorpayPaymentId,
            String razorpaySignature, ReferralModal? referralModal)
        checkoutOrder,
    required TResult Function() resetError,
    required TResult Function(bool isConsumed) consumeOrderId,
    required TResult Function(Map<String, dynamic> data) trackPayment,
  }) {
    return createCODOrder(referralModal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult? Function(ReferralModal? referralModal)? createOrder,
    TResult? Function(ReferralModal? referralModal)? createCODOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
        checkoutOrder,
    TResult? Function()? resetError,
    TResult? Function(bool isConsumed)? consumeOrderId,
    TResult? Function(Map<String, dynamic> data)? trackPayment,
  }) {
    return createCODOrder?.call(referralModal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult Function(ReferralModal? referralModal)? createOrder,
    TResult Function(ReferralModal? referralModal)? createCODOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
        checkoutOrder,
    TResult Function()? resetError,
    TResult Function(bool isConsumed)? consumeOrderId,
    TResult Function(Map<String, dynamic> data)? trackPayment,
    required TResult orElse(),
  }) {
    if (createCODOrder != null) {
      return createCODOrder(referralModal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CreateCODOrder value) createCODOrder,
    required TResult Function(_CheckoutOrder value) checkoutOrder,
    required TResult Function(_ResetError value) resetError,
    required TResult Function(_ConsumeOrderId value) consumeOrderId,
    required TResult Function(_TrackPayment value) trackPayment,
  }) {
    return createCODOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CreateCODOrder value)? createCODOrder,
    TResult? Function(_CheckoutOrder value)? checkoutOrder,
    TResult? Function(_ResetError value)? resetError,
    TResult? Function(_ConsumeOrderId value)? consumeOrderId,
    TResult? Function(_TrackPayment value)? trackPayment,
  }) {
    return createCODOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CreateCODOrder value)? createCODOrder,
    TResult Function(_CheckoutOrder value)? checkoutOrder,
    TResult Function(_ResetError value)? resetError,
    TResult Function(_ConsumeOrderId value)? consumeOrderId,
    TResult Function(_TrackPayment value)? trackPayment,
    required TResult orElse(),
  }) {
    if (createCODOrder != null) {
      return createCODOrder(this);
    }
    return orElse();
  }
}

abstract class _CreateCODOrder implements TherapyCheckoutEvent {
  const factory _CreateCODOrder(final ReferralModal? referralModal) =
      _$CreateCODOrderImpl;

  ReferralModal? get referralModal;
  @JsonKey(ignore: true)
  _$$CreateCODOrderImplCopyWith<_$CreateCODOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutOrderImplCopyWith<$Res> {
  factory _$$CheckoutOrderImplCopyWith(
          _$CheckoutOrderImpl value, $Res Function(_$CheckoutOrderImpl) then) =
      __$$CheckoutOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String razorpayPaymentId,
      String razorpaySignature,
      ReferralModal? referralModal});
}

/// @nodoc
class __$$CheckoutOrderImplCopyWithImpl<$Res>
    extends _$TherapyCheckoutEventCopyWithImpl<$Res, _$CheckoutOrderImpl>
    implements _$$CheckoutOrderImplCopyWith<$Res> {
  __$$CheckoutOrderImplCopyWithImpl(
      _$CheckoutOrderImpl _value, $Res Function(_$CheckoutOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? razorpayPaymentId = null,
    Object? razorpaySignature = null,
    Object? referralModal = freezed,
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
      freezed == referralModal
          ? _value.referralModal
          : referralModal // ignore: cast_nullable_to_non_nullable
              as ReferralModal?,
    ));
  }
}

/// @nodoc

class _$CheckoutOrderImpl implements _CheckoutOrder {
  const _$CheckoutOrderImpl(
      this.razorpayPaymentId, this.razorpaySignature, this.referralModal);

  @override
  final String razorpayPaymentId;
  @override
  final String razorpaySignature;
  @override
  final ReferralModal? referralModal;

  @override
  String toString() {
    return 'TherapyCheckoutEvent.checkoutOrder(razorpayPaymentId: $razorpayPaymentId, razorpaySignature: $razorpaySignature, referralModal: $referralModal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutOrderImpl &&
            (identical(other.razorpayPaymentId, razorpayPaymentId) ||
                other.razorpayPaymentId == razorpayPaymentId) &&
            (identical(other.razorpaySignature, razorpaySignature) ||
                other.razorpaySignature == razorpaySignature) &&
            (identical(other.referralModal, referralModal) ||
                other.referralModal == referralModal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, razorpayPaymentId, razorpaySignature, referralModal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutOrderImplCopyWith<_$CheckoutOrderImpl> get copyWith =>
      __$$CheckoutOrderImplCopyWithImpl<_$CheckoutOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)
        initialize,
    required TResult Function(ReferralModal? referralModal) createOrder,
    required TResult Function(ReferralModal? referralModal) createCODOrder,
    required TResult Function(String razorpayPaymentId,
            String razorpaySignature, ReferralModal? referralModal)
        checkoutOrder,
    required TResult Function() resetError,
    required TResult Function(bool isConsumed) consumeOrderId,
    required TResult Function(Map<String, dynamic> data) trackPayment,
  }) {
    return checkoutOrder(razorpayPaymentId, razorpaySignature, referralModal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult? Function(ReferralModal? referralModal)? createOrder,
    TResult? Function(ReferralModal? referralModal)? createCODOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
        checkoutOrder,
    TResult? Function()? resetError,
    TResult? Function(bool isConsumed)? consumeOrderId,
    TResult? Function(Map<String, dynamic> data)? trackPayment,
  }) {
    return checkoutOrder?.call(
        razorpayPaymentId, razorpaySignature, referralModal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult Function(ReferralModal? referralModal)? createOrder,
    TResult Function(ReferralModal? referralModal)? createCODOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
        checkoutOrder,
    TResult Function()? resetError,
    TResult Function(bool isConsumed)? consumeOrderId,
    TResult Function(Map<String, dynamic> data)? trackPayment,
    required TResult orElse(),
  }) {
    if (checkoutOrder != null) {
      return checkoutOrder(razorpayPaymentId, razorpaySignature, referralModal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CreateCODOrder value) createCODOrder,
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
    TResult? Function(_CreateCODOrder value)? createCODOrder,
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
    TResult Function(_CreateCODOrder value)? createCODOrder,
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

abstract class _CheckoutOrder implements TherapyCheckoutEvent {
  const factory _CheckoutOrder(
      final String razorpayPaymentId,
      final String razorpaySignature,
      final ReferralModal? referralModal) = _$CheckoutOrderImpl;

  String get razorpayPaymentId;
  String get razorpaySignature;
  ReferralModal? get referralModal;
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
    extends _$TherapyCheckoutEventCopyWithImpl<$Res, _$ResetErrorImpl>
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
    return 'TherapyCheckoutEvent.resetError()';
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
    required TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)
        initialize,
    required TResult Function(ReferralModal? referralModal) createOrder,
    required TResult Function(ReferralModal? referralModal) createCODOrder,
    required TResult Function(String razorpayPaymentId,
            String razorpaySignature, ReferralModal? referralModal)
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
    TResult? Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult? Function(ReferralModal? referralModal)? createOrder,
    TResult? Function(ReferralModal? referralModal)? createCODOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
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
    TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult Function(ReferralModal? referralModal)? createOrder,
    TResult Function(ReferralModal? referralModal)? createCODOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
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
    required TResult Function(_CreateCODOrder value) createCODOrder,
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
    TResult? Function(_CreateCODOrder value)? createCODOrder,
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
    TResult Function(_CreateCODOrder value)? createCODOrder,
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

abstract class _ResetError implements TherapyCheckoutEvent {
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
    extends _$TherapyCheckoutEventCopyWithImpl<$Res, _$ConsumeOrderIdImpl>
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
    return 'TherapyCheckoutEvent.consumeOrderId(isConsumed: $isConsumed)';
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
    required TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)
        initialize,
    required TResult Function(ReferralModal? referralModal) createOrder,
    required TResult Function(ReferralModal? referralModal) createCODOrder,
    required TResult Function(String razorpayPaymentId,
            String razorpaySignature, ReferralModal? referralModal)
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
    TResult? Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult? Function(ReferralModal? referralModal)? createOrder,
    TResult? Function(ReferralModal? referralModal)? createCODOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
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
    TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult Function(ReferralModal? referralModal)? createOrder,
    TResult Function(ReferralModal? referralModal)? createCODOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
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
    required TResult Function(_CreateCODOrder value) createCODOrder,
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
    TResult? Function(_CreateCODOrder value)? createCODOrder,
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
    TResult Function(_CreateCODOrder value)? createCODOrder,
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

abstract class _ConsumeOrderId implements TherapyCheckoutEvent {
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
    extends _$TherapyCheckoutEventCopyWithImpl<$Res, _$TrackPaymentImpl>
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
    return 'TherapyCheckoutEvent.trackPayment(data: $data)';
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
    required TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)
        initialize,
    required TResult Function(ReferralModal? referralModal) createOrder,
    required TResult Function(ReferralModal? referralModal) createCODOrder,
    required TResult Function(String razorpayPaymentId,
            String razorpaySignature, ReferralModal? referralModal)
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
    TResult? Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult? Function(ReferralModal? referralModal)? createOrder,
    TResult? Function(ReferralModal? referralModal)? createCODOrder,
    TResult? Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
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
    TResult Function(TherapyBookingInfo therapyBookingInfo,
            BookingSlotInfo bookingSlotInfo, AddressInfo addressInfo)?
        initialize,
    TResult Function(ReferralModal? referralModal)? createOrder,
    TResult Function(ReferralModal? referralModal)? createCODOrder,
    TResult Function(String razorpayPaymentId, String razorpaySignature,
            ReferralModal? referralModal)?
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
    required TResult Function(_CreateCODOrder value) createCODOrder,
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
    TResult? Function(_CreateCODOrder value)? createCODOrder,
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
    TResult Function(_CreateCODOrder value)? createCODOrder,
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

abstract class _TrackPayment implements TherapyCheckoutEvent {
  const factory _TrackPayment(final Map<String, dynamic> data) =
      _$TrackPaymentImpl;

  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$TrackPaymentImplCopyWith<_$TrackPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TherapyCheckoutState {
  TherapyBookingInfo? get therapyBookingInfo =>
      throw _privateConstructorUsedError;
  AddressInfo? get addressInfo => throw _privateConstructorUsedError;
  BookingSlotInfo? get bookingSlotInfo => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isConsumedOrderId => throw _privateConstructorUsedError;
  String? get razorpayPaymentId => throw _privateConstructorUsedError;
  String? get razorpaySignature => throw _privateConstructorUsedError;
  bool get bookingCompleted => throw _privateConstructorUsedError;
  TherapyCreateOrderModel? get createOrderResult =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TherapyCheckoutStateCopyWith<TherapyCheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TherapyCheckoutStateCopyWith<$Res> {
  factory $TherapyCheckoutStateCopyWith(TherapyCheckoutState value,
          $Res Function(TherapyCheckoutState) then) =
      _$TherapyCheckoutStateCopyWithImpl<$Res, TherapyCheckoutState>;
  @useResult
  $Res call(
      {TherapyBookingInfo? therapyBookingInfo,
      AddressInfo? addressInfo,
      BookingSlotInfo? bookingSlotInfo,
      LoadingState loadingState,
      String? errorMessage,
      bool isConsumedOrderId,
      String? razorpayPaymentId,
      String? razorpaySignature,
      bool bookingCompleted,
      TherapyCreateOrderModel? createOrderResult});
}

/// @nodoc
class _$TherapyCheckoutStateCopyWithImpl<$Res,
        $Val extends TherapyCheckoutState>
    implements $TherapyCheckoutStateCopyWith<$Res> {
  _$TherapyCheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? therapyBookingInfo = freezed,
    Object? addressInfo = freezed,
    Object? bookingSlotInfo = freezed,
    Object? loadingState = null,
    Object? errorMessage = freezed,
    Object? isConsumedOrderId = null,
    Object? razorpayPaymentId = freezed,
    Object? razorpaySignature = freezed,
    Object? bookingCompleted = null,
    Object? createOrderResult = freezed,
  }) {
    return _then(_value.copyWith(
      therapyBookingInfo: freezed == therapyBookingInfo
          ? _value.therapyBookingInfo
          : therapyBookingInfo // ignore: cast_nullable_to_non_nullable
              as TherapyBookingInfo?,
      addressInfo: freezed == addressInfo
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo?,
      bookingSlotInfo: freezed == bookingSlotInfo
          ? _value.bookingSlotInfo
          : bookingSlotInfo // ignore: cast_nullable_to_non_nullable
              as BookingSlotInfo?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
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
              as TherapyCreateOrderModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TherapyCheckoutStateImplCopyWith<$Res>
    implements $TherapyCheckoutStateCopyWith<$Res> {
  factory _$$TherapyCheckoutStateImplCopyWith(_$TherapyCheckoutStateImpl value,
          $Res Function(_$TherapyCheckoutStateImpl) then) =
      __$$TherapyCheckoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TherapyBookingInfo? therapyBookingInfo,
      AddressInfo? addressInfo,
      BookingSlotInfo? bookingSlotInfo,
      LoadingState loadingState,
      String? errorMessage,
      bool isConsumedOrderId,
      String? razorpayPaymentId,
      String? razorpaySignature,
      bool bookingCompleted,
      TherapyCreateOrderModel? createOrderResult});
}

/// @nodoc
class __$$TherapyCheckoutStateImplCopyWithImpl<$Res>
    extends _$TherapyCheckoutStateCopyWithImpl<$Res, _$TherapyCheckoutStateImpl>
    implements _$$TherapyCheckoutStateImplCopyWith<$Res> {
  __$$TherapyCheckoutStateImplCopyWithImpl(_$TherapyCheckoutStateImpl _value,
      $Res Function(_$TherapyCheckoutStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? therapyBookingInfo = freezed,
    Object? addressInfo = freezed,
    Object? bookingSlotInfo = freezed,
    Object? loadingState = null,
    Object? errorMessage = freezed,
    Object? isConsumedOrderId = null,
    Object? razorpayPaymentId = freezed,
    Object? razorpaySignature = freezed,
    Object? bookingCompleted = null,
    Object? createOrderResult = freezed,
  }) {
    return _then(_$TherapyCheckoutStateImpl(
      therapyBookingInfo: freezed == therapyBookingInfo
          ? _value.therapyBookingInfo
          : therapyBookingInfo // ignore: cast_nullable_to_non_nullable
              as TherapyBookingInfo?,
      addressInfo: freezed == addressInfo
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo?,
      bookingSlotInfo: freezed == bookingSlotInfo
          ? _value.bookingSlotInfo
          : bookingSlotInfo // ignore: cast_nullable_to_non_nullable
              as BookingSlotInfo?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
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
              as TherapyCreateOrderModel?,
    ));
  }
}

/// @nodoc

class _$TherapyCheckoutStateImpl implements _TherapyCheckoutState {
  const _$TherapyCheckoutStateImpl(
      {required this.therapyBookingInfo,
      required this.addressInfo,
      required this.bookingSlotInfo,
      required this.loadingState,
      required this.errorMessage,
      required this.isConsumedOrderId,
      required this.razorpayPaymentId,
      required this.razorpaySignature,
      required this.bookingCompleted,
      required this.createOrderResult});

  @override
  final TherapyBookingInfo? therapyBookingInfo;
  @override
  final AddressInfo? addressInfo;
  @override
  final BookingSlotInfo? bookingSlotInfo;
  @override
  final LoadingState loadingState;
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
  final TherapyCreateOrderModel? createOrderResult;

  @override
  String toString() {
    return 'TherapyCheckoutState(therapyBookingInfo: $therapyBookingInfo, addressInfo: $addressInfo, bookingSlotInfo: $bookingSlotInfo, loadingState: $loadingState, errorMessage: $errorMessage, isConsumedOrderId: $isConsumedOrderId, razorpayPaymentId: $razorpayPaymentId, razorpaySignature: $razorpaySignature, bookingCompleted: $bookingCompleted, createOrderResult: $createOrderResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TherapyCheckoutStateImpl &&
            (identical(other.therapyBookingInfo, therapyBookingInfo) ||
                other.therapyBookingInfo == therapyBookingInfo) &&
            (identical(other.addressInfo, addressInfo) ||
                other.addressInfo == addressInfo) &&
            (identical(other.bookingSlotInfo, bookingSlotInfo) ||
                other.bookingSlotInfo == bookingSlotInfo) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
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
      therapyBookingInfo,
      addressInfo,
      bookingSlotInfo,
      loadingState,
      errorMessage,
      isConsumedOrderId,
      razorpayPaymentId,
      razorpaySignature,
      bookingCompleted,
      createOrderResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TherapyCheckoutStateImplCopyWith<_$TherapyCheckoutStateImpl>
      get copyWith =>
          __$$TherapyCheckoutStateImplCopyWithImpl<_$TherapyCheckoutStateImpl>(
              this, _$identity);
}

abstract class _TherapyCheckoutState implements TherapyCheckoutState {
  const factory _TherapyCheckoutState(
          {required final TherapyBookingInfo? therapyBookingInfo,
          required final AddressInfo? addressInfo,
          required final BookingSlotInfo? bookingSlotInfo,
          required final LoadingState loadingState,
          required final String? errorMessage,
          required final bool isConsumedOrderId,
          required final String? razorpayPaymentId,
          required final String? razorpaySignature,
          required final bool bookingCompleted,
          required final TherapyCreateOrderModel? createOrderResult}) =
      _$TherapyCheckoutStateImpl;

  @override
  TherapyBookingInfo? get therapyBookingInfo;
  @override
  AddressInfo? get addressInfo;
  @override
  BookingSlotInfo? get bookingSlotInfo;
  @override
  LoadingState get loadingState;
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
  TherapyCreateOrderModel? get createOrderResult;
  @override
  @JsonKey(ignore: true)
  _$$TherapyCheckoutStateImplCopyWith<_$TherapyCheckoutStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
