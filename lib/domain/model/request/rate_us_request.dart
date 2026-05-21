import 'package:json_annotation/json_annotation.dart';

part 'rate_us_request.g.dart';

@JsonSerializable()
class RateUsRequest {
  @JsonKey(name: 'therapy_rating_count')
  final int? therapyRatingCount;
  @JsonKey(name: 'therapy_rating_description')
  final String? therapyRatingDescription;
  @JsonKey(name: 'therapist_rating_count')
  final int? therapistRatingCount;
  @JsonKey(name: 'therapist_rating_description')
  final String? therapistRatingDescription;


  RateUsRequest(this.therapyRatingCount, this.therapyRatingDescription,
      this.therapistRatingCount, this.therapistRatingDescription);

  factory RateUsRequest.fromJson(Map<String, dynamic> json) => _$RateUsRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RateUsRequestToJson(this);
}