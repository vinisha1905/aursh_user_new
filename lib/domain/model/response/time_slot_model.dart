import 'package:json_annotation/json_annotation.dart';

part 'time_slot_model.g.dart';

@JsonSerializable()
class TimeSlotModel {
  @JsonKey(name: 'slot_time')
  final String slotTime;
  final bool available;


  TimeSlotModel(this.slotTime, this.available);

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) => _$TimeSlotModelFromJson(json);
  Map<String, dynamic> toJson() => _$TimeSlotModelToJson(this);
}