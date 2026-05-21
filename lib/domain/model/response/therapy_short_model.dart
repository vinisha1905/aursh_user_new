import 'package:json_annotation/json_annotation.dart';

part 'therapy_short_model.g.dart';

@JsonSerializable()
class TherapyShortModel {
  final String name;
  @JsonKey(name: 'english_name')
  final String? englishName;
  final String title;
  @JsonKey(name: 'session_options')
  final List<int>? sessionOptions;
  @JsonKey(name: 'session_pricing_options')
  final List<int>? sessionPricingOptions;
  @JsonKey(name: 'session_duration_in_min')
  final int sessionDurationInMin;
  // final List<String> benefits;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @JsonKey(name: 'category_title')
  final String? categoryTitle;

  // not availble
  @JsonKey(name: 'category')
  final String? category;

  TherapyShortModel(
      this.name,
      this.englishName,
      this.title,
      this.sessionOptions,
      this.sessionPricingOptions,
      this.sessionDurationInMin,
      // this.benefits,
      this.imageUrl,
      this.categoryName,
      this.category,
      this.categoryTitle);

  factory TherapyShortModel.fromJson(Map<String, dynamic> json) =>
      _$TherapyShortModelFromJson(json);
  Map<String, dynamic> toJson() => _$TherapyShortModelToJson(this);
}
