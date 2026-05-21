// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_create_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyCreateOrderModel _$TherapyCreateOrderModelFromJson(
        Map<String, dynamic> json) =>
    TherapyCreateOrderModel(
      json['entity'] as String,
      (json['amount'] as num).toDouble(),
      (json['amount_paid'] as num).toDouble(),
      (json['amount_due'] as num).toDouble(),
      json['currency'] as String,
      json['receipt'] as String,
      json['offer_id'],
      json['status'] as String,
      (json['attempts'] as num).toInt(),
      TherapyNoteModel.fromJson(json['notes'] as Map<String, dynamic>),
      json['razorpay_order_id'] as String,
      json['ayursh_order_id'] as String,
      json['razorpay_key'] as String,
      json['name'] as String,
      json['description'] as String,
      (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      json['callback_url'] as String,
      PrefillModel.fromJson(json['prefill'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TherapyCreateOrderModelToJson(
        TherapyCreateOrderModel instance) =>
    <String, dynamic>{
      'entity': instance.entity,
      'amount': instance.amount,
      'amount_paid': instance.amountPaid,
      'amount_due': instance.amountDue,
      'currency': instance.currency,
      'receipt': instance.receipt,
      'offer_id': instance.offerId,
      'status': instance.status,
      'attempts': instance.attempts,
      'notes': instance.notes,
      'razorpay_order_id': instance.razorpayOrderId,
      'ayursh_order_id': instance.ayurshOrderId,
      'razorpay_key': instance.razorpayKey,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'callback_url': instance.callbackUrl,
      'prefill': instance.prefill,
    };
