import 'package:ayursh/domain/model/response/pricing_option_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_on_therapy.g.dart';

@JsonSerializable()
class AddOnTherapy {
  final String name;
  @JsonKey(name: 'english_name')
  final String? englishName;
  // final String headline;
  final String title;

  @JsonKey(name: 'session_options')
  final List<int> sessionOptions;
  @JsonKey(name: 'session_duration_in_min')
  final int? sessionDurationInMin;
  @JsonKey(name: 'price_per_session')
  final double? pricePerSession;
  @JsonKey(name: 'checkout_description')
  final String? checkoutDescription;
  @JsonKey(name: 'pricing_options')
  final List<PricingOptionModel> pricingOptions;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @JsonKey(name: 'add_on_price_pct')
  final double? addOnPricePct;
  @JsonKey(name: 'category')
  final String category;
  @JsonKey(name: 'price_per_session_per_knee')
  final double? pricePerSessionPerKnee;
  @JsonKey(name: 'price_per_session_both_knees')
  final double? pricePerSessionBothKnees;
  @JsonKey(name: 'session_duration_in_min_half_body')
  final int? sessionDurationInMinHalfBody;
  @JsonKey(name: 'price_per_session_half_body')
  final double? pricePerSessionHalfBody;
  @JsonKey(name: 'session_duration_in_min_full_body')
  final int? sessionDurationInMinFullBody;
  @JsonKey(name: 'price_per_session_full_body')
  final double? pricePerSessionFullBody;

  AddOnTherapy(
    this.name,
    this.englishName,
    // this.headline,
    this.title,
    this.sessionOptions,
    this.sessionDurationInMin,
    this.pricePerSession,
    this.category,
    this.pricingOptions,
    this.imageUrl,
    this.checkoutDescription,
    this.addOnPricePct,
    this.pricePerSessionBothKnees,
    this.pricePerSessionFullBody,
    this.pricePerSessionHalfBody,
    this.pricePerSessionPerKnee,
    this.sessionDurationInMinFullBody,
    this.sessionDurationInMinHalfBody,
  );

  factory AddOnTherapy.fromJson(Map<String, dynamic> json) =>
      _$AddOnTherapyFromJson(json);
  Map<String, dynamic> toJson() => _$AddOnTherapyToJson(this);
}
