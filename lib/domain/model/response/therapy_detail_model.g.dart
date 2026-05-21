// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyDetailModel _$TherapyDetailModelFromJson(Map<String, dynamic> json) =>
    TherapyDetailModel(
      json['name'] as String,
      json['english_name'] as String?,
      json['headline'] as String,
      json['title'] as String,
      (json['session_options'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      (json['session_duration_in_min'] as num?)?.toInt(),
      (json['price_per_session'] as num?)?.toDouble(),
      json['therapy_details'] == null
          ? null
          : TherapyDescriptionModel.fromJson(
              json['therapy_details'] as Map<String, dynamic>),
      (json['benefits'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['contraindications'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['how_it_is_done'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['category'] as String,
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductUsedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['pricing_options'] as List<dynamic>)
          .map((e) => PricingOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['image_url'] as String,
      json['checkout_description'] as String?,
      (json['session_duration_in_min_half_body'] as num?)?.toInt(),
      (json['price_per_session_half_body'] as num?)?.toDouble(),
      (json['session_duration_in_min_full_body'] as num?)?.toInt(),
      (json['price_per_session_full_body'] as num?)?.toDouble(),
      (json['price_per_session_per_knee'] as num?)?.toDouble(),
      (json['add_on_therapies'] as List<dynamic>)
          .map((e) => AddOnTherapy.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['price_per_session_baby_exclusive'] as num?)?.toDouble(),
      (json['price_per_session_baby_inclusive'] as num?)?.toDouble(),
      (json['session_duration_in_min_baby_exclusive'] as num?)?.toDouble(),
      (json['session_duration_in_min_baby_inclusive'] as num?)?.toDouble(),
      (json['session_duration_in_min_60min'] as num?)?.toDouble(),
      (json['price_per_session_both_knees'] as num?)?.toDouble(),
      (json['price_per_session_detox_massage_exclusive'] as num?)?.toDouble(),
      (json['price_per_session_detox_massage_inclusive'] as num?)?.toDouble(),
      (json['session_duration_in_min_detox_massage_exclusive'] as num?)
          ?.toDouble(),
      (json['session_duration_in_min_detox_massage_inclusive'] as num?)
          ?.toDouble(),
    );

Map<String, dynamic> _$TherapyDetailModelToJson(TherapyDetailModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'english_name': instance.englishName,
      'headline': instance.headline,
      'title': instance.title,
      'session_options': instance.sessionOptions,
      'session_duration_in_min': instance.sessionDurationInMin,
      'price_per_session': instance.pricePerSession,
      'therapy_details': instance.therapyDescription,
      'benefits': instance.benefits,
      'contraindications': instance.contraindications,
      'how_it_is_done': instance.howItIsDone,
      'products': instance.products,
      'pricing_options': instance.pricingOptions,
      'image_url': instance.imageUrl,
      'checkout_description': instance.checkoutDescription,
      'session_duration_in_min_half_body':
          instance.sessionDurationInMinHalfBody,
      'price_per_session_half_body': instance.pricePerSessionHalfBody,
      'session_duration_in_min_60min': instance.sessionDurationInMin60min,
      'session_duration_in_min_full_body':
          instance.sessionDurationInMinFullBody,
      'price_per_session_full_body': instance.pricePerSessionFullBody,
      'price_per_session_per_knee': instance.pricePerSessionPerKnee,
      'price_per_session_baby_exclusive': instance.pricePerSessionBabyExclusive,
      'session_duration_in_min_baby_exclusive':
          instance.sessionDurationInMinBabyExclusive,
      'price_per_session_baby_inclusive': instance.pricePerSessionBabyInclusive,
      'session_duration_in_min_baby_inclusive':
          instance.sessionDurationInMinBabyInclusive,
      'price_per_session_both_knees': instance.pricePerSessionBothKnees,
      'category': instance.category,
      'add_on_therapies': instance.addOnTherapies,
      'price_per_session_detox_massage_exclusive':
          instance.pricePerSessionDetoxMassageExclusive,
      'price_per_session_detox_massage_inclusive':
          instance.pricePerSessionDetoxMassageInclusive,
      'session_duration_in_min_detox_massage_exclusive':
          instance.sessionDurationInMinDetoxMassageExclusive,
      'session_duration_in_min_detox_massage_inclusive':
          instance.sessionDurationInMinDetoxMassageInclusive,
    };
