import 'package:ayursh/domain/model/request/checkout_request.dart';
import 'package:ayursh/domain/model/request/create_order_request.dart';
import 'package:ayursh/domain/model/response/checkout_response.dart';
import 'package:ayursh/domain/model/response/consultation_create_order_response.dart';
import 'package:ayursh/domain/model/response/default_response.dart';
import 'package:ayursh/domain/model/response/therapy_create_order_response.dart';
import 'package:ayursh/domain/util/custom_print.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_api_client.g.dart';

@RestApi(baseUrl: Constant.baseUrl + "payment/api/v1/")
abstract class PaymentApiClient {
  factory PaymentApiClient(Dio dio, {String? baseUrl}) = _PaymentApiClient;

  @POST("consultation/create-order")
  Future<ConsultationCreateOrderResponse> createConsultationOrder(
      @Body() CreateOrderRequest request);

  @POST("pub/consultation/checkout-order")
  Future<CheckoutResponse> checkoutOrder(@Query("receipt_id") String receiptId, @Body() CheckoutRequest request);

  @POST("test-payments")
  Future<DefaultResponse> trackPayment(@Body() Map<String, dynamic> request);

  @POST("therapy/create-order")
  Future<TherapyCreateOrderResponse> createTherapyOrder(
      @Body() CreateOrderRequest request);

  @POST("pub/therapy/checkout-order")
  Future<CheckoutResponse> checkoutTherapyOrder(@Query("receipt_id") String receiptId, @Body() CheckoutRequest request);
}
