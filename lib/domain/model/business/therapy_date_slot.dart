import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'therapy_date_slot.g.dart';

@JsonSerializable()
class TherapyDateSlot {
  final String day;
  final String date;
  final List<BookingSlotInfo> slots;


  TherapyDateSlot(this.day, this.date, this.slots);

  factory TherapyDateSlot.fromJson(Map<String, dynamic> json) =>
      _$TherapyDateSlotFromJson(json);

  Map<String, dynamic> toJson() => _$TherapyDateSlotToJson(this);
}
