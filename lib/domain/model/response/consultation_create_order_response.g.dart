// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_create_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultationCreateOrderResponse _$ConsultationCreateOrderResponseFromJson(
        Map<String, dynamic> json) =>
    ConsultationCreateOrderResponse(
      json['success'] as bool,
      json['error_code'] as String?,
      json['message'] as String?,
      ConsultationCreateOrderModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConsultationCreateOrderResponseToJson(
        ConsultationCreateOrderResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.createOrderModel,
    };
