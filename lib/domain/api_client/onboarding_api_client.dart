import 'dart:developer';

import 'package:ayursh/domain/model/request/answer_request.dart';
import 'package:ayursh/domain/model/request/audio_call_request.dart';
import 'package:ayursh/domain/model/request/cancel_consultation_request.dart';
import 'package:ayursh/domain/model/request/chat_request.dart';
import 'package:ayursh/domain/model/request/consultation_booking_request.dart';
import 'package:ayursh/domain/model/request/login_request.dart';
import 'package:ayursh/domain/model/request/otp_validation_request.dart';
import 'package:ayursh/domain/model/request/rate_us_request.dart';
import 'package:ayursh/domain/model/request/reschedule_consultation_request.dart';
import 'package:ayursh/domain/model/request/sign_up_request.dart';
import 'package:ayursh/domain/model/request/support_request.dart';
import 'package:ayursh/domain/model/request/therapy_booking_cancel_request.dart';
import 'package:ayursh/domain/model/request/therapy_booking_next_request.dart';
import 'package:ayursh/domain/model/request/therapy_booking_request.dart';
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
import 'package:ayursh/domain/model/response/login_response.dart';
import 'package:ayursh/domain/model/response/otp_validation_response.dart';
import 'package:ayursh/domain/model/response/payment_history_response.dart';
import 'package:ayursh/domain/model/response/profile_response.dart';
import 'package:ayursh/domain/model/response/question_response.dart';
import 'package:ayursh/domain/model/response/sign_up_response.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/request/therapy_booking_reschedule_request.dart';

part 'onboarding_api_client.g.dart';

@RestApi(baseUrl: Constant.baseUrl + "onboarding/api/v1/")
abstract class OnboardingApiClient {
  factory OnboardingApiClient(Dio dio, {String? baseUrl}) =
      _OnboardingApiClient;

  @POST("login")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST("register")
  Future<SignUpResponse> signUp(@Body() SignUpRequest signUpRequest);

  @POST("validate-token")
  Future<OtpValidationResponse> validateOtp(
      @Body() OtpValidationRequest otpValidationRequest);

  @GET("configs")
  Future<ConfigResponse> getConfigs();

  @GET("consultation/bookings")
  Future<DoctorConsultationResponse> getConsultationBookings();

  @GET("therapy/bookings")
  Future<BookedTherapyResponse> getBookedTherapies();

  @GET("user-details")
  Future<ProfileResponse> getUserProfile();

  @PATCH("user-details")
  Future<DefaultResponse> updateUserProfile(
      @Body() UpdateProfileRequest request);

  @GET("booking-user-profiles")
  Future<BookingUserResponse> getBookingUsers(
      @Query("doctor_id") String doctorId);

  @POST("consultation/bookings")
  Future<ConsultationBookingResponse> bookDoctorConsultation(
      @Body() ConsultationBookingRequest request);

  @GET("therapy/booking/session/{session_id}")
  Future<BookedTherapyResponse> getBookedTherapyDetail(
      @Path("session_id") String sessionId);

  @POST("therapy/book-therapy")
  Future<DefaultResponse> bookTherapy(@Body() TherapyBookingRequest request);

  @GET("consultation/booking/{consultation_booking_id}/cancel")
  Future<ConsultationCancellationInfoResponse> getTherapyCancellationDetail(
      @Path("consultation_booking_id") String consultationBookingId);

  @POST("consultation/booking/{consultation_booking_id}/cancel")
  Future<DefaultResponse> cancelConsultation(
      @Path("consultation_booking_id") String consultationBookingId,
      @Body() CancelConsultationRequest request);

  @PATCH("consultation/bookings")
  Future<DefaultResponse> rescheduleConsultation(
      @Body() RescheduleConsultationRequest request);

  @GET("payments")
  Future<PaymentHistoryResponse> getPaymentHistory();

  @GET("about-ayursh")
  Future<AboutUsResponse> getAboutUs();

  @POST("support")
  Future<DefaultResponse> sendSupportMessage(@Body() SupportRequest request);

  @GET("prakruti")
  Future<QuestionResponse> getQuestion();

  @POST("prakruti")
  Future<AnswerResponse> sendAnswer(@Body() AnswerRequest request);

  @POST("location")
  Future<DefaultResponse> updateLocation(@Body() UpdateLocationRequest request);

  @POST("fcm/send")
  Future<DefaultResponse> pushDoctorChatNotification(
      @Body() ChatRequest request);

  @POST("fcm")
  Future<DefaultResponse> updateUserFcmToken(
      @Body() UpdateFcmTokenRequest request);

  @POST("fcm/send")
  Future<DefaultResponse> pushAudioCallNotification(
      @Body() Map<String, Map<String, Object>> request);

  @POST("therapy/booking/{booking_id}/feedback")
  Future<DefaultResponse> submitRateUs(
      @Path('booking_id') String bookingId, @Body() RateUsRequest request);

  @PATCH("therapy/book-therapy")
  Future<DefaultResponse> bookNextSession(
      @Body() TherapyBookingNextRequest request);

  @POST("therapy/reschedule")
  Future<DefaultResponse> rescheduleSession(
      @Body() TherapyBookingRescheduleRequest request);

  @POST("therapy/cancel")
  Future<DefaultResponse> cancelBooking(
      @Body() TherapyBookingCancelRequest request);
}
