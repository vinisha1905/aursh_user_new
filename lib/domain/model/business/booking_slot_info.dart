import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_slot_info.g.dart';

@JsonSerializable()
class BookingSlotInfo {
  final String day;
  final String date;
  final String time;
  final bool available;

  BookingSlotInfo(this.day, this.date, this.time, this.available);

  factory BookingSlotInfo.fromJson(Map<String, dynamic> json) =>
      _$BookingSlotInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BookingSlotInfoToJson(this);

  String toServerScheduleTime() {
    var convertedDate = new DateFormat('MM-dd')
        .format(new DateFormat("dd MMM").parse(date));
    var convertedTime = new DateFormat('HH:mm:ss')
        .format(new DateFormat('hh:mm aa').parse(time));
    return '${DateTime.now().year}-${convertedDate}T$convertedTime';
  }
}
