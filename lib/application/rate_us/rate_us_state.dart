part of 'rate_us_bloc.dart';

@freezed
class RateUsState with _$RateUsState {
  const factory RateUsState(
      {required String? bookingId,
      required String? therapyName,
      required String? therapistName,
      required String? therapistImageUrl,
      required int? therapyPoint,
      required int? therapistPoint,
      required LoadingState loadingState,
      required bool isSuccess}) = _RateUsState;

  factory RateUsState.initialize() => RateUsState(
      bookingId: null,
      therapyName: null,
      therapistName: null,
      therapistImageUrl: null,
      therapyPoint: null,
      therapistPoint: null,
      loadingState: LoadingState.isInitial,
      isSuccess: false);
}
