// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_us_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AboutUsEvent {
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
abstract class $AboutUsEventCopyWith<$Res> {
  factory $AboutUsEventCopyWith(
          AboutUsEvent value, $Res Function(AboutUsEvent) then) =
      _$AboutUsEventCopyWithImpl<$Res, AboutUsEvent>;
}

/// @nodoc
class _$AboutUsEventCopyWithImpl<$Res, $Val extends AboutUsEvent>
    implements $AboutUsEventCopyWith<$Res> {
  _$AboutUsEventCopyWithImpl(this._value, this._then);

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
    extends _$AboutUsEventCopyWithImpl<$Res, _$InitializeImpl>
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
    return 'AboutUsEvent.initialize()';
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

abstract class _Initialize implements AboutUsEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
mixin _$AboutUsState {
  LoadingState get loadingState => throw _privateConstructorUsedError;
  List<AboutUsModel> get aboutUsModels => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AboutUsStateCopyWith<AboutUsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutUsStateCopyWith<$Res> {
  factory $AboutUsStateCopyWith(
          AboutUsState value, $Res Function(AboutUsState) then) =
      _$AboutUsStateCopyWithImpl<$Res, AboutUsState>;
  @useResult
  $Res call({LoadingState loadingState, List<AboutUsModel> aboutUsModels});
}

/// @nodoc
class _$AboutUsStateCopyWithImpl<$Res, $Val extends AboutUsState>
    implements $AboutUsStateCopyWith<$Res> {
  _$AboutUsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? aboutUsModels = null,
  }) {
    return _then(_value.copyWith(
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      aboutUsModels: null == aboutUsModels
          ? _value.aboutUsModels
          : aboutUsModels // ignore: cast_nullable_to_non_nullable
              as List<AboutUsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AboutUsStateImplCopyWith<$Res>
    implements $AboutUsStateCopyWith<$Res> {
  factory _$$AboutUsStateImplCopyWith(
          _$AboutUsStateImpl value, $Res Function(_$AboutUsStateImpl) then) =
      __$$AboutUsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoadingState loadingState, List<AboutUsModel> aboutUsModels});
}

/// @nodoc
class __$$AboutUsStateImplCopyWithImpl<$Res>
    extends _$AboutUsStateCopyWithImpl<$Res, _$AboutUsStateImpl>
    implements _$$AboutUsStateImplCopyWith<$Res> {
  __$$AboutUsStateImplCopyWithImpl(
      _$AboutUsStateImpl _value, $Res Function(_$AboutUsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? aboutUsModels = null,
  }) {
    return _then(_$AboutUsStateImpl(
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      aboutUsModels: null == aboutUsModels
          ? _value._aboutUsModels
          : aboutUsModels // ignore: cast_nullable_to_non_nullable
              as List<AboutUsModel>,
    ));
  }
}

/// @nodoc

class _$AboutUsStateImpl implements _AboutUsState {
  const _$AboutUsStateImpl(
      {required this.loadingState,
      required final List<AboutUsModel> aboutUsModels})
      : _aboutUsModels = aboutUsModels;

  @override
  final LoadingState loadingState;
  final List<AboutUsModel> _aboutUsModels;
  @override
  List<AboutUsModel> get aboutUsModels {
    if (_aboutUsModels is EqualUnmodifiableListView) return _aboutUsModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aboutUsModels);
  }

  @override
  String toString() {
    return 'AboutUsState(loadingState: $loadingState, aboutUsModels: $aboutUsModels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutUsStateImpl &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            const DeepCollectionEquality()
                .equals(other._aboutUsModels, _aboutUsModels));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingState,
      const DeepCollectionEquality().hash(_aboutUsModels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutUsStateImplCopyWith<_$AboutUsStateImpl> get copyWith =>
      __$$AboutUsStateImplCopyWithImpl<_$AboutUsStateImpl>(this, _$identity);
}

abstract class _AboutUsState implements AboutUsState {
  const factory _AboutUsState(
      {required final LoadingState loadingState,
      required final List<AboutUsModel> aboutUsModels}) = _$AboutUsStateImpl;

  @override
  LoadingState get loadingState;
  @override
  List<AboutUsModel> get aboutUsModels;
  @override
  @JsonKey(ignore: true)
  _$$AboutUsStateImplCopyWith<_$AboutUsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
