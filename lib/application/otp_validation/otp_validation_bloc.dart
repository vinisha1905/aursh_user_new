import 'dart:async';

import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/otp_validation_response.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:ayursh/domain/util/preference_util.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_validation_bloc.freezed.dart';
part 'otp_validation_event.dart';
part 'otp_validation_state.dart';

class OtpValidationBloc extends Bloc<OtpValidationEvent, OtpValidationState> {
  final OnboardingRepository onboardingRepo;
  final PreferenceUtil preferenceUtil;

  OtpValidationBloc(
      {required this.onboardingRepo, required this.preferenceUtil})
      : super(OtpValidationState.initialize());

  @override
  Stream<OtpValidationState> mapEventToState(OtpValidationEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(
          loadingState: LoadingState.isInitial,
          phoneNumber: e.phoneNumber,
          userId: e.userId,
          smsTokenSessionId: e.smsTokenSessionId,
          aliveTime: Constant.otpLiveTime);
    }, submitOtp: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading, result: null);
      var response = await onboardingRepo.validateOtp('${state.phoneNumber}',
          state.userId ?? '', e.smsToken, state.smsTokenSessionId ?? '');
      yield* response.fold((error) async* {
        // print(error);
        yield state.copyWith(
            result: left(error), loadingState: LoadingState.isCompleted);
      }, (validateOtpResponse) async* {
        if (validateOtpResponse.success) {
          // facebookAppEvents.logCompletedRegistration();
          // print(loginResponse.toString());
          await preferenceUtil.saveUserId(state.userId ?? '');
          await preferenceUtil.savePhoneNumber(state.phoneNumber ?? '');
          yield state.copyWith(
              result: response, loadingState: LoadingState.isCompleted);
        } else {
          // print(loginResponse.message);
          yield state.copyWith(
              result: left(validateOtpResponse.message),
              loadingState: LoadingState.isCompleted);
        }
      });
    }, resendOtp: (e) async* {
      yield state.copyWith(
          loadingState: LoadingState.isLoading, aliveTime: null, result: null);
      var response = await onboardingRepo.login('${state.phoneNumber}');
      yield* response.fold((error) async* {
        yield state.copyWith(
            result: left(error),
            loadingState: LoadingState.isCompleted,
            aliveTime: null);
      }, (r) async* {
        yield state.copyWith(
          smsTokenSessionId: r.otpTokenModel?.smsTokenSessionId,
            loadingState: LoadingState.isCompleted,
            aliveTime: Constant.otpLiveTime);
      });
    }, countTime: (e) async* {
      if (state.aliveTime != null && state.aliveTime! > 0) {
        yield state.copyWith(aliveTime: state.aliveTime! - 1, result: null);
      } else {
        yield state.copyWith(aliveTime: null, result: null);
      }
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
