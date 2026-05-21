import 'package:ayursh/domain/model/response/consultation_note_model.dart';
import 'package:ayursh/domain/model/response/prefill_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consultation_create_order_model.g.dart';

@JsonSerializable()
class ConsultationCreateOrderModel {
  final String entity;
  final double amount;
  @JsonKey(name: 'amount_paid')
  final double amountPaid;
  @JsonKey(name: 'amount_due')
  final double amountDue;
  final String currency;
  final String receipt;
  @JsonKey(name: 'offer_id')
  final dynamic offerId;
  final String status;
  final int attempts;
  final ConsultationNoteModel notes;
  @JsonKey(name: 'razorpay_order_id')
  final String razorpayOrderId;
  @JsonKey(name: 'ayursh_order_id')
  final String ayurshOrderId;
  @JsonKey(name: 'razorpay_key')
  final String razorpayKey;
  final String name;
  final String description;
  final List<String> image;
  @JsonKey(name: 'callback_url')
  final String callbackUrl;
  final PrefillModel prefill;

  ConsultationCreateOrderModel(
      this.entity,
      this.amount,
      this.amountPaid,
      this.amountDue,
      this.currency,
      this.receipt,
      this.offerId,
      this.status,
      this.attempts,
      this.notes,
      this.razorpayOrderId,
      this.ayurshOrderId,
      this.razorpayKey,
      this.name,
      this.description,
      this.image,
      this.callbackUrl,
      this.prefill);

  factory ConsultationCreateOrderModel.fromJson(Map<String, dynamic> json) =>
      _$ConsultationCreateOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationCreateOrderModelToJson(this);
}
