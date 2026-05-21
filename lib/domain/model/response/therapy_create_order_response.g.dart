// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_create_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyCreateOrderResponse _$TherapyCreateOrderResponseFromJson(
        Map<String, dynamic> json) =>
    TherapyCreateOrderResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      TherapyCreateOrderModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TherapyCreateOrderResponseToJson(
        TherapyCreateOrderResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.createOrderModel,
    };
