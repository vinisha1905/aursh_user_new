import 'package:json_annotation/json_annotation.dart';

part 'consultation_cancellation_info_model.g.dart';

@JsonSerializable()
class ConsultationCancellationInfoModel {
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @JsonKey(name: 'cancellation_fee')
  final double cancellationFee;
  @JsonKey(name: 'refund_amount')
  final double refundAmount;

  ConsultationCancellationInfoModel(
      this.totalAmount, this.cancellationFee, this.refundAmount);

  factory ConsultationCancellationInfoModel.fromJson(
          Map<String, dynamic> json) =>
      _$ConsultationCancellationInfoModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConsultationCancellationInfoModelToJson(this);
}
