import 'package:json_annotation/json_annotation.dart';

part 'prefill_model.g.dart';

@JsonSerializable()
class PrefillModel {
  final dynamic name;
  final dynamic email;
  final String contact;

  PrefillModel(this.name, this.email, this.contact);

  factory PrefillModel.fromJson(Map<String, dynamic> json) =>
      _$PrefillModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrefillModelToJson(this);
}
