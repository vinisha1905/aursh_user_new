import 'package:ayursh/domain/model/response/therapy_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'therapy_detail_response.g.dart';

@JsonSerializable()
class TherapyDetailResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final TherapyDetailModel therapyDetail;

  TherapyDetailResponse(
      this.success, this.errorCode, this.message, this.therapyDetail);

  factory TherapyDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TherapyDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TherapyDetailResponseToJson(this);
}
