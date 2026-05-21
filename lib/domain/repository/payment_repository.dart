import 'package:ayursh/domain/model/response/checkout_response.dart';
import 'package:ayursh/domain/model/response/consultation_create_order_response.dart';
import 'package:ayursh/domain/model/response/default_response.dart';
import 'package:ayursh/domain/model/response/therapy_create_order_response.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentRepository {
  Future<Either<String, ConsultationCreateOrderResponse>>
      createConsultationOrder(
          double totalAmount, String? totalSessions, String? pricePerSession);

  Future<Either<String, CheckoutResponse>> checkoutOrder(
      String receiptId, String razorpayPaymentId, String razorpaySignature);

  Future<Either<String, DefaultResponse>> trackPayment(
      Map<String, dynamic> request);

  Future<Either<String, TherapyCreateOrderResponse>> createTherapyOrder(
    double totalAmount,
    String? totalSessions,
    String? pricePerSession,
    bool isCOD,
  );

  Future<Either<String, CheckoutResponse>> checkoutTherapyOrder(
      String receiptId, String razorpayPaymentId, String razorpaySignature);
}
