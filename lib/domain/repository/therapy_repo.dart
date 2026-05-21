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
import 'package:dartz/dartz.dart';

abstract class TherapyRepository {
  Future<Either<String, TherapyCategoryResponse>> getCategories();

  Future<Either<String, TherapyCategoryResponse>> getPhysioCategories();

  Future<Either<String, BlogResponse>> getBlogs();

  Future<Either<String, UserReviewResponse>> getUserReviews();

  Future<Either<String, SearchTherapyResponse>> searchTherapy(String keyword);

  Future<Either<String, CategoryDetailResponse>> getCategoryDetail(String title);

  Future<Either<String, TherapyDetailResponse>> getTherapyDetail(String categoryTitle, String therapyTitle);

  Future<Either<String, ClinicFinderResponse>> getClinic(FinderBody body);

  Future<Either<String, TermsAndConditionsResponse>> getTermsAndConditions();

  Future<Either<String, TermsAndConditionsResponse>> getPhysioTermsAndConditions();

  Future<Either<String, BookTherapyTimeResponse>> getBookAppointmentSlot(String gender, String sessionDurationInMin,String patientLongitude,String patientLatitude);
}
