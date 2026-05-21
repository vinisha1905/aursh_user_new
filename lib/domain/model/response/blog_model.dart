import 'package:json_annotation/json_annotation.dart';

part 'blog_model.g.dart';

@JsonSerializable()
class BlogModel {
  @JsonKey(name: 'preview_small')
  final String smallPhoto;
  @JsonKey(name: 'preview_big')
  final String bigPhoto;


  BlogModel(this.smallPhoto, this.bigPhoto);

  factory BlogModel.fromJson(Map<String, dynamic> json) => _$BlogModelFromJson(json);
  Map<String, dynamic> toJson() => _$BlogModelToJson(this);
}