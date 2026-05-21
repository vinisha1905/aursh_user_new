// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? type) initialize,
    required TResult Function(String? title) getCategoryDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? type)? initialize,
    TResult? Function(String? title)? getCategoryDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? type)? initialize,
    TResult Function(String? title)? getCategoryDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetCategoryDetail value) getCategoryDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetCategoryDetail value)? getCategoryDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetCategoryDetail value)? getCategoryDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDetailEventCopyWith<$Res> {
  factory $CategoryDetailEventCopyWith(
          CategoryDetailEvent value, $Res Function(CategoryDetailEvent) then) =
      _$CategoryDetailEventCopyWithImpl<$Res, CategoryDetailEvent>;
}

/// @nodoc
class _$CategoryDetailEventCopyWithImpl<$Res, $Val extends CategoryDetailEvent>
    implements $CategoryDetailEventCopyWith<$Res> {
  _$CategoryDetailEventCopyWithImpl(this._value, this._then);

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
  $Res call({String? type});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$CategoryDetailEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_$InitializeImpl(
      freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.type);

  @override
  final String? type;

  @override
  String toString() {
    return 'CategoryDetailEvent.initialize(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? type) initialize,
    required TResult Function(String? title) getCategoryDetail,
  }) {
    return initialize(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? type)? initialize,
    TResult? Function(String? title)? getCategoryDetail,
  }) {
    return initialize?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? type)? initialize,
    TResult Function(String? title)? getCategoryDetail,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetCategoryDetail value) getCategoryDetail,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetCategoryDetail value)? getCategoryDetail,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetCategoryDetail value)? getCategoryDetail,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements CategoryDetailEvent {
  const factory _Initialize(final String? type) = _$InitializeImpl;

  String? get type;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCategoryDetailImplCopyWith<$Res> {
  factory _$$GetCategoryDetailImplCopyWith(_$GetCategoryDetailImpl value,
          $Res Function(_$GetCategoryDetailImpl) then) =
      __$$GetCategoryDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? title});
}

/// @nodoc
class __$$GetCategoryDetailImplCopyWithImpl<$Res>
    extends _$CategoryDetailEventCopyWithImpl<$Res, _$GetCategoryDetailImpl>
    implements _$$GetCategoryDetailImplCopyWith<$Res> {
  __$$GetCategoryDetailImplCopyWithImpl(_$GetCategoryDetailImpl _value,
      $Res Function(_$GetCategoryDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
  }) {
    return _then(_$GetCategoryDetailImpl(
      freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetCategoryDetailImpl implements _GetCategoryDetail {
  const _$GetCategoryDetailImpl(this.title);

  @override
  final String? title;

  @override
  String toString() {
    return 'CategoryDetailEvent.getCategoryDetail(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCategoryDetailImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCategoryDetailImplCopyWith<_$GetCategoryDetailImpl> get copyWith =>
      __$$GetCategoryDetailImplCopyWithImpl<_$GetCategoryDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? type) initialize,
    required TResult Function(String? title) getCategoryDetail,
  }) {
    return getCategoryDetail(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? type)? initialize,
    TResult? Function(String? title)? getCategoryDetail,
  }) {
    return getCategoryDetail?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? type)? initialize,
    TResult Function(String? title)? getCategoryDetail,
    required TResult orElse(),
  }) {
    if (getCategoryDetail != null) {
      return getCategoryDetail(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetCategoryDetail value) getCategoryDetail,
  }) {
    return getCategoryDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetCategoryDetail value)? getCategoryDetail,
  }) {
    return getCategoryDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetCategoryDetail value)? getCategoryDetail,
    required TResult orElse(),
  }) {
    if (getCategoryDetail != null) {
      return getCategoryDetail(this);
    }
    return orElse();
  }
}

abstract class _GetCategoryDetail implements CategoryDetailEvent {
  const factory _GetCategoryDetail(final String? title) =
      _$GetCategoryDetailImpl;

