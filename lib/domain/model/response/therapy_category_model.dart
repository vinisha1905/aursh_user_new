import 'package:json_annotation/json_annotation.dart';

part 'therapy_category_model.g.dart';

@JsonSerializable()
class TherapyCategoryModel {
  final String name;
  final String title;
  @JsonKey(name: 'category_id')
  final String categoryId;
  @JsonKey(name: 'image_url')
  final String imageUrl;


  TherapyCategoryModel(this.name, this.title, this.categoryId, this.imageUrl);

  factory TherapyCategoryModel.fromJson(Map<String, dynamic> json) => _$TherapyCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$TherapyCategoryModelToJson(this);
}