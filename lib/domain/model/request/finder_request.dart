import 'package:json_annotation/json_annotation.dart';
part 'finder_request.g.dart';

@JsonSerializable()
class FinderBody {
  @JsonKey(name: 'latitude')
  final double? latitude;
  @JsonKey(name: 'longitude')
  final double? longitude;
  @JsonKey(name: 'services_offered')
  final List<String>? servicesOffered;
  @JsonKey(name: 'therapy_selections')
  final List<TherapySelections>? therapySelections;

  FinderBody({
    this.latitude,
    this.longitude,
    this.servicesOffered,
    this.therapySelections,
  });

  factory FinderBody.fromJson(Map<String, dynamic> json) => _$FinderBodyFromJson(json);
  Map<String, dynamic> toJson() => _$FinderBodyToJson(this);
}

@JsonSerializable()
class TherapySelections {
  @JsonKey(name: 'therapy_title')
  final String? therapyTitle;
  @JsonKey(name: 'category_title')
  final String? categoryTitle;
  @JsonKey(name: 'no_of_sessions')
  final int? noOfSessions;
  @JsonKey(name: 'therapy_type')
  final String? therapyType;
  @JsonKey(name: 'therapy_duration')
  final String? therapyDuration;
  @JsonKey(name: 'services_offered')
  final String? servicesOffered;

  TherapySelections({
    this.therapyTitle,
    this.categoryTitle,
    this.noOfSessions,
    this.therapyType,
    this.therapyDuration,
    this.servicesOffered,
  });
  factory TherapySelections.fromJson(Map<String, dynamic> json) => _$TherapySelectionsFromJson(json);
  Map<String, dynamic> toJson() => _$TherapySelectionsToJson(this);

}