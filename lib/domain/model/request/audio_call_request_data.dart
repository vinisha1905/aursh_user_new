import 'package:json_annotation/json_annotation.dart';

part 'audio_call_request_data.g.dart';

@JsonSerializable()
class AudioCallRequestData {
  final String title;
  final String channel;
  final String toUser;
  final String user;
  @JsonKey(name: 'booking_id')
  final String bookingId;
  @JsonKey(name: 'fcm')
  final String userToken;
  final String type;
  final int time;


  AudioCallRequestData(this.title, this.channel, this.toUser, this.user,
      this.bookingId, this.userToken, this.type, this.time);

  factory AudioCallRequestData.fromJson(Map<String, dynamic> json) => _$AudioCallRequestDataFromJson(json);
  Map<String, dynamic> toJson() => _$AudioCallRequestDataToJson(this);
}