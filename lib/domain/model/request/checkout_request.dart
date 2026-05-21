import 'package:json_annotation/json_annotation.dart';

part 'checkout_request.g.dart';

@JsonSerializable()
class CheckoutRequest {
  @JsonKey(name: 'razorpay_payment_id')
  final String razorpayPaymentId;
  @JsonKey(name: 'razorpay_signature')
  final String razorpaySignature;

  CheckoutRequest(this.razorpayPaymentId, this.razorpaySignature);

  factory CheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutRequestToJson(this);
}
