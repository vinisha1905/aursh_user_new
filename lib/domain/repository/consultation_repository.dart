import 'package:ayursh/domain/model/response/book_appointment_response.dart';
import 'package:ayursh/domain/model/response/doctor_detail_response.dart';
import 'package:ayursh/domain/model/response/doctor_list_response.dart';
import 'package:ayursh/domain/model/response/rtc_token_response.dart';
import 'package:dartz/dartz.dart';

abstract class ConsultationRepository {
  Future<Either<String, DoctorListResponse>> getDoctors();
  Future<Either<String, DoctorListResponse>> searchDoctor(String keyword);
  Future<Either<String, DoctorDetailResponse>> getDoctorDetail(String id);
  Future<Either<String, BookAppointmentResponse>> getBookAppointmentSlot(String doctorId);
  Future<Either<String, RtcTokenResponse>> getRtcToken(String consultationBookingId);
}
