import 'package:ayursh/domain/model/response/content_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_model.g.dart';

@JsonSerializable()
class ResultModel {
  final String type;
  final List<ContentModel> contents;

  ResultModel(this.type, this.contents);

  factory ResultModel.fromJson(Map<String, dynamic> json) => _$ResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}