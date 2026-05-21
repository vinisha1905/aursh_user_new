import 'package:ayursh/domain/api_client/payment_api_client.dart';
import 'package:ayursh/domain/model/request/checkout_request.dart';
import 'package:ayursh/domain/model/request/create_order_request.dart';
import 'package:ayursh/domain/model/response/checkout_response.dart';
import 'package:ayursh/domain/model/response/consultation_create_order_response.dart';
import 'package:ayursh/domain/model/response/default_response.dart';
import 'package:ayursh/domain/model/response/error_response.dart';
import 'package:ayursh/domain/model/response/therapy_create_order_response.dart';
import 'package:ayursh/domain/repository/payment_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentApiClient apiClient;

  PaymentRepositoryImpl(this.apiClient);

  @override
  Future<Either<String, ConsultationCreateOrderResponse>>
      createConsultationOrder(double totalAmount, String? totalSessions,
          String? pricePerSession) async {
    try {
      var response = await apiClient.createConsultationOrder(
        CreateOrderRequest(
            totalSessions, pricePerSession, totalAmount, "ONLINE"),
      );
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
  Future<Either<String, CheckoutResponse>> checkoutOrder(String receiptId,
      String razorpayPaymentId, String razorpaySignature) async {
    try {
      var response = await apiClient.checkoutOrder(
          receiptId, CheckoutRequest(razorpayPaymentId, razorpaySignature));
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
  Future<Either<String, DefaultResponse>> trackPayment(
      Map<String, dynamic> request) async {
    try {
      var response = await apiClient.trackPayment(request);
      return right(response);
    } catch (e) {
      if (e is DioError) {
        return left(e.message ?? 'Unknown error');
      }
      return left('Unknown error');
    }
  }

  @override
  Future<Either<String, TherapyCreateOrderResponse>> createTherapyOrder(
    double totalAmount,
    String? totalSessions,
    String? pricePerSession,
    bool isCOD,
  ) async {
    try {
      var response = await apiClient.createTherapyOrder(CreateOrderRequest(
        totalSessions,
        pricePerSession,
        totalAmount,
        isCOD ? "COD" : "ONLINE",
      ));
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
  Future<Either<String, CheckoutResponse>> checkoutTherapyOrder(
      String receiptId,
      String razorpayPaymentId,
      String razorpaySignature) async {
    try {
      var response = await apiClient.checkoutTherapyOrder(
          receiptId, CheckoutRequest(razorpayPaymentId, razorpaySignature));
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
