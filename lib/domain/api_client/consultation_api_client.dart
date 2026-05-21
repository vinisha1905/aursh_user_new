import 'package:ayursh/domain/model/response/book_appointment_response.dart';
import 'package:ayursh/domain/model/response/doctor_detail_response.dart';
import 'package:ayursh/domain/model/response/doctor_list_response.dart';
import 'package:ayursh/domain/model/response/rtc_token_response.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'consultation_api_client.g.dart';

@RestApi(baseUrl: Constant.baseUrl + "consultation/api/v1/")
abstract class ConsultationApiClient {
  factory ConsultationApiClient(Dio dio, {String? baseUrl}) = _ConsultationApiClient;

  @GET("list-doctors")
  Future<DoctorListResponse> getDoctors();

  @GET("list-doctors")
  Future<DoctorListResponse> searchDoctor(@Query("search_param") String keyword);

  @GET("doctor/{id}")
  Future<DoctorDetailResponse> getDoctorDetail(@Path("id") String id);

  @GET("book-doctor")
  Future<BookAppointmentResponse> getBookAppointmentSlot(@Query("doctor_id") String doctorId);

  @GET("rtc/token")
  Future<RtcTokenResponse> getRtcToken(@Query("channel_name") String consultationBookingId);
}
