import 'package:ayursh/application/therapy_detail/therapy_detail_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_on_therapy_post.g.dart';

@JsonSerializable()
class AddOnTherapyPost {
  @JsonKey(name: 'therapy_title')
  final String therapyTitle;
  @JsonKey(name: 'total_sessions')
  final int totalSessions;
  @JsonKey(name: 'session_no')
  final int sessionNo;
  @JsonKey(name: 'amount_payable')
  final double amountPayable;
  @JsonKey(name: 'session_duration_in_min')
  final int sessionDurationInMin;
  @JsonKey(name: 'imageUrl')
  final String imageUrl;
  final String name;
  ServiceType? serviceType;
  ServicePart? servicePart;

  AddOnTherapyPost(
    this.amountPayable,
    this.sessionDurationInMin,
    this.sessionNo,
    this.therapyTitle,
    this.totalSessions,
    this.imageUrl,
    this.name,
    this.serviceType,
    this.servicePart,
  );

  factory AddOnTherapyPost.fromJson(Map<String, dynamic> json) => _$AddOnTherapyPostFromJson(json);
  Map<String, dynamic> toJson() => _$AddOnTherapyPostToJson(this);
}
