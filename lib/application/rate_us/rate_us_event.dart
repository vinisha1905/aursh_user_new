part of 'rate_us_bloc.dart';

@freezed
class RateUsEvent with _$RateUsEvent {
  const factory RateUsEvent.initialize(String bookingId, String therapyName,
      String therapistName, String therapistImageUrl) = _Initialize;

  const factory RateUsEvent.setTherapyPoint(int? therapyPoint) =
      _SetTherapyPoint;

  const factory RateUsEvent.setTherapistPoint(int? therapistPoint) =
      _SetTherapistPoint;

  const factory RateUsEvent.submit(
      String therapyDescription, String therapistDescription) = _Submit;
}
