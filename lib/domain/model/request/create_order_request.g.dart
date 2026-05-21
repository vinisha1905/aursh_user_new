// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) =>
    CreateOrderRequest(
      json['total_sessions'] as String?,
      json['price_per_session'] as String?,
      (json['total_amount'] as num).toDouble(),
      json['payment_mode'] as String,
    );

Map<String, dynamic> _$CreateOrderRequestToJson(CreateOrderRequest instance) =>
    <String, dynamic>{
      'total_sessions': instance.totalSessions,
      'price_per_session': instance.pricePerSession,
      'total_amount': instance.totalAmount,
      'payment_mode': instance.paymentMode,
    };
