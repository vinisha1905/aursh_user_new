part of 'search_therapy_bloc.dart';

@freezed
class SearchTherapyState with _$SearchTherapyState {
  const factory SearchTherapyState(
      {required String? keyword,
      required LoadingState loadingState,
      required Either<String, SearchTherapyResponse>? result}) = _SearchTherapyState;

  factory SearchTherapyState.initialize() => SearchTherapyState(
      keyword: null,
      loadingState: LoadingState.isInitial,
      result: null);
}
