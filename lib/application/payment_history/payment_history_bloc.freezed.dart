// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentHistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentHistoryEventCopyWith<$Res> {
  factory $PaymentHistoryEventCopyWith(
          PaymentHistoryEvent value, $Res Function(PaymentHistoryEvent) then) =
      _$PaymentHistoryEventCopyWithImpl<$Res, PaymentHistoryEvent>;
}

/// @nodoc
class _$PaymentHistoryEventCopyWithImpl<$Res, $Val extends PaymentHistoryEvent>
    implements $PaymentHistoryEventCopyWith<$Res> {
  _$PaymentHistoryEventCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$PaymentHistoryEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'PaymentHistoryEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements PaymentHistoryEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
mixin _$PaymentHistoryState {
  LoadingState get loadingState => throw _privateConstructorUsedError;
  List<PaymentModel>? get paymentModels => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentHistoryStateCopyWith<PaymentHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentHistoryStateCopyWith<$Res> {
  factory $PaymentHistoryStateCopyWith(
          PaymentHistoryState value, $Res Function(PaymentHistoryState) then) =
      _$PaymentHistoryStateCopyWithImpl<$Res, PaymentHistoryState>;
  @useResult
  $Res call({LoadingState loadingState, List<PaymentModel>? paymentModels});
}

/// @nodoc
class _$PaymentHistoryStateCopyWithImpl<$Res, $Val extends PaymentHistoryState>
    implements $PaymentHistoryStateCopyWith<$Res> {
  _$PaymentHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? paymentModels = freezed,
  }) {
    return _then(_value.copyWith(
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      paymentModels: freezed == paymentModels
          ? _value.paymentModels
          : paymentModels // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentHistoryStateImplCopyWith<$Res>
    implements $PaymentHistoryStateCopyWith<$Res> {
  factory _$$PaymentHistoryStateImplCopyWith(_$PaymentHistoryStateImpl value,
          $Res Function(_$PaymentHistoryStateImpl) then) =
      __$$PaymentHistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoadingState loadingState, List<PaymentModel>? paymentModels});
}

/// @nodoc
class __$$PaymentHistoryStateImplCopyWithImpl<$Res>
    extends _$PaymentHistoryStateCopyWithImpl<$Res, _$PaymentHistoryStateImpl>
    implements _$$PaymentHistoryStateImplCopyWith<$Res> {
  __$$PaymentHistoryStateImplCopyWithImpl(_$PaymentHistoryStateImpl _value,
      $Res Function(_$PaymentHistoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? paymentModels = freezed,
  }) {
    return _then(_$PaymentHistoryStateImpl(
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      paymentModels: freezed == paymentModels
          ? _value._paymentModels
          : paymentModels // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>?,
    ));
  }
}

/// @nodoc

class _$PaymentHistoryStateImpl implements _PaymentHistoryState {
  const _$PaymentHistoryStateImpl(
      {required this.loadingState,
      required final List<PaymentModel>? paymentModels})
      : _paymentModels = paymentModels;

  @override
  final LoadingState loadingState;
  final List<PaymentModel>? _paymentModels;
  @override
  List<PaymentModel>? get paymentModels {
    final value = _paymentModels;
    if (value == null) return null;
    if (_paymentModels is EqualUnmodifiableListView) return _paymentModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaymentHistoryState(loadingState: $loadingState, paymentModels: $paymentModels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentHistoryStateImpl &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            const DeepCollectionEquality()
                .equals(other._paymentModels, _paymentModels));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingState,
      const DeepCollectionEquality().hash(_paymentModels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentHistoryStateImplCopyWith<_$PaymentHistoryStateImpl> get copyWith =>
      __$$PaymentHistoryStateImplCopyWithImpl<_$PaymentHistoryStateImpl>(
          this, _$identity);
}

abstract class _PaymentHistoryState implements PaymentHistoryState {
  const factory _PaymentHistoryState(
          {required final LoadingState loadingState,
          required final List<PaymentModel>? paymentModels}) =
      _$PaymentHistoryStateImpl;

  @override
  LoadingState get loadingState;
  @override
  List<PaymentModel>? get paymentModels;
  @override
  @JsonKey(ignore: true)
  _$$PaymentHistoryStateImplCopyWith<_$PaymentHistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
