part of 'therapy_detail_bloc.dart';

@freezed
class TherapyDetailEvent with _$TherapyDetailEvent {
  const factory TherapyDetailEvent.initialize(
      String categoryTitle, String therapyTile) = _Initialize;

  const factory TherapyDetailEvent.getTherapyDetail() = _GetTherapyDetail;
  const factory TherapyDetailEvent.getLocation(
      {bool? setDefault, bool? setCurrent}) = _GetLocation;

  const factory TherapyDetailEvent.getClinicDetails() = _GetClinicDetails;

  const factory TherapyDetailEvent.selectOption(int index) = _SelectOption;
  const factory TherapyDetailEvent.setLatLong(
      double lat, double long, String address) = _SetLatLong;
  const factory TherapyDetailEvent.setTherapyPlace(String therapyPlace) =
      _SetTherapyPlace;

  const factory TherapyDetailEvent.selectDuration(int index) = _SelectDuration;

  const factory TherapyDetailEvent.selectServiceType(
      {required ServiceType serviceType,
      required String selectedServiceTypeText}) = _SelectServiceType;

  const factory TherapyDetailEvent.startBooking() = _StartBooking;

  const factory TherapyDetailEvent.showLoader() = _ShowLoader;
  const factory TherapyDetailEvent.hideLoader() = _HideLoader;
}
