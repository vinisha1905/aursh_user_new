import 'package:json_annotation/json_annotation.dart';

part 'address_info.g.dart';

@JsonSerializable()
class AddressInfo {
  final String flatNoBuilding;
  final String localityArea;
  final String landMark;
  final String city;

  AddressInfo(this.flatNoBuilding, this.localityArea, this.landMark, this.city);

  factory AddressInfo.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AddressInfoToJson(this);
}
