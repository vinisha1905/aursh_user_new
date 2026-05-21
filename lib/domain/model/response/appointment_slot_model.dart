import 'package:ayursh/domain/model/response/day_slot_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment_slot_model.g.dart';

@JsonSerializable()
class AppointmentSlotModel {
  final String day;
  final String date;
  @JsonKey(name: 'time_slots')
  final DaySlotModel daySlotModel;


  AppointmentSlotModel(this.day, this.date, this.daySlotModel);

  factory AppointmentSlotModel.fromJson(Map<String, dynamic> json) => _$AppointmentSlotModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentSlotModelToJson(this);
}