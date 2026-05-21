// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
      json['type'] as String?,
      json['status'] as String?,
      (json['amount_paid'] as num?)?.toDouble(),
      json['paid_on'] as String?,
      json['method'] as String?,
      (json['created_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'status': instance.status,
      'amount_paid': instance.amountPaid,
      'paid_on': instance.paidOn,
      'method': instance.method,
      'created_at': instance.createdAt,
    };
