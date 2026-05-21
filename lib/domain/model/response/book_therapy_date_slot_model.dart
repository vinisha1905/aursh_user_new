import 'package:json_annotation/json_annotation.dart';

import 'book_therapy_time_slot_model.dart';

part 'book_therapy_date_slot_model.g.dart';

@JsonSerializable()
class BookTherapyDateSlotModel {
  final String day;
  final String date;
  @JsonKey(name: 'time_slots')
  final List<BookTherapyTimeSlotModel> timeSlots;


  BookTherapyDateSlotModel(this.day, this.date, this.timeSlots);

  factory BookTherapyDateSlotModel.fromJson(Map<String, dynamic> json) => _$BookTherapyDateSlotModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookTherapyDateSlotModelToJson(this);
}