import 'package:ayursh/domain/model/response/add_on_therapy.dart';
import 'package:ayursh/domain/model/response/pricing_option_model.dart';
import 'package:ayursh/domain/model/response/product_used_model.dart';
//import 'package:ayursh/domain/model/response/selection_option_model.dart';
import 'package:ayursh/domain/model/response/therapy_description_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'therapy_detail_model.g.dart';

@JsonSerializable()
class TherapyDetailModel {
  final String name;
  @JsonKey(name: 'english_name')
  final String? englishName;
  final String headline;
  final String title;
  @JsonKey(name: 'session_options')
  final List<int> sessionOptions;
  @JsonKey(name: 'session_duration_in_min')
  final int? sessionDurationInMin;
  @JsonKey(name: 'price_per_session')
  final double? pricePerSession;
  @JsonKey(name: 'therapy_details')
  final TherapyDescriptionModel? therapyDescription;
  final List<String>? benefits;
  final List<String>? contraindications;
  @JsonKey(name: 'how_it_is_done')
  final List<String>? howItIsDone;
  final List<ProductUsedModel>? products;
  @JsonKey(name: 'pricing_options')
  final List<PricingOptionModel> pricingOptions;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @JsonKey(name: 'checkout_description')
  final String? checkoutDescription;
  @JsonKey(name: 'session_duration_in_min_half_body')
  final int? sessionDurationInMinHalfBody;
  @JsonKey(name: 'price_per_session_half_body')
  final double? pricePerSessionHalfBody;
  @JsonKey(name: 'session_duration_in_min_60min')
  final double? sessionDurationInMin60min;
  @JsonKey(name: 'session_duration_in_min_full_body')
  final int? sessionDurationInMinFullBody;
  @JsonKey(name: 'price_per_session_full_body')
  final double? pricePerSessionFullBody;
  @JsonKey(name: 'price_per_session_per_knee')
  final double? pricePerSessionPerKnee;
  @JsonKey(name: 'price_per_session_baby_exclusive')
  final double? pricePerSessionBabyExclusive;
  @JsonKey(name: 'session_duration_in_min_baby_exclusive')
  final double? sessionDurationInMinBabyExclusive;
  @JsonKey(name: 'price_per_session_baby_inclusive')
  final double? pricePerSessionBabyInclusive;
  @JsonKey(name: 'session_duration_in_min_baby_inclusive')
  final double? sessionDurationInMinBabyInclusive;
  @JsonKey(name: 'price_per_session_both_knees')
  final double? pricePerSessionBothKnees;
  @JsonKey(name: 'category')
  final String category;
  @JsonKey(name: 'add_on_therapies')
  final List<AddOnTherapy> addOnTherapies;
  // @JsonKey(name: 'selection_options')
  // final SelectionOptions? selectionOptions;
  @JsonKey(name: 'price_per_session_detox_massage_exclusive')
  final double? pricePerSessionDetoxMassageExclusive;
  @JsonKey(name: 'price_per_session_detox_massage_inclusive')
  final double? pricePerSessionDetoxMassageInclusive;
  @JsonKey(name: 'session_duration_in_min_detox_massage_exclusive')
  final double? sessionDurationInMinDetoxMassageExclusive;
  @JsonKey(name: 'session_duration_in_min_detox_massage_inclusive')
  final double? sessionDurationInMinDetoxMassageInclusive;

  TherapyDetailModel(
      this.name,
      this.englishName,
      this.headline,
      this.title,
      this.sessionOptions,
      this.sessionDurationInMin,
      this.pricePerSession,
      this.therapyDescription,
      this.benefits,
      this.contraindications,
      this.howItIsDone,
      this.category,
      this.products,
      this.pricingOptions,
      this.imageUrl,
      this.checkoutDescription,
      this.sessionDurationInMinHalfBody,
      this.pricePerSessionHalfBody,
      this.sessionDurationInMinFullBody,
      this.pricePerSessionFullBody,
      this.pricePerSessionPerKnee,
      this.addOnTherapies,
      this.pricePerSessionBabyExclusive,
      this.pricePerSessionBabyInclusive,
      this.sessionDurationInMinBabyExclusive,
      this.sessionDurationInMinBabyInclusive,
      this.sessionDurationInMin60min,
      this.pricePerSessionBothKnees,
      //this.selectionOptions,
      this.pricePerSessionDetoxMassageExclusive,
      this.pricePerSessionDetoxMassageInclusive,
      this.sessionDurationInMinDetoxMassageExclusive,
      this.sessionDurationInMinDetoxMassageInclusive);

  factory TherapyDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TherapyDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$TherapyDetailModelToJson(this);
}
