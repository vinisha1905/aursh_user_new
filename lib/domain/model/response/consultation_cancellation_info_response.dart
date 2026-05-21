import 'package:ayursh/domain/model/response/consultation_cancellation_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consultation_cancellation_info_response.g.dart';

@JsonSerializable()
class ConsultationCancellationInfoResponse {
  final bool success;
  @JsonKey(name: 'error_code')
  final String? errorCode;
  final String? message;
  @JsonKey(name: 'data')
  final ConsultationCancellationInfoModel cancellationInfo;

  ConsultationCancellationInfoResponse(
      this.success, this.errorCode, this.message, this.cancellationInfo);

  factory ConsultationCancellationInfoResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ConsultationCancellationInfoResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConsultationCancellationInfoResponseToJson(this);
}
