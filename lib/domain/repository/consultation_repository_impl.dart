import 'package:ayursh/domain/api_client/consultation_api_client.dart';
import 'package:ayursh/domain/model/response/book_appointment_response.dart';
import 'package:ayursh/domain/model/response/doctor_detail_response.dart';
import 'package:ayursh/domain/model/response/doctor_list_response.dart';
import 'package:ayursh/domain/model/response/error_response.dart';
import 'package:ayursh/domain/model/response/rtc_token_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'consultation_repository.dart';

class ConsultationRepositoryImpl implements ConsultationRepository {
  final ConsultationApiClient apiClient;

  ConsultationRepositoryImpl(this.apiClient);

  @override
  Future<Either<String, DoctorListResponse>> getDoctors() async {
    try {
      var response = await apiClient.getDoctors();
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
  Future<Either<String, DoctorListResponse>> searchDoctor(String keyword) async {
    try {
      var response = await apiClient.searchDoctor(keyword);
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
  Future<Either<String, DoctorDetailResponse>> getDoctorDetail(String id) async {
    try {
      var response = await apiClient.getDoctorDetail(id);
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
  Future<Either<String, BookAppointmentResponse>> getBookAppointmentSlot(String doctorId) async {
    try {
      var response = await apiClient.getBookAppointmentSlot(doctorId);
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
  Future<Either<String, RtcTokenResponse>> getRtcToken(String consultationBookingId) async {
    try {
      var response = await apiClient.getRtcToken(consultationBookingId);
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
