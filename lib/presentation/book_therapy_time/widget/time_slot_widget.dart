import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:flutter/material.dart';

class TimeSlotWidget extends StatelessWidget {
  final BookingSlotInfo bookingSlotInfo;
  final bool isSelected;
  final Function(BookingSlotInfo? selectedSlot) onSelectedSlot;

  TimeSlotWidget(this.bookingSlotInfo, this.isSelected, this.onSelectedSlot);
String _formatTimeRange(String time) {
  try {
    final parts = time.split(' ');
    final timePart = parts[0]; // "08:00"
    final period = parts[1].toUpperCase(); // "AM"

    final hour = int.parse(timePart.split(':')[0]); // extract "08" -> 8

    int hour24 = hour;

    // Convert to 24-hour format
    if (period == 'PM' && hour != 12) hour24 += 12;
    if (period == 'AM' && hour == 12) hour24 = 0;

    int nextHour = (hour24 + 1) % 24;

    String format(int h) {
      String p = h >= 12 ? 'am' : 'am';
      p = h >= 12 ? 'pm' : 'am';
      int displayHour = h % 12;
      if (displayHour == 0) displayHour = 12;
      return "$displayHour$p";
    }

    return "${format(hour24)} - ${format(nextHour)}";
  } catch (e) {
    return time;
  }
}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bookingSlotInfo.available
          ? onSelectedSlot(isSelected ? null : bookingSlotInfo)
          : null,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
              color: bookingSlotInfo.available
                  ? AppColors.darkBlue
                  : Colors.white.withOpacity(0.12)),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: bookingSlotInfo.available
              ? (isSelected ? AppColors.darkBlue : Colors.white)
              : Colors.black.withOpacity(0.12),
        ),
        child: Center(
          child: Text(_formatTimeRange(bookingSlotInfo.time),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  color: bookingSlotInfo.available
                      ? (isSelected ? Colors.white : AppColors.darkBlue)
                      : Colors.black.withOpacity(0.27),
                  fontWeight: Constant.fontMedium)),
        ),
      ),
    );
  }
}
