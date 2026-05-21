import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day_slot.g.dart';

@JsonSerializable()
class DaySlot {
  final String day;
  final String date;
  final List<BookingSlotInfo> morningSlots;
  final List<BookingSlotInfo> afternoonSlots;
  final List<BookingSlotInfo> eveningSlots;


  DaySlot(this.day, this.date, this.morningSlots, this.afternoonSlots,
      this.eveningSlots);

  factory DaySlot.fromJson(Map<String, dynamic> json) =>
      _$DaySlotFromJson(json);

  Map<String, dynamic> toJson() => _$DaySlotToJson(this);
}
