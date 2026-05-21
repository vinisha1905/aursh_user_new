import 'package:json_annotation/json_annotation.dart';

part 'book_therapy_time_slot_model.g.dart';

@JsonSerializable()
class BookTherapyTimeSlotModel {
  final String time;
  final bool available;


  BookTherapyTimeSlotModel(this.time, this.available);

  factory BookTherapyTimeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$BookTherapyTimeSlotModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookTherapyTimeSlotModelToJson(this);
}