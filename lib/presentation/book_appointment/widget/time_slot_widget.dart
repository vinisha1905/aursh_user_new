import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:flutter/material.dart';

class TimeSlotWidget extends StatelessWidget {
  final BookingSlotInfo bookingSlotInfo;
  final bool isSelected;
  final Function(BookingSlotInfo? selectedSlot) onSelectedSlot;

  TimeSlotWidget(this.bookingSlotInfo, this.isSelected, this.onSelectedSlot);

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
          child: Text(bookingSlotInfo.time,
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
