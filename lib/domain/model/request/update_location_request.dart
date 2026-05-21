import 'package:json_annotation/json_annotation.dart';

part 'update_location_request.g.dart';

@JsonSerializable()
class UpdateLocationRequest {
  @JsonKey(name: 'location_details')
  final Map<String, dynamic> data;

  UpdateLocationRequest(this.data);

  factory UpdateLocationRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateLocationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateLocationRequestToJson(this);
}
