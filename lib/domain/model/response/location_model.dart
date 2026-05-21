import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  final double? latitude;
  final double? longitude;
  @JsonKey(name: 'admin_area')
  final String? adminArea;
  @JsonKey(name: 'country_name')
  final String? countryName;
  @JsonKey(name: 'country_code')
  final String? countryCode;
  @JsonKey(name: 'sub_admin_are')
  final String? subAdminAre;
  final String? thoroughfare;
  @JsonKey(name: 'sub_thoroughfare')
  final String? subThoroughfare;
  @JsonKey(name: 'feature_name')
  final String? featureName;


  LocationModel(
      this.latitude,
      this.longitude,
      this.adminArea,
      this.countryName,
      this.countryCode,
      this.subAdminAre,
      this.thoroughfare,
      this.subThoroughfare,
      this.featureName);

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
