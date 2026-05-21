import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/material.dart';

class AddOnTherapyButton extends StatelessWidget {
  final String title;
  final int qty;
  final Function(String type) onTap;

  AddOnTherapyButton({
    required this.title,
    required this.qty,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      child: qty > 0
          ? Container(
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.darkYellow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      onTap("decrement");
                    },
                    child: Container(
                        width: 33,
                        height: 36,
                        child:
                            Icon(Icons.remove, size: 16, color: Colors.white)),
                  ),
                  TextWidget(
                      text: qty.toString(),
                      fontSize: 14,
                      height: 19,
                      textColor: Colors.white,
                      fontWeight: Constant.fontMedium,
                      textAlign: TextAlign.center),
                  InkWell(
                    onTap: () {
                      onTap("increment");
                    },
                    child: Container(
                        width: 33,
                        height: 36,
                        child: Icon(Icons.add, size: 16, color: Colors.white)),
                  ),
                ],
              ),
            )
          : Container(
              width: 80,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.darkYellow),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                child: Center(
                  child: TextWidget(
                      text: title,
                      fontSize: 14,
                      height: 19,
                      textColor: Colors.white,
                      fontWeight: Constant.fontMedium,
                      textAlign: TextAlign.center),
                ),
                onPressed: () {
                  if (qty == 0) onTap("increment");
                },
              ),
            ),
    );
  }
}
