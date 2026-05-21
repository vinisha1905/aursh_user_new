// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index, BookFor? bookFor) selectTab,
    required TResult Function() showLoading,
    required TResult Function() hideLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int index, BookFor? bookFor)? selectTab,
    TResult? Function()? showLoading,
    TResult? Function()? hideLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index, BookFor? bookFor)? selectTab,
    TResult Function()? showLoading,
    TResult Function()? hideLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTab value) selectTab,
    required TResult Function(_ShowLoading value) showLoading,
    required TResult Function(_HideLoading value) hideLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTab value)? selectTab,
    TResult? Function(_ShowLoading value)? showLoading,
    TResult? Function(_HideLoading value)? hideLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTab value)? selectTab,
    TResult Function(_ShowLoading value)? showLoading,
    TResult Function(_HideLoading value)? hideLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainEventCopyWith<$Res> {
  factory $MainEventCopyWith(MainEvent value, $Res Function(MainEvent) then) =
      _$MainEventCopyWithImpl<$Res, MainEvent>;
}

/// @nodoc
class _$MainEventCopyWithImpl<$Res, $Val extends MainEvent>
    implements $MainEventCopyWith<$Res> {
  _$MainEventCopyWithImpl(this._value, this._then);

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
    extends _$MainEventCopyWithImpl<$Res, _$InitializeImpl>
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
    return 'MainEvent.initialize()';
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
    required TResult Function(int index, BookFor? bookFor) selectTab,
    required TResult Function() showLoading,
    required TResult Function() hideLoading,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int index, BookFor? bookFor)? selectTab,
    TResult? Function()? showLoading,
    TResult? Function()? hideLoading,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index, BookFor? bookFor)? selectTab,
    TResult Function()? showLoading,
    TResult Function()? hideLoading,
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
    required TResult Function(_SelectTab value) selectTab,
    required TResult Function(_ShowLoading value) showLoading,
    required TResult Function(_HideLoading value) hideLoading,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTab value)? selectTab,
    TResult? Function(_ShowLoading value)? showLoading,
    TResult? Function(_HideLoading value)? hideLoading,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTab value)? selectTab,
    TResult Function(_ShowLoading value)? showLoading,
    TResult Function(_HideLoading value)? hideLoading,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements MainEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$SelectTabImplCopyWith<$Res> {
  factory _$$SelectTabImplCopyWith(
          _$SelectTabImpl value, $Res Function(_$SelectTabImpl) then) =
      __$$SelectTabImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, BookFor? bookFor});
}

/// @nodoc
class __$$SelectTabImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$SelectTabImpl>
    implements _$$SelectTabImplCopyWith<$Res> {
  __$$SelectTabImplCopyWithImpl(
      _$SelectTabImpl _value, $Res Function(_$SelectTabImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? bookFor = freezed,
  }) {
    return _then(_$SelectTabImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == bookFor
          ? _value.bookFor
          : bookFor // ignore: cast_nullable_to_non_nullable
              as BookFor?,
    ));
  }
}

/// @nodoc

class _$SelectTabImpl implements _SelectTab {
  const _$SelectTabImpl(this.index, this.bookFor);

  @override
  final int index;
  @override
  final BookFor? bookFor;

  @override
  String toString() {
    return 'MainEvent.selectTab(index: $index, bookFor: $bookFor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectTabImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.bookFor, bookFor) || other.bookFor == bookFor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, bookFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectTabImplCopyWith<_$SelectTabImpl> get copyWith =>
      __$$SelectTabImplCopyWithImpl<_$SelectTabImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index, BookFor? bookFor) selectTab,
    required TResult Function() showLoading,
    required TResult Function() hideLoading,
  }) {
    return selectTab(index, bookFor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int index, BookFor? bookFor)? selectTab,
    TResult? Function()? showLoading,
    TResult? Function()? hideLoading,
  }) {
    return selectTab?.call(index, bookFor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index, BookFor? bookFor)? selectTab,
    TResult Function()? showLoading,
    TResult Function()? hideLoading,
    required TResult orElse(),
  }) {
    if (selectTab != null) {
      return selectTab(index, bookFor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTab value) selectTab,
    required TResult Function(_ShowLoading value) showLoading,
    required TResult Function(_HideLoading value) hideLoading,
  }) {
    return selectTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTab value)? selectTab,
    TResult? Function(_ShowLoading value)? showLoading,
    TResult? Function(_HideLoading value)? hideLoading,
  }) {
    return selectTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTab value)? selectTab,
    TResult Function(_ShowLoading value)? showLoading,
    TResult Function(_HideLoading value)? hideLoading,
    required TResult orElse(),
  }) {
    if (selectTab != null) {
      return selectTab(this);
    }
    return orElse();
  }
}

abstract class _SelectTab implements MainEvent {
  const factory _SelectTab(final int index, final BookFor? bookFor) =
      _$SelectTabImpl;

