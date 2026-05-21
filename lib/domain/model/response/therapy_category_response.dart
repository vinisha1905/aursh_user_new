import 'package:ayursh/domain/model/response/therapy_category_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'therapy_category_response.g.dart';

@JsonSerializable()
class TherapyCategoryResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String errorCode;
  final String message;
  @JsonKey(name: 'data')
  final List<TherapyCategoryModel>? categories;


  TherapyCategoryResponse(
      this.success, this.errorCode, this.message, this.categories);

  factory TherapyCategoryResponse.fromJson(Map<String, dynamic> json) => _$TherapyCategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TherapyCategoryResponseToJson(this);
}