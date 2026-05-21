import 'package:ayursh/domain/model/response/category_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_detail_response.g.dart';

@JsonSerializable()
class CategoryDetailResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final List<CategoryDetailModel> categories;

  CategoryDetailResponse(
      this.success, this.errorCode, this.message, this.categories);

  factory CategoryDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDetailResponseToJson(this);
}
