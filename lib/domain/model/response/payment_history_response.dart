import 'package:ayursh/domain/model/response/payment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_history_response.g.dart';

@JsonSerializable()
class PaymentHistoryResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final List<PaymentModel>? payments;

  PaymentHistoryResponse(
      this.success, this.errorCode, this.message, this.payments);

  factory PaymentHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentHistoryResponseToJson(this);
}
