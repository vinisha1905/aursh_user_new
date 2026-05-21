// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentHistoryResponse _$PaymentHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentHistoryResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentHistoryResponseToJson(
        PaymentHistoryResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.payments,
    };
