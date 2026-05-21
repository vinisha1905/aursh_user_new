import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/domain/model/business/day_slot.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final DaySlot daySlot;
  final bool isSelected;
  final Function() onTap;

  DateWidget(this.daySlot, this.isSelected, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12),
            TextWidget(
                text: daySlot.day,
                fontSize: 14,
                height: 19,
                textColor: AppColors.darkBlue,
                fontWeight: Constant.fontMedium),
            SizedBox(height: 4),
            TextWidget(
                text: daySlot.date,
                fontSize: 14,
                height: 19,
                textColor: AppColors.darkGray,
                fontWeight: Constant.fontMedium),
            Container(height: 2, color: isSelected ? AppColors.darkBlue : null)
          ],
        ),
      ),
    );
  }
}
