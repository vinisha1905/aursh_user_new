import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/request/cancel_consultation_request.dart';
import 'package:ayursh/domain/model/response/consultation_cancellation_info_model.dart';
import 'package:ayursh/domain/model/response/default_response.dart';
import 'package:ayursh/domain/model/response/internal_consultation_model.dart';
import 'package:ayursh/domain/repository/consultation_repository.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:ayursh/domain/util/preference_util.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultation_booking_detail_bloc.freezed.dart';
part 'consultation_booking_detail_event.dart';
part 'consultation_booking_detail_state.dart';

class ConsultationBookingDetailBloc extends Bloc<ConsultationBookingDetailEvent,
    ConsultationBookingDetailState> {
  final OnboardingRepository onboardingRepository;
  final ConsultationRepository consultationRepository;
  final PreferenceUtil preferenceUtil;

  ConsultationBookingDetailBloc({required this.onboardingRepository, required this.consultationRepository, required this.preferenceUtil})
      : super(ConsultationBookingDetailState.initialize());

  @override
  Stream<ConsultationBookingDetailState> mapEventToState(
      ConsultationBookingDetailEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(consultation: e.consultation);
      if (e.consultation.status.toLowerCase() == 'cancelled' ||
          e.consultation.canBeCancelled) {
        add(ConsultationBookingDetailEvent.getConsultationCancellationInfo(
            e.consultation.id));
      }
    }, getConsultationCancellationInfo: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var response = await onboardingRepository
          .getTherapyCancellationDetail(e.consultationBookingId);
      print(response);
      yield* response.fold((error) async* {
        yield state.copyWith(
            loadingState: LoadingState.isCompleted, errorMessage: error);
      }, (cancellationInfoResp) async* {
        if (cancellationInfoResp.success) {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              cancellationInfo: cancellationInfoResp.cancellationInfo);
        } else {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              errorMessage: cancellationInfoResp.message ?? 'Unknown error');
        }
      });
    }, cancelConsultation: (e) async* {
      var consultationBookingId = state.consultation?.id ?? '';
      var doctorId = state.consultation?.doctorId ?? '';
      var doctorBookingId = state.consultation?.doctorBookingId ?? '';
      var totalAmount = state.cancellationInfo?.totalAmount ?? 0.0;
      var cancellationFee = state.cancellationInfo?.cancellationFee ?? 0.0;
      var refundAmount = state.cancellationInfo?.refundAmount ?? 00;
      var cancellationReason = e.reason;
      var scheduledAtDb = state.consultation?.scheduledAtDb ?? 0;
      var request = CancelConsultationRequest(
          doctorId,
          doctorBookingId,
          totalAmount,
          cancellationFee,
          refundAmount,
          cancellationReason,
          scheduledAtDb);
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var response = await onboardingRepository.cancelConsultation(
          consultationBookingId, request);
      print(response);
      yield* response.fold((error) async* {
        yield state.copyWith(
            loadingState: LoadingState.isCompleted, errorMessage: error);
      }, (cancelResp) async* {
        if (cancelResp.success) {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              cancelConsultationResult: response);
        } else {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              errorMessage: cancelResp.message ?? 'Unknown error');
        }
      });
    }, resetErrorMessage: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isCompleted, errorMessage: null);
    }, getRtcToken: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);
      var consultationBookingId = state.consultation?.id ?? '';
      var response = await consultationRepository.getRtcToken(consultationBookingId);
      print(response);
      yield* response.fold((error) async* {
        yield state.copyWith(
            loadingState: LoadingState.isCompleted, errorMessage: error);
      }, (rtcResp) async* {
        if (rtcResp.success) {
          var doctorToken = state.consultation?.doctorFcmToken ?? '';
          var doctorId = state.consultation?.doctorId ?? '';
          var doctorBookingId = state.consultation?.doctorBookingId ?? '';
          var patientName = state.consultation?.patientName ?? '';
          var userToken = await preferenceUtil.getFcmToken();
          await onboardingRepository.pushCallNotification(doctorToken, consultationBookingId, doctorId, patientName, doctorBookingId, userToken, e.callType);
          var rtcToken = rtcResp.token;
          var userId = await preferenceUtil.getUserId();
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              userId: userId,
              callType: e.callType,
              rtcToken: rtcToken);
        } else {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted,
              errorMessage: rtcResp.message ?? 'Unknown error');
        }
      });
    }, cleanRtcToken: (e) async* {
      yield state.copyWith(rtcToken: null, callType: null);
    });
  }
}
