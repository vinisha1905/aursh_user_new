part of 'category_detail_bloc.dart';

@freezed
class CategoryDetailState with _$CategoryDetailState {
  const factory CategoryDetailState({required DoctorModel? doctorModel,
    required LoadingState loadingState,
    required String? title,
    required List<TherapyCategoryModel> categories,
    required CategoryDetailModel? categoryDetailModel}) = _CategoryDetailState;

  factory CategoryDetailState.initialize() =>
      CategoryDetailState(
          doctorModel: null,
          loadingState: LoadingState.isInitial,
          title: null,
          categories: [],
          categoryDetailModel: null);
}
