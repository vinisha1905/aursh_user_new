import 'dart:io';

import 'package:ayursh/domain/model/business/booked_therapy_info.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/request/therapy_booking_cancel_request.dart';
import 'package:ayursh/domain/model/response/booked_user_model.dart';
import 'package:ayursh/domain/model/response/session_model.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:ayursh/domain/util/preference_util.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booked_therapy_detail_bloc.freezed.dart';
part 'booked_therapy_detail_event.dart';
part 'booked_therapy_detail_state.dart';

class BookedTherapyDetailBloc
    extends Bloc<BookedTherapyDetailEvent, BookedTherapyDetailState> {
  final OnboardingRepository onboardingRepository;
  final PreferenceUtil prefs;

  BookedTherapyDetailBloc(
      {required this.onboardingRepository, required this.prefs})
      : super(BookedTherapyDetailState.initialize());

  @override
  Stream<BookedTherapyDetailState> mapEventToState(
      BookedTherapyDetailEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(
          loadingState: LoadingState.isCompleted,
          bookedTherapy: e.bookedTherapy);
    }, setExpandPreviousSession: (e) async* {
      yield state.copyWith(
          previousSessionExpanded: !state.previousSessionExpanded);
    }, refresh: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isInitial);
      var response = await onboardingRepository.getBookedTherapyDetail(
          state.bookedTherapy?.bookedTherapyModel.sessions.first.id ?? '');
      yield* response.fold((error) async* {
        print(error);
        yield state.copyWith(loadingState: LoadingState.isCompleted);
      }, (bookingsResponse) async* {
        if (bookingsResponse.success &&
            bookingsResponse.bookedUserModels != null &&
            bookingsResponse.bookedUserModels!.isNotEmpty) {
          var bookedTherapy;
          BookedUserModel bookedUserModel =
              bookingsResponse.bookedUserModels!.first;
          bookedUserModel.bookedTherapyModels.forEach((bookedTherapyModel) {
            if (bookedTherapyModel.sessions.first.id ==
                state.bookedTherapy!.bookedTherapyModel.sessions.first.id) {
              bookedTherapy = BookedTherapyInfo(
                  bookedUserModel.isNonConsultationBooking,
                  bookedUserModel.userId,
                  bookedTherapyModel,
                  bookedUserModel.nonConsultationTherapyBookingId,
                  bookedUserModel.consultationBookingId,
                  bookedUserModel.doctorBookingId);
            }
          });

          yield state.copyWith(
              bookedTherapy: bookedTherapy,
              loadingState: LoadingState.isCompleted);
        } else {
          yield state.copyWith(loadingState: LoadingState.isCompleted);
        }
      });
    },
        // showQrCode: (e) async* {
        //   yield state.copyWith(loadingState: LoadingState.isLoading);
        //   var qrType = e.isStart ? 'start' : 'end';
        //   var bookingId = e.session.therapistBookingId;
        //   var sessionId = e.session.id;
        //   var url = Constant.baseUrl +
        //       'onboarding/api/v1/therapy/booking/generate-session-token?period=$qrType&therapist_booking_id=$bookingId&therapy_booking_session_id=$sessionId';
        //   var filePath;
        //   var fileName = '${DateTime.now().millisecondsSinceEpoch}.jpeg';
        //   if(Platform.isAndroid) {
        //     filePath = '${(await pathProvider.getExternalStorageDirectory())!.path}/$fileName';
        //   } else {
        //     filePath = '${(await pathProvider.getTemporaryDirectory()).path}/$fileName';
        //   }
        //   await GetIt.I.get<Dio>().download(url, filePath);
        //   yield state.copyWith(isStart: e.isStart, session: e.session, qrFile: File(filePath), loadingState: LoadingState.isCompleted);
        // }, resetQrCode: (e) async* {
        //   yield state.copyWith(isStart: null, session: null, qrFile: null);
        // },

        resetOTP: (e) async* {
      yield state.copyWith(isStart: null, session: null);
    }, setDataChanged: (e) async* {
      yield state.copyWith(dataChanged: true);
    }, generateOTP: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isLoading);

      try {
        String token = "Bearer " + await prefs.getAccessToken();
        var type = e.isStart ? 'start' : 'end';
        var bookingId = e.session.therapistBookingId;
        var sessionId = e.session.id;
        var url = Constant.baseUrl +
            'onboarding/api/v1/therapy/booking/generate-session-token-otp?period=$type&therapy_booking_session_id=$sessionId&therapist_booking_id=$bookingId';

        await Dio().get(url,
            options: Options(headers: {
              "Authorization": token,
            }));

        yield state.copyWith(
            isStart: e.isStart,
            session: e.session,
            loadingState: LoadingState.isCompleted);
      } catch (exception) {
        yield state.copyWith(
            otpError: "Failed to send OTP!",
            loadingState: LoadingState.isCompleted);
      }
    }, cancelBooking: (e) async* {
      var sessionInfo = state.bookedTherapy!.bookedTherapyModel.sessions
          .firstWhere((element) =>
              element.sessionNo ==
              state.bookedTherapy!.bookedTherapyModel.recentSession);
      var therapyBookingSessionId = sessionInfo.id;
      var therapistBookingId = sessionInfo.therapistBookingId;
      var cancelReason = 'CUSTOMER_CANCELLED';
      var cancelRequest = TherapyBookingCancelRequest(
          therapyBookingSessionId, therapistBookingId, cancelReason);
      var response = await onboardingRepository.cancelBooking(cancelRequest);
      yield* response.fold((l) async* {
        yield state.copyWith(loadingState: LoadingState.isCompleted);
      }, (bookTherapyRsp) async* {
        if (bookTherapyRsp.success) {
          yield state.copyWith(
              loadingState: LoadingState.isCompleted, bookingCanceled: true);
        } else {
          yield state.copyWith(
            loadingState: LoadingState.isCompleted,
          );
        }
      });
    });
  }
}
