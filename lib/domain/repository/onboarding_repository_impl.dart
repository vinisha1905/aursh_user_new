import 'dart:developer';
import 'dart:io';

import 'package:ayursh/domain/api_client/onboarding_api_client.dart';
import 'package:ayursh/domain/model/request/answer_request.dart';
import 'package:ayursh/domain/model/request/audio_call_request.dart';
import 'package:ayursh/domain/model/request/audio_call_request_data.dart';
import 'package:ayursh/domain/model/request/cancel_consultation_request.dart';
import 'package:ayursh/domain/model/request/chat_request.dart';
import 'package:ayursh/domain/model/request/chat_request_data.dart';
import 'package:ayursh/domain/model/request/login_request.dart';
import 'package:ayursh/domain/model/request/otp_validation_request.dart';
import 'package:ayursh/domain/model/request/rate_us_request.dart';
import 'package:ayursh/domain/model/request/reschedule_consultation_request.dart';
import 'package:ayursh/domain/model/request/sign_up_request.dart';
import 'package:ayursh/domain/model/request/support_request.dart';
import 'package:ayursh/domain/model/request/therapy_booking_cancel_request.dart';
import 'package:ayursh/domain/model/request/therapy_booking_next_request.dart';
import 'package:ayursh/domain/model/request/therapy_booking_request.dart';
import 'package:ayursh/domain/model/request/therapy_booking_reschedule_request.dart';
import 'package:ayursh/domain/model/request/update_fcm_token_request.dart';
import 'package:ayursh/domain/model/request/update_location_request.dart';
import 'package:ayursh/domain/model/request/update_profile_request.dart';
import 'package:ayursh/domain/model/response/about_us_response.dart';
import 'package:ayursh/domain/model/response/answer_response.dart';
import 'package:ayursh/domain/model/response/booked_therapy_response.dart';
import 'package:ayursh/domain/model/response/booking_user_response.dart';
import 'package:ayursh/domain/model/response/config_response.dart';
import 'package:ayursh/domain/model/response/consultation_booking_response.dart';
import 'package:ayursh/domain/model/response/consultation_cancellation_info_response.dart';
import 'package:ayursh/domain/model/response/default_response.dart';
import 'package:ayursh/domain/model/response/doctor_consultation_response.dart';
import 'package:ayursh/domain/model/response/error_response.dart';
import 'package:ayursh/domain/model/response/login_response.dart';
import 'package:ayursh/domain/model/response/otp_validation_response.dart';
import 'package:ayursh/domain/model/response/payment_history_response.dart';
import 'package:ayursh/domain/model/response/profile_response.dart';
import 'package:ayursh/domain/model/response/question_response.dart';
import 'package:ayursh/domain/model/response/sign_up_response.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingApiClient apiClient;

  OnboardingRepositoryImpl(this.apiClient);

  @override
  Future<Either<String, LoginResponse>> login(String phoneNumber) async {
    try {
      var loginResponse = await apiClient.login(LoginRequest(phoneNumber: phoneNumber, loginMethod: Platform.isIOS ? "ios" : "android"));
      print(loginResponse.toString());
      return right(loginResponse);
    } catch (e) {
      print(e);
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, SignUpResponse>> signUp(String phoneNumber, String userName, String userEmail) async {
    try {
      var signUpResponse = await apiClient
          .signUp(SignUpRequest(isIOSRegistration: Platform.isIOS, phoneNumber: phoneNumber, userName: userName, userEmail: userEmail));
      print(signUpResponse.toString());
      return right(signUpResponse);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, OtpValidationResponse>> validateOtp(String phoneNumber, String userId, String smsToken, String smsTokenSessionId) async {
    try {
      var otpValidationResponse = await apiClient
          .validateOtp(OtpValidationRequest(phoneNumber: phoneNumber, userId: userId, smsToken: smsToken, smsTokenSessionId: smsTokenSessionId));
      print(otpValidationResponse.toString());
      return right(otpValidationResponse);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, ConfigResponse>> getConfigs() async {
    try {
      var response = await apiClient.getConfigs();
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, DoctorConsultationResponse>> getConsultationBookings() async {
    try {
      var response = await apiClient.getConsultationBookings();
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, BookedTherapyResponse>> getBookedTherapies() async {
    try {
      var response = await apiClient.getBookedTherapies();
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, ProfileResponse>> getUserProfile() async {
    try {
      var response = await apiClient.getUserProfile();
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, DefaultResponse>> updateUserProfile(String name, String email) async {
    try {
      var response = await apiClient.updateUserProfile(UpdateProfileRequest(name, email));
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, BookingUserResponse>> getBookingUsers(String doctorId) async {
    try {
      var response = await apiClient.getBookingUsers(doctorId);
      print("ayursh booking therapy ${response.bookingUsers}");
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, ConsultationBookingResponse>> bookDoctorConsultation(request) async {
    try {
      var response = await apiClient.bookDoctorConsultation(request);
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, BookedTherapyResponse>> getBookedTherapyDetail(String sessionId) async {
    try {
      var response = await apiClient.getBookedTherapyDetail(sessionId);
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, DefaultResponse>> bookTherapy(TherapyBookingRequest request) async {
    try {
      var response = await apiClient.bookTherapy(request);
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, ConsultationCancellationInfoResponse>> getTherapyCancellationDetail(String consultationBookingId) async {
    try {
      var response = await apiClient.getTherapyCancellationDetail(consultationBookingId);
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, DefaultResponse>> rescheduleConsultation(
      String doctorId, String consultationBookingId, String doctorBookingId, String rescheduledAt) async {
    try {
      var response =
          await apiClient.rescheduleConsultation(RescheduleConsultationRequest(doctorId, rescheduledAt, consultationBookingId, doctorBookingId));
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, DefaultResponse>> cancelConsultation(String consultationBookingId, CancelConsultationRequest request) async {
    try {
      var response = await apiClient.cancelConsultation(consultationBookingId, request);
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, PaymentHistoryResponse>> getPaymentHistory() async {
    try {
      var response = await apiClient.getPaymentHistory();
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, AboutUsResponse>> getAboutUs() async {
    try {
      var response = await apiClient.getAboutUs();
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, DefaultResponse>> sendSupportMessage(String name, String email, String phoneNumber, String message) async {
    try {
      var response = await apiClient.sendSupportMessage(SupportRequest(name, phoneNumber, email, message));
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, QuestionResponse>> getQuestion() async {
    try {
      var response = await getQuestionResponse();
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  Future<QuestionResponse> getQuestionResponse() async {
    var _dio = GetIt.instance.get<Dio>();
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<QuestionResponse>(
        Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, 'prakruti', queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: 'https://prod.ayursh.com/onboarding/api/v1/')));
    final value = QuestionResponse.fromJson(_result.data!);
    return value;
  }

  Future<AnswerResponse> sendQuizAnswer(request) async {
    var _dio = GetIt.instance.get<Dio>();
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<AnswerResponse>(
        Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, 'prakruti', queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: 'https://prod.ayursh.com/onboarding/api/v1/')));
    final value = AnswerResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic && !(requestOptions.responseType == ResponseType.bytes || requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  @override
  Future<Either<String, AnswerResponse>> sendAnswer(List<int> answerIds) async {
    try {
      var response = await sendQuizAnswer(AnswerRequest(answerIds));
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, DefaultResponse>> updateLocation(Map<String, dynamic> data) async {
    try {
      var response = await apiClient.updateLocation(UpdateLocationRequest(data));
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, DefaultResponse>> pushDoctorChatNotification(String doctorToken, String userName, String bookingId) async {
    try {
      var response = await apiClient.pushDoctorChatNotification(ChatRequest(doctorToken, ChatRequestData('Text Message', userName, bookingId)));
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, DefaultResponse>> updateUserFcmToken(String fcmToken) async {
    try {
      var response = await apiClient.updateUserFcmToken(UpdateFcmTokenRequest(fcmToken));
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, DefaultResponse>> pushCallNotification(String doctorToken, String consultationBookingId, String doctorId, String patientName,
      String doctorBookingId, String userToken, String callType) async {
    try {
      var message = {
        "message": {
          "token": doctorToken,
          "data": {
            "title": callType,
            "channel": consultationBookingId,
            "toUser": doctorId,
            "user": patientName,
            "booking_id": doctorBookingId,
            "fcm": userToken,
            "type": "remoteinvitationrecieved",
            "time": (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString()
          }
        }
      };
      log('message -> ${message}');
      var response = await apiClient.pushAudioCallNotification(message);
      log('message -> ${response.toJson()}');
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, DefaultResponse>> submitRateUs(
      String bookingId, int? therapyPoint, String? therapyDescription, int? therapistPoint, String? therapistDescription) async {
    try {
      var request = RateUsRequest(therapyPoint, therapyDescription, therapistPoint, therapistDescription);
      var response = await apiClient.submitRateUs(bookingId, request);
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, DefaultResponse>> bookNextSession(TherapyBookingNextRequest request) async {
    try {

      var response = await apiClient.bookNextSession(request);
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, DefaultResponse>> rescheduleSession(TherapyBookingRescheduleRequest request) async {
    try {
      var response = await apiClient.rescheduleSession(request);
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, DefaultResponse>> cancelBooking(TherapyBookingCancelRequest request) async {
    try {
      var response = await apiClient.cancelBooking(request);
      return right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }
}
