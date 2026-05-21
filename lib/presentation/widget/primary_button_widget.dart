import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String title;
  final double height;
  final Function() onTap;
  final bool isEnable;

  PrimaryButtonWidget(
      {required this.title,
      this.height = 45,
      required this.onTap,
      this.isEnable = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(isEnable
                ? AppColors.darkYellow
                : Colors.black.withOpacity(0.12)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)))),
        child: Center(
            child: TextWidget(
                text: title,
                fontSize: 14,
                height: 19,
                textColor:
                    isEnable ? Colors.white : Colors.black.withOpacity(0.27),
                fontWeight: Constant.fontMedium,
                textAlign: TextAlign.center)),
        onPressed: isEnable ? onTap : null,
      ),
    );
  }
}
