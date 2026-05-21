import 'package:json_annotation/json_annotation.dart';

part 'session_selected_info.g.dart';

@JsonSerializable()
class SessionSelectedInfo {
  final String? totalSession;
  final String? pricePerSession;
  final int? sessionDurationInMin;
  SessionSelectedInfo(
      this.totalSession, this.pricePerSession, this.sessionDurationInMin);

  factory SessionSelectedInfo.fromJson(Map<String, dynamic> json) =>
      _$SessionSelectedInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SessionSelectedInfoToJson(this);
}
