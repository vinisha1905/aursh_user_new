import 'package:json_annotation/json_annotation.dart';

part 'content_model.g.dart';

@JsonSerializable()
class ContentModel {
  final String title;
  @JsonKey(name: 'sub_title')
  final String subTitle;
  final List<String> values;


  ContentModel(this.title, this.subTitle, this.values);

  factory ContentModel.fromJson(Map<String, dynamic> json) => _$ContentModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContentModelToJson(this);
}