part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.initialize() = _Initialize;
  const factory HomeEvent.getData() = _GetData;
  const factory HomeEvent.showAllCategories(bool isShowAll) =
      _ShowAllCategories;
  const factory HomeEvent.showAllPhysioCategories(bool isShowAll) =
      _ShowAllPhysioCategories;
  const factory HomeEvent.selectUserReviewPage(int index) =
      _SelectUserReviewPage;
  const factory HomeEvent.updateLocation(Map<String, dynamic> data) =
      _UpdateLocation;
}
