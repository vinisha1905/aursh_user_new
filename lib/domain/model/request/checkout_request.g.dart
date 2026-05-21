// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutRequest _$CheckoutRequestFromJson(Map<String, dynamic> json) =>
    CheckoutRequest(
      json['razorpay_payment_id'] as String,
      json['razorpay_signature'] as String,
    );

Map<String, dynamic> _$CheckoutRequestToJson(CheckoutRequest instance) =>
    <String, dynamic>{
      'razorpay_payment_id': instance.razorpayPaymentId,
      'razorpay_signature': instance.razorpaySignature,
    };
