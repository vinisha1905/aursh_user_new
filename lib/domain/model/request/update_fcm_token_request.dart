import 'package:json_annotation/json_annotation.dart';

part 'update_fcm_token_request.g.dart';

@JsonSerializable()
class UpdateFcmTokenRequest {
  @JsonKey(name: 'fcm_token')
  final String fcmToken;

  UpdateFcmTokenRequest(this.fcmToken);

  factory UpdateFcmTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateFcmTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateFcmTokenRequestToJson(this);
}
