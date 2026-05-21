import 'package:ayursh/domain/model/request/finder_request.dart';
import 'package:ayursh/domain/model/response/blog_response.dart';
import 'package:ayursh/domain/model/response/book_therapy_time_response.dart';
import 'package:ayursh/domain/model/response/category_detail_response.dart';
import 'package:ayursh/domain/model/response/clinic_finder.dart';
import 'package:ayursh/domain/model/response/search_therapy_response.dart';
import 'package:ayursh/domain/model/response/terms_and_conditions_response.dart';
import 'package:ayursh/domain/model/response/therapy_category_response.dart';
import 'package:ayursh/domain/model/response/therapy_detail_response.dart';
import 'package:ayursh/domain/model/response/user_review_response.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'therapy_api_client.g.dart';

@RestApi(baseUrl: Constant.baseUrl + "therapy/api/v1/")
abstract class TherapyApiClient {
  factory TherapyApiClient(Dio dio, {String? baseUrl}) = _TherapyApiClient;

  @GET("categories")
  Future<TherapyCategoryResponse> getCategories();

  @GET("categories?system=physio")
  Future<TherapyCategoryResponse> getPhysioCategories();

  @GET("blog-posts")
  Future<BlogResponse> getBlogs();

  @GET("user-reviews")
  Future<UserReviewResponse> getUserReviews();

  @GET("category/all")
  Future<SearchTherapyResponse> searchTherapy(
      @Query("search_param") String keyword);

  @GET("category/{title}")
  Future<CategoryDetailResponse> getCategoryDetail(@Path("title") String title);

  @GET("category/{title}/therapy/{therapy_title}")
  Future<TherapyDetailResponse> getTherapyDetail(
      @Path("title") String categoryTitle,
      @Path("therapy_title") String therapyTitle);

  @POST("clinic/finder")
  Future<ClinicFinderResponse> getClinic(
      @Body() FinderBody request);

  @GET("terms-and-conditions")
  Future<TermsAndConditionsResponse> getTermsAndConditions();

  @GET("terms-and-conditions?system=physio")
  Future<TermsAndConditionsResponse> getPhysioTermsAndConditions();

  @GET("booking")
  Future<BookTherapyTimeResponse> getBookAppointmentSlot(
      @Query("patient_gender") String gender,
      @Query("session_duration_in_min") String sessionDurationInMin,
      @Query("patient_longitude") String patientLongitude,
      @Query("patient_latitude") String patientLatitude);
}