  int get index;
  BookFor? get bookFor;
  @JsonKey(ignore: true)
  _$$SelectTabImplCopyWith<_$SelectTabImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowLoadingImplCopyWith<$Res> {
  factory _$$ShowLoadingImplCopyWith(
          _$ShowLoadingImpl value, $Res Function(_$ShowLoadingImpl) then) =
      __$$ShowLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowLoadingImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$ShowLoadingImpl>
    implements _$$ShowLoadingImplCopyWith<$Res> {
  __$$ShowLoadingImplCopyWithImpl(
      _$ShowLoadingImpl _value, $Res Function(_$ShowLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShowLoadingImpl implements _ShowLoading {
  const _$ShowLoadingImpl();

  @override
  String toString() {
    return 'MainEvent.showLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index, BookFor? bookFor) selectTab,
    required TResult Function() showLoading,
    required TResult Function() hideLoading,
  }) {
    return showLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int index, BookFor? bookFor)? selectTab,
    TResult? Function()? showLoading,
    TResult? Function()? hideLoading,
  }) {
    return showLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index, BookFor? bookFor)? selectTab,
    TResult Function()? showLoading,
    TResult Function()? hideLoading,
    required TResult orElse(),
  }) {
    if (showLoading != null) {
      return showLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTab value) selectTab,
    required TResult Function(_ShowLoading value) showLoading,
    required TResult Function(_HideLoading value) hideLoading,
  }) {
    return showLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTab value)? selectTab,
    TResult? Function(_ShowLoading value)? showLoading,
    TResult? Function(_HideLoading value)? hideLoading,
  }) {
    return showLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTab value)? selectTab,
    TResult Function(_ShowLoading value)? showLoading,
    TResult Function(_HideLoading value)? hideLoading,
    required TResult orElse(),
  }) {
    if (showLoading != null) {
      return showLoading(this);
    }
    return orElse();
  }
}

abstract class _ShowLoading implements MainEvent {
  const factory _ShowLoading() = _$ShowLoadingImpl;
}

/// @nodoc
abstract class _$$HideLoadingImplCopyWith<$Res> {
  factory _$$HideLoadingImplCopyWith(
          _$HideLoadingImpl value, $Res Function(_$HideLoadingImpl) then) =
      __$$HideLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HideLoadingImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$HideLoadingImpl>
    implements _$$HideLoadingImplCopyWith<$Res> {
  __$$HideLoadingImplCopyWithImpl(
      _$HideLoadingImpl _value, $Res Function(_$HideLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HideLoadingImpl implements _HideLoading {
  const _$HideLoadingImpl();

  @override
  String toString() {
    return 'MainEvent.hideLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HideLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index, BookFor? bookFor) selectTab,
    required TResult Function() showLoading,
    required TResult Function() hideLoading,
  }) {
    return hideLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int index, BookFor? bookFor)? selectTab,
    TResult? Function()? showLoading,
    TResult? Function()? hideLoading,
  }) {
    return hideLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index, BookFor? bookFor)? selectTab,
    TResult Function()? showLoading,
    TResult Function()? hideLoading,
    required TResult orElse(),
  }) {
    if (hideLoading != null) {
      return hideLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTab value) selectTab,
    required TResult Function(_ShowLoading value) showLoading,
    required TResult Function(_HideLoading value) hideLoading,
  }) {
    return hideLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTab value)? selectTab,
    TResult? Function(_ShowLoading value)? showLoading,
    TResult? Function(_HideLoading value)? hideLoading,
  }) {
    return hideLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTab value)? selectTab,
    TResult Function(_ShowLoading value)? showLoading,
    TResult Function(_HideLoading value)? hideLoading,
    required TResult orElse(),
  }) {
    if (hideLoading != null) {
      return hideLoading(this);
    }
    return orElse();
  }
}

abstract class _HideLoading implements MainEvent {
  const factory _HideLoading() = _$HideLoadingImpl;
}

/// @nodoc
mixin _$MainState {
  int? get selectedTab => throw _privateConstructorUsedError;
  BookFor? get bookFor => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call({int? selectedTab, BookFor? bookFor, LoadingState loadingState});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTab = freezed,
    Object? bookFor = freezed,
    Object? loadingState = null,
  }) {
    return _then(_value.copyWith(
      selectedTab: freezed == selectedTab
          ? _value.selectedTab
          : selectedTab // ignore: cast_nullable_to_non_nullable
              as int?,
      bookFor: freezed == bookFor
          ? _value.bookFor
          : bookFor // ignore: cast_nullable_to_non_nullable
              as BookFor?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainStateImplCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$MainStateImplCopyWith(
          _$MainStateImpl value, $Res Function(_$MainStateImpl) then) =
      __$$MainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? selectedTab, BookFor? bookFor, LoadingState loadingState});
}

/// @nodoc
class __$$MainStateImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$MainStateImpl>
    implements _$$MainStateImplCopyWith<$Res> {
  __$$MainStateImplCopyWithImpl(
      _$MainStateImpl _value, $Res Function(_$MainStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTab = freezed,
    Object? bookFor = freezed,
    Object? loadingState = null,
  }) {
    return _then(_$MainStateImpl(
      selectedTab: freezed == selectedTab
          ? _value.selectedTab
          : selectedTab // ignore: cast_nullable_to_non_nullable
              as int?,
      bookFor: freezed == bookFor
          ? _value.bookFor
          : bookFor // ignore: cast_nullable_to_non_nullable
              as BookFor?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ));
  }
}

/// @nodoc

class _$MainStateImpl implements _MainState {
  const _$MainStateImpl(
      {required this.selectedTab,
      required this.bookFor,
      required this.loadingState});

  @override
  final int? selectedTab;
  @override
  final BookFor? bookFor;
  @override
  final LoadingState loadingState;

  @override
  String toString() {
    return 'MainState(selectedTab: $selectedTab, bookFor: $bookFor, loadingState: $loadingState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.bookFor, bookFor) || other.bookFor == bookFor) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedTab, bookFor, loadingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);
}

abstract class _MainState implements MainState {
  const factory _MainState(
      {required final int? selectedTab,
      required final BookFor? bookFor,
      required final LoadingState loadingState}) = _$MainStateImpl;

  @override
  int? get selectedTab;
  @override
  BookFor? get bookFor;
  @override
  LoadingState get loadingState;
  @override
  @JsonKey(ignore: true)
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
