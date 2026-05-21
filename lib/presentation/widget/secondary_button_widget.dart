import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final String title;
  final double height;
  final bool isEnable;
  final Function() onTap;

  SecondaryButtonWidget({required this.title, this.height = 45, this.isEnable = true, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0.0),
            backgroundColor: MaterialStateProperty.all<Color>(
                isEnable
                    ? Colors.white
                    : Colors.black12),
            shape:
            MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    side: BorderSide(
                        color: isEnable
                            ? AppColors.darkYellow
                            : Colors.white),
                    borderRadius: BorderRadius.circular(8)))),
        child: Center(
            child: TextWidget(
                text: title,
                fontSize: 14,
                height: 19,
                fontWeight: Constant.fontMedium,
                textColor: isEnable
                    ? AppColors.darkYellow
                    : Colors.black26,
                textAlign: TextAlign.center)),
        onPressed: isEnable ? onTap : null,
      ),
    );
  }

}