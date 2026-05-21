part of 'category_detail_bloc.dart';

@freezed
class CategoryDetailEvent with _$CategoryDetailEvent {
  const factory CategoryDetailEvent.initialize(String? type) = _Initialize;

  const factory CategoryDetailEvent.getCategoryDetail(String? title) =
      _GetCategoryDetail;
}