  String? get title;
  @JsonKey(ignore: true)
  _$$GetCategoryDetailImplCopyWith<_$GetCategoryDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryDetailState {
  DoctorModel? get doctorModel => throw _privateConstructorUsedError;
  LoadingState get loadingState => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<TherapyCategoryModel> get categories =>
      throw _privateConstructorUsedError;
  CategoryDetailModel? get categoryDetailModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryDetailStateCopyWith<CategoryDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDetailStateCopyWith<$Res> {
  factory $CategoryDetailStateCopyWith(
          CategoryDetailState value, $Res Function(CategoryDetailState) then) =
      _$CategoryDetailStateCopyWithImpl<$Res, CategoryDetailState>;
  @useResult
  $Res call(
      {DoctorModel? doctorModel,
      LoadingState loadingState,
      String? title,
      List<TherapyCategoryModel> categories,
      CategoryDetailModel? categoryDetailModel});
}

/// @nodoc
class _$CategoryDetailStateCopyWithImpl<$Res, $Val extends CategoryDetailState>
    implements $CategoryDetailStateCopyWith<$Res> {
  _$CategoryDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorModel = freezed,
    Object? loadingState = null,
    Object? title = freezed,
    Object? categories = null,
    Object? categoryDetailModel = freezed,
  }) {
    return _then(_value.copyWith(
      doctorModel: freezed == doctorModel
          ? _value.doctorModel
          : doctorModel // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<TherapyCategoryModel>,
      categoryDetailModel: freezed == categoryDetailModel
          ? _value.categoryDetailModel
          : categoryDetailModel // ignore: cast_nullable_to_non_nullable
              as CategoryDetailModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryDetailStateImplCopyWith<$Res>
    implements $CategoryDetailStateCopyWith<$Res> {
  factory _$$CategoryDetailStateImplCopyWith(_$CategoryDetailStateImpl value,
          $Res Function(_$CategoryDetailStateImpl) then) =
      __$$CategoryDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DoctorModel? doctorModel,
      LoadingState loadingState,
      String? title,
      List<TherapyCategoryModel> categories,
      CategoryDetailModel? categoryDetailModel});
}

/// @nodoc
class __$$CategoryDetailStateImplCopyWithImpl<$Res>
    extends _$CategoryDetailStateCopyWithImpl<$Res, _$CategoryDetailStateImpl>
    implements _$$CategoryDetailStateImplCopyWith<$Res> {
  __$$CategoryDetailStateImplCopyWithImpl(_$CategoryDetailStateImpl _value,
      $Res Function(_$CategoryDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorModel = freezed,
    Object? loadingState = null,
    Object? title = freezed,
    Object? categories = null,
    Object? categoryDetailModel = freezed,
  }) {
    return _then(_$CategoryDetailStateImpl(
      doctorModel: freezed == doctorModel
          ? _value.doctorModel
          : doctorModel // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<TherapyCategoryModel>,
      categoryDetailModel: freezed == categoryDetailModel
          ? _value.categoryDetailModel
          : categoryDetailModel // ignore: cast_nullable_to_non_nullable
              as CategoryDetailModel?,
    ));
  }
}

/// @nodoc

class _$CategoryDetailStateImpl implements _CategoryDetailState {
  const _$CategoryDetailStateImpl(
      {required this.doctorModel,
      required this.loadingState,
      required this.title,
      required final List<TherapyCategoryModel> categories,
      required this.categoryDetailModel})
      : _categories = categories;

  @override
  final DoctorModel? doctorModel;
  @override
  final LoadingState loadingState;
  @override
  final String? title;
  final List<TherapyCategoryModel> _categories;
  @override
  List<TherapyCategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final CategoryDetailModel? categoryDetailModel;

  @override
  String toString() {
    return 'CategoryDetailState(doctorModel: $doctorModel, loadingState: $loadingState, title: $title, categories: $categories, categoryDetailModel: $categoryDetailModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDetailStateImpl &&
            (identical(other.doctorModel, doctorModel) ||
                other.doctorModel == doctorModel) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.categoryDetailModel, categoryDetailModel) ||
                other.categoryDetailModel == categoryDetailModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, doctorModel, loadingState, title,
      const DeepCollectionEquality().hash(_categories), categoryDetailModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDetailStateImplCopyWith<_$CategoryDetailStateImpl> get copyWith =>
      __$$CategoryDetailStateImplCopyWithImpl<_$CategoryDetailStateImpl>(
          this, _$identity);
}

abstract class _CategoryDetailState implements CategoryDetailState {
  const factory _CategoryDetailState(
          {required final DoctorModel? doctorModel,
          required final LoadingState loadingState,
          required final String? title,
          required final List<TherapyCategoryModel> categories,
          required final CategoryDetailModel? categoryDetailModel}) =
      _$CategoryDetailStateImpl;

  @override
  DoctorModel? get doctorModel;
  @override
  LoadingState get loadingState;
  @override
  String? get title;
  @override
  List<TherapyCategoryModel> get categories;
  @override
  CategoryDetailModel? get categoryDetailModel;
  @override
  @JsonKey(ignore: true)
  _$$CategoryDetailStateImplCopyWith<_$CategoryDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
