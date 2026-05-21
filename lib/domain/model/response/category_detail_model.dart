import 'package:ayursh/domain/model/response/faq_model.dart';
import 'package:ayursh/domain/model/response/therapy_short_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_detail_model.g.dart';

@JsonSerializable()
class CategoryDetailModel {
  final String name;
  final String title;
  final List<String> descriptions;
  final List<FaqModel> faq;
  final List<TherapyShortModel> therapies;
  @JsonKey(name: 'category_id')
  final String categoryId;


  CategoryDetailModel(this.name, this.title, this.descriptions, this.faq,
      this.therapies, this.categoryId);

  factory CategoryDetailModel.fromJson(Map<String, dynamic> json) => _$CategoryDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDetailModelToJson(this);
}