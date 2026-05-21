part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required LoadingState loadingState,
    required List<TherapyCategoryModel> categories,
    required List<TherapyCategoryModel> physioCategories,
    required List<BlogModel> blogs,
    required List<UserReviewModel> reviews,
    required int selectedUserReview,
    required ConfigModel? configModel,
    required TherapyCategoryResponse? physioTherapyCategoryResponse,
    required TherapyCategoryResponse? therapyCategoryResponse,
  }) = _HomeState;

  factory HomeState.initialize() => HomeState(
      loadingState: LoadingState.isInitial,
      categories: [],
      physioCategories: [],
      blogs: [],
      reviews: [],
      selectedUserReview: 0,
      configModel: null,
      physioTherapyCategoryResponse: null,
      therapyCategoryResponse: null);
}
