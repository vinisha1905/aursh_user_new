import 'package:json_annotation/json_annotation.dart';

part 'therapy_description_model.g.dart';

@JsonSerializable()
class TherapyDescriptionModel {
  final List<String> descriptions;

  TherapyDescriptionModel(this.descriptions);

  factory TherapyDescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$TherapyDescriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TherapyDescriptionModelToJson(this);
}
