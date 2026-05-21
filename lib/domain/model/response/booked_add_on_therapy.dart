import 'package:json_annotation/json_annotation.dart';

part 'booked_add_on_therapy.g.dart';

@JsonSerializable()
class BookedAddOnTherapy {
  final String? name;
  @JsonKey(name: 'therapy_title')
  final String title;
  @JsonKey(name: 'session_duration_in_min')
  final dynamic sessionDurationInMin;
  @JsonKey(name: 'total_sessions')
  final dynamic totalSessions;
  @JsonKey(name: 'session_no')
  final dynamic sessionNo;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @JsonKey(name: 'amount_payable')
  final dynamic amountPayable;
  @JsonKey(name: 'total_amount')
  final dynamic totalAmount;
  @JsonKey(name: 'therapy_headline')
  final String headline;

  BookedAddOnTherapy(
    this.name,
    this.title,
    this.sessionDurationInMin,
    this.sessionNo,
    this.amountPayable,
    this.totalAmount,
    this.imageUrl,
    this.totalSessions,
    this.headline,
  );

  factory BookedAddOnTherapy.fromJson(Map<String, dynamic> json) =>
      _$BookedAddOnTherapyFromJson(json);
  Map<String, dynamic> toJson() => _$BookedAddOnTherapyToJson(this);
}
