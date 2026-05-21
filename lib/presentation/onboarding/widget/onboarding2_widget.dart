import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';

class Onboarding2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
                heightFactor: 0.75,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/bg_onboarding2.png',
                        fit: BoxFit.fill,
                        width: 290,
                        height: 186,
                      ),
                      SizedBox(height: 30),
                      TextWidget(
                          text: 'Book The Therapy',
                          fontSize: 18,
                          height: 24,
                          fontWeight: Constant.fontMedium,
                          textColor: AppColors.darkGray),
                      SizedBox(height: 18),
                      Text(
                        'Book the ayurvedic therapy as per the\nadvice of the doctor',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            height: 1.4,
                            color: AppColors.darkGray),
                      )
                    ],
                  ),
                )),
          ),
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              child: Image.asset('assets/icons/bg_onboarding_corner2.png'),
            ),
          )
        ],
      ),
    );
  }
}
