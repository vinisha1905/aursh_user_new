import 'package:json_annotation/json_annotation.dart';

part 'about_us_model.g.dart';

@JsonSerializable()
class AboutUsModel {
  final String title;
  final String thumbnail;
  @JsonKey(name: 'video_url')
  final String videoUrl;


  AboutUsModel(this.title, this.thumbnail, this.videoUrl);

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => _$AboutUsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AboutUsModelToJson(this);
}