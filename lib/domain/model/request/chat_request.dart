import 'package:ayursh/domain/model/request/chat_request_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_request.g.dart';

@JsonSerializable()
class ChatRequest {
  @JsonKey(name: 'to')
  final String doctorFirebaseToken;
  @JsonKey(name: 'data')
  final ChatRequestData data;

  ChatRequest(this.doctorFirebaseToken, this.data);

  factory ChatRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRequestToJson(this);
}
