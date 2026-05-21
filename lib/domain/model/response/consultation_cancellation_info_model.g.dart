// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_cancellation_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultationCancellationInfoModel _$ConsultationCancellationInfoModelFromJson(
        Map<String, dynamic> json) =>
    ConsultationCancellationInfoModel(
      (json['total_amount'] as num).toDouble(),
      (json['cancellation_fee'] as num).toDouble(),
      (json['refund_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$ConsultationCancellationInfoModelToJson(
        ConsultationCancellationInfoModel instance) =>
    <String, dynamic>{
      'total_amount': instance.totalAmount,
      'cancellation_fee': instance.cancellationFee,
      'refund_amount': instance.refundAmount,
    };
