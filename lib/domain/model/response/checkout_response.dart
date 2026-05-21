import 'package:ayursh/domain/model/response/checkout_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checkout_response.g.dart';

@JsonSerializable()
class CheckoutResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final CheckoutModel checkoutModel;

  CheckoutResponse(
      this.success, this.errorCode, this.message, this.checkoutModel);

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutResponseToJson(this);
}
