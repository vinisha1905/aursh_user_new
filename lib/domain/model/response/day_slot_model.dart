import 'package:ayursh/domain/model/response/time_slot_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day_slot_model.g.dart';

@JsonSerializable()
class DaySlotModel {
  @JsonKey(name: 'Morning')
  final List<TimeSlotModel> morningSlots;
  @JsonKey(name: 'Afternoon')
  final List<TimeSlotModel> afternoonSlots;
  @JsonKey(name: 'Evening')
  final List<TimeSlotModel> eveningSlots;


  DaySlotModel(this.morningSlots, this.afternoonSlots, this.eveningSlots);

  factory DaySlotModel.fromJson(Map<String, dynamic> json) => _$DaySlotModelFromJson(json);
  Map<String, dynamic> toJson() => _$DaySlotModelToJson(this);
}