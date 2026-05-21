import 'package:json_annotation/json_annotation.dart';

part 'product_used_model.g.dart';

@JsonSerializable()
class ProductUsedModel {
  final String name;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  ProductUsedModel(this.name, this.imageUrl);

  factory ProductUsedModel.fromJson(Map<String, dynamic> json) =>
      _$ProductUsedModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductUsedModelToJson(this);
}
