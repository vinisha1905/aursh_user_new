part of 'consultation_booking_detail_bloc.dart';

@freezed
class ConsultationBookingDetailState with _$ConsultationBookingDetailState {
  const factory ConsultationBookingDetailState(
      {required InternalConsultationModel? consultation,
      required LoadingState loadingState,
      required String? errorMessage,
      required String? callType,
      required Either<String, DefaultResponse>? cancelConsultationResult,
      required ConsultationCancellationInfoModel? cancellationInfo,
      required String? userId,
      required String? rtcToken}) = _ConsultationBookingDetailState;

  factory ConsultationBookingDetailState.initialize() =>
      ConsultationBookingDetailState(
          consultation: null,
          loadingState: LoadingState.isInitial,
          errorMessage: null,
          cancelConsultationResult: null,
          cancellationInfo: null,
          userId: null,
          callType: null,
          rtcToken: null);
}
