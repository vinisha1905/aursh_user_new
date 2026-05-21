import 'package:ayursh/domain/model/request/cancel_consultation_request.dart';
import 'package:ayursh/domain/model/request/consultation_booking_request.dart';
import 'package:ayursh/domain/model/request/therapy_booking_cancel_request.dart';
import 'package:ayursh/domain/model/request/therapy_booking_next_request.dart';
import 'package:ayursh/domain/model/request/therapy_booking_request.dart';
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
import 'package:dartz/dartz.dart';

import '../model/request/therapy_booking_reschedule_request.dart';

abstract class OnboardingRepository {
  Future<Either<String, LoginResponse>> login(String phoneNumber);

  Future<Either<String, SignUpResponse>> signUp(
      String phoneNumber, String userName, String userEmail);

  Future<Either<String, OtpValidationResponse>> validateOtp(String phoneNumber,
      String userId, String smsToken, String smsTokenSessionId);

  Future<Either<String, ConfigResponse>> getConfigs();

  Future<Either<String, DoctorConsultationResponse>> getConsultationBookings();

  Future<Either<String, BookedTherapyResponse>> getBookedTherapies();

  Future<Either<String, ProfileResponse>> getUserProfile();

  Future<Either<String, DefaultResponse>> updateUserProfile(
      String name, String email);

  Future<Either<String, BookingUserResponse>> getBookingUsers(String doctorId);

  Future<Either<String, ConsultationBookingResponse>> bookDoctorConsultation(
      ConsultationBookingRequest request);

  Future<Either<String, BookedTherapyResponse>> getBookedTherapyDetail(
      String sessionId);

  Future<Either<String, DefaultResponse>> bookTherapy(
      TherapyBookingRequest request);

  Future<Either<String, ConsultationCancellationInfoResponse>>
      getTherapyCancellationDetail(String consultationBookingId);

  Future<Either<String, DefaultResponse>> cancelConsultation(
      String consultationBookingId, CancelConsultationRequest request);

  Future<Either<String, DefaultResponse>> rescheduleConsultation(
      String doctorId,
      String consultationBookingId,
      String doctorBookingId,
      String rescheduledAt);

  Future<Either<String, PaymentHistoryResponse>> getPaymentHistory();

  Future<Either<String, AboutUsResponse>> getAboutUs();

  Future<Either<String, DefaultResponse>> sendSupportMessage(
      String name, String email, String phoneNumber, String message);

  Future<Either<String, QuestionResponse>> getQuestion();

  Future<Either<String, AnswerResponse>> sendAnswer(List<int> answerIds);

  Future<Either<String, DefaultResponse>> updateLocation(
      Map<String, dynamic> data);

  Future<Either<String, DefaultResponse>> pushDoctorChatNotification(
      String doctorToken, String userName, String bookingId);

  Future<Either<String, DefaultResponse>> updateUserFcmToken(String fcmToken);

  Future<Either<String, DefaultResponse>> pushCallNotification(
      String doctorToken,
      String consultationBookingId,
      String doctorId,
      String patientName,
      String doctorBookingId,
      String userToken,
      String callType);

  Future<Either<String, DefaultResponse>> submitRateUs(
      String bookingId,
      int? therapyPoint,
      String? therapyDescription,
      int? therapistPoint,
      String? therapistDescription);

  Future<Either<String, DefaultResponse>> bookNextSession(
      TherapyBookingNextRequest request);

  Future<Either<String, DefaultResponse>> rescheduleSession(
      TherapyBookingRescheduleRequest request);

  Future<Either<String, DefaultResponse>> cancelBooking(
      TherapyBookingCancelRequest request);
}
