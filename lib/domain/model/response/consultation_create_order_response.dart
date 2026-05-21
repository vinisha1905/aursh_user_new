import 'package:ayursh/domain/model/response/consultation_create_order_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consultation_create_order_response.g.dart';

@JsonSerializable()
class ConsultationCreateOrderResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final ConsultationCreateOrderModel createOrderModel;

  ConsultationCreateOrderResponse(
      this.success, this.errorCode, this.message, this.createOrderModel);

  factory ConsultationCreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$ConsultationCreateOrderResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConsultationCreateOrderResponseToJson(this);
}
