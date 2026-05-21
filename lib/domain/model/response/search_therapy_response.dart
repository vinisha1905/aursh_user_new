import 'package:ayursh/domain/model/response/therapy_short_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_therapy_response.g.dart';

@JsonSerializable()
class SearchTherapyResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String errorCode;
  final String message;
  @JsonKey(name: 'data')
  final List<TherapyShortModel>? therapies;


  SearchTherapyResponse(this.success, this.errorCode, this.message, this.therapies);

  factory SearchTherapyResponse.fromJson(Map<String, dynamic> json) => _$SearchTherapyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchTherapyResponseToJson(this);
}