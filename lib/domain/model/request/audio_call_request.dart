import 'package:ayursh/domain/model/request/audio_call_request_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audio_call_request.g.dart';

@JsonSerializable()
class AudioCallRequest {
  @JsonKey(name: 'to')
  final String doctorToken;
  @JsonKey(name: 'data')
  final AudioCallRequestData data;

  AudioCallRequest(this.doctorToken, this.data);

  factory AudioCallRequest.fromJson(Map<String, dynamic> json) =>
      _$AudioCallRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AudioCallRequestToJson(this);
}
