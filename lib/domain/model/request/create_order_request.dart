import 'package:json_annotation/json_annotation.dart';

part 'create_order_request.g.dart';

@JsonSerializable()
class CreateOrderRequest {
  @JsonKey(name: 'total_sessions')
  final String? totalSessions;
  @JsonKey(name: 'price_per_session')
  final String? pricePerSession;
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @JsonKey(name: 'payment_mode')
  final String paymentMode;

  CreateOrderRequest(this.totalSessions, this.pricePerSession, this.totalAmount,
      this.paymentMode);

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderRequestToJson(this);
}
