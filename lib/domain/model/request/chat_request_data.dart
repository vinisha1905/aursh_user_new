import 'package:json_annotation/json_annotation.dart';

part 'chat_request_data.g.dart';

@JsonSerializable()
class ChatRequestData {
  @JsonKey(name: 'title')
  final String message;
  @JsonKey(name: 'body')
  final String userName;
  @JsonKey(name: 'booking_id')
  final String bookingId;

  ChatRequestData(this.message, this.userName, this.bookingId);

  factory ChatRequestData.fromJson(Map<String, dynamic> json) => _$ChatRequestDataFromJson(json);
  Map<String, dynamic> toJson() => _$ChatRequestDataToJson(this);
}