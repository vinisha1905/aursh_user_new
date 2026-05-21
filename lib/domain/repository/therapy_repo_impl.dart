import 'dart:developer';

import 'package:ayursh/domain/api_client/therapy_api_client.dart';
import 'package:ayursh/domain/model/request/finder_request.dart';
import 'package:ayursh/domain/model/response/blog_response.dart';
import 'package:ayursh/domain/model/response/book_therapy_time_response.dart';
import 'package:ayursh/domain/model/response/category_detail_response.dart';
import 'package:ayursh/domain/model/response/clinic_finder.dart';
import 'package:ayursh/domain/model/response/error_response.dart';
import 'package:ayursh/domain/model/response/search_therapy_response.dart';
import 'package:ayursh/domain/model/response/terms_and_conditions_response.dart';
import 'package:ayursh/domain/model/response/therapy_category_response.dart';
import 'package:ayursh/domain/model/response/therapy_detail_response.dart';
import 'package:ayursh/domain/model/response/user_review_response.dart';
import 'package:ayursh/domain/repository/therapy_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TherapyRepositoryImpl implements TherapyRepository {
  final TherapyApiClient apiClient;

  TherapyRepositoryImpl(this.apiClient);

  @override
  Future<Either<String, TherapyCategoryResponse>> getCategories() async {
    try {
      var response = await apiClient.getCategories();
      return right(response);
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
  Future<Either<String, BlogResponse>> getBlogs() async {
    try {
      var response = await apiClient.getBlogs();
      return right(response);
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
  Future<Either<String, UserReviewResponse>> getUserReviews() async {
    try {
      var response = await apiClient.getUserReviews();
      return right(response);
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
  Future<Either<String, SearchTherapyResponse>> searchTherapy(
      String keyword) async {
    try {
      var response = await apiClient.searchTherapy(keyword);
      return right(response);
    } catch (e) {
      print(e);
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, CategoryDetailResponse>> getCategoryDetail(
      String title) async {
    try {
      var response = await apiClient.getCategoryDetail(title);
      print(
          "get category detail response - ${response.categories[0].therapies[0].category}");
      return right(response);
    } catch (e) {
      print(e);
      if (e is DioError) {
        if (e.response?.data != null && e.response?.data is Map) {
          var errorResponse = ErrorResponse.fromJson(e.response!.data);
          log("API ERROR :: ${e.response?.data}");
          return left(errorResponse.message);
        }
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, TherapyDetailResponse>> getTherapyDetail(
      String categoryTitle, String therapyTitle) async {
    try {
      var response =
          await apiClient.getTherapyDetail(categoryTitle, therapyTitle);

      print("response in getTherapyDetail: ${response.therapyDetail.category}");
      return right(response);
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
  Future<Either<String, ClinicFinderResponse>> getClinic(
      FinderBody body) async {
    try {
      var response = await apiClient.getClinic(body);
      print("response in getTherapyDetail: ${response.message}");
      return right(response);
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
  Future<Either<String, TermsAndConditionsResponse>>
      getTermsAndConditions() async {
    try {
      var response = await apiClient.getTermsAndConditions();
      return right(response);
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
  Future<Either<String, TermsAndConditionsResponse>>
      getPhysioTermsAndConditions() async {
    try {
      var response = await apiClient.getPhysioTermsAndConditions();
      return right(response);
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
  Future<Either<String, BookTherapyTimeResponse>> getBookAppointmentSlot(
      String gender, String sessionDurationInMin,String patientLongitude,String patientLatitude) async {
    try {
      var response =
          await apiClient.getBookAppointmentSlot(gender, sessionDurationInMin,patientLongitude,patientLatitude);
      return right(response);
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
  Future<Either<String, TherapyCategoryResponse>> getPhysioCategories() async {
    try {
      var response = await apiClient.getPhysioCategories();
      return right(response);
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
}
