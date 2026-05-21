import 'package:ayursh/domain/model/response/therapy_create_order_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'therapy_create_order_response.g.dart';

@JsonSerializable()
class TherapyCreateOrderResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final TherapyCreateOrderModel createOrderModel;

  TherapyCreateOrderResponse(
      this.success, this.errorCode, this.message, this.createOrderModel);

  factory TherapyCreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$TherapyCreateOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TherapyCreateOrderResponseToJson(this);
}
