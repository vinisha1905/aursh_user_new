import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/line_divider_widget.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';

class ProfileSessionWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function() onTap;
  final bool isFirst;

  ProfileSessionWidget(
      {required this.icon,
      required this.title,
      required this.onTap,
      this.isFirst = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            isFirst ? LineDividerWidget(height: 1) : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Container(
                      width: 36,
                      height: 36,
                      child: Center(
                        child: icon,
                      )),
                  SizedBox(width: 4),
                  Expanded(
                    child: TextWidget(
                        text: title,
                        fontSize: 16,
                        height: 21,
                        textColor: AppColors.darkGray),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 18, color: AppColors.darkBlue),
                  SizedBox(width: 6)
                ],
              ),
            ),
            LineDividerWidget(height: 1),
          ],
        ),
      ),
    );
  }
}
