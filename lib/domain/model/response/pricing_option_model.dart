import 'package:json_annotation/json_annotation.dart';

part 'pricing_option_model.g.dart';

@JsonSerializable()
class PricingOptionModel {
  @JsonKey(name: 'old_price')
  final double oldPrice;
  @JsonKey(name: 'old_price_half_body')
  final double oldPriceHalfBody;
  @JsonKey(name: 'offer_price')
  final double offerPrice;
  @JsonKey(name: 'offer_price_half_body')
  final double offerPriceHalfBody;
  @JsonKey(name: 'you_save')
  final double youSave;
  @JsonKey(name: 'you_save_half_body')
  final double youSaveHalfBody;
  @JsonKey(name: 'you_save_pct')
  final double youSavePct;
  @JsonKey(name: 'travel_expense')
  final double travelExpense;
  @JsonKey(name: 'service_charge')
  final double serviceCharge;
  @JsonKey(name: 'service_charge_half_body')
  final double serviceChargeHalfBody;
  @JsonKey(name: 'total')
  final double total;
  @JsonKey(name: 'total_half_body')
  final double totalHalfBody;
  final int count;
  final List<String>? offers;
  @JsonKey(name: 'old_price_option1')
  final double oldPriceOption1;
  @JsonKey(name: 'old_price_option2')
  final double oldPriceOption2;
  @JsonKey(name: 'old_price_option3')
  final double oldPriceOption3;
  @JsonKey(name: 'offer_price_option1')
  final double offerPriceOption1;
  @JsonKey(name: 'offer_price_option2')
  final double offerPriceOption2;
  @JsonKey(name: 'offer_price_option3')
  final double offerPriceOption3;
  @JsonKey(name: 'you_save_option1')
  final double youSaveOption1;
  @JsonKey(name: 'you_save_option2')
  final double youSaveOption2;
  @JsonKey(name: 'you_save_option3')
  final double youSaveOption3;

  PricingOptionModel(
      this.oldPrice,
      this.oldPriceHalfBody,
      this.offerPrice,
      this.offerPriceHalfBody,
      this.youSave,
      this.offers,
      this.youSaveHalfBody,
      this.youSavePct,
      this.travelExpense,
      this.serviceCharge,
      this.serviceChargeHalfBody,
      this.total,
      this.totalHalfBody,
      this.oldPriceOption1,
      this.oldPriceOption2,
      this.oldPriceOption3,
      this.offerPriceOption1,
      this.offerPriceOption2,
      this.offerPriceOption3,
      this.youSaveOption1,
      this.youSaveOption2,
      this.youSaveOption3,
      this.count);

  Map<String, dynamic> toJson() => _$PricingOptionModelToJson(this);

  factory PricingOptionModel.fromJson(Map<String, dynamic> json) =>
      _$PricingOptionModelFromJson(json);
}
