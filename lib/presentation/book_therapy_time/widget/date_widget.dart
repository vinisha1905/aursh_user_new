import 'package:ayursh/domain/model/business/therapy_date_slot.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final TherapyDateSlot daySlot;
  final bool isSelected;
  final bool isLast;
  final Function() onTap;

  DateWidget(this.daySlot, this.isSelected, this.isLast ,this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isLast ? 0 : 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 70,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
                color: AppColors.darkBlue),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: isSelected ? AppColors.darkBlue : Colors.white,
          ),
          child: Text(daySlot.date,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                  color: isSelected ? Colors.white : AppColors.darkBlue,
                  fontWeight: Constant.fontMedium)),
        ),
      ),
    );
  }
}
