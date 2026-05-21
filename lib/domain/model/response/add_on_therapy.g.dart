// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_on_therapy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOnTherapy _$AddOnTherapyFromJson(Map<String, dynamic> json) => AddOnTherapy(
      json['name'] as String,
      json['english_name'] as String?,
      json['title'] as String,
      (json['session_options'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      (json['session_duration_in_min'] as num?)?.toInt(),
      (json['price_per_session'] as num?)?.toDouble(),
      json['category'] as String,
      (json['pricing_options'] as List<dynamic>)
          .map((e) => PricingOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['image_url'] as String,
      json['checkout_description'] as String?,
      (json['add_on_price_pct'] as num?)?.toDouble(),
      (json['price_per_session_both_knees'] as num?)?.toDouble(),
      (json['price_per_session_full_body'] as num?)?.toDouble(),
      (json['price_per_session_half_body'] as num?)?.toDouble(),
      (json['price_per_session_per_knee'] as num?)?.toDouble(),
      (json['session_duration_in_min_full_body'] as num?)?.toInt(),
      (json['session_duration_in_min_half_body'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddOnTherapyToJson(AddOnTherapy instance) =>
    <String, dynamic>{
      'name': instance.name,
      'english_name': instance.englishName,
      'title': instance.title,
      'session_options': instance.sessionOptions,
      'session_duration_in_min': instance.sessionDurationInMin,
      'price_per_session': instance.pricePerSession,
      'checkout_description': instance.checkoutDescription,
      'pricing_options': instance.pricingOptions,
      'image_url': instance.imageUrl,
      'add_on_price_pct': instance.addOnPricePct,
      'category': instance.category,
      'price_per_session_per_knee': instance.pricePerSessionPerKnee,
      'price_per_session_both_knees': instance.pricePerSessionBothKnees,
      'session_duration_in_min_half_body':
          instance.sessionDurationInMinHalfBody,
      'price_per_session_half_body': instance.pricePerSessionHalfBody,
      'session_duration_in_min_full_body':
          instance.sessionDurationInMinFullBody,
      'price_per_session_full_body': instance.pricePerSessionFullBody,
    };
