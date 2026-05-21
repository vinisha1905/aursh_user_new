// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricingOptionModel _$PricingOptionModelFromJson(Map<String, dynamic> json) =>
    PricingOptionModel(
      (json['old_price'] as num).toDouble(),
      (json['old_price_half_body'] as num).toDouble(),
      (json['offer_price'] as num).toDouble(),
      (json['offer_price_half_body'] as num).toDouble(),
      (json['you_save'] as num).toDouble(),
      (json['offers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['you_save_half_body'] as num).toDouble(),
      (json['you_save_pct'] as num).toDouble(),
      (json['travel_expense'] as num).toDouble(),
      (json['service_charge'] as num).toDouble(),
      (json['service_charge_half_body'] as num).toDouble(),
      (json['total'] as num).toDouble(),
      (json['total_half_body'] as num).toDouble(),
      (json['old_price_option1'] as num).toDouble(),
      (json['old_price_option2'] as num).toDouble(),
      (json['old_price_option3'] as num).toDouble(),
      (json['offer_price_option1'] as num).toDouble(),
      (json['offer_price_option2'] as num).toDouble(),
      (json['offer_price_option3'] as num).toDouble(),
      (json['you_save_option1'] as num).toDouble(),
      (json['you_save_option2'] as num).toDouble(),
      (json['you_save_option3'] as num).toDouble(),
      (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$PricingOptionModelToJson(PricingOptionModel instance) =>
    <String, dynamic>{
      'old_price': instance.oldPrice,
      'old_price_half_body': instance.oldPriceHalfBody,
      'offer_price': instance.offerPrice,
      'offer_price_half_body': instance.offerPriceHalfBody,
      'you_save': instance.youSave,
      'you_save_half_body': instance.youSaveHalfBody,
      'you_save_pct': instance.youSavePct,
      'travel_expense': instance.travelExpense,
      'service_charge': instance.serviceCharge,
      'service_charge_half_body': instance.serviceChargeHalfBody,
      'total': instance.total,
      'total_half_body': instance.totalHalfBody,
      'count': instance.count,
      'offers': instance.offers,
      'old_price_option1': instance.oldPriceOption1,
      'old_price_option2': instance.oldPriceOption2,
      'old_price_option3': instance.oldPriceOption3,
      'offer_price_option1': instance.offerPriceOption1,
      'offer_price_option2': instance.offerPriceOption2,
      'offer_price_option3': instance.offerPriceOption3,
      'you_save_option1': instance.youSaveOption1,
      'you_save_option2': instance.youSaveOption2,
      'you_save_option3': instance.youSaveOption3,
    };
