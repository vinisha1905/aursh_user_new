import 'package:json_annotation/json_annotation.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentModel {
  final String? type;
  final String? status;
  @JsonKey(name: 'amount_paid')
  final double? amountPaid;
  @JsonKey(name: 'paid_on')
  final String? paidOn;
  final String? method;
  @JsonKey(name: 'created_at')
  final int? createdAt;


  PaymentModel(this.type, this.status, this.amountPaid, this.paidOn,
      this.method, this.createdAt);

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);
}
