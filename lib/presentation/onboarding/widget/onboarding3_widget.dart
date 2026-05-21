import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';

class Onboarding3Widget extends StatelessWidget {
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
                        'assets/icons/bg_onboarding3.png',
                        fit: BoxFit.fill,
                        width: 290,
                        height: 186,
                      ),
                      SizedBox(height: 30),
                      TextWidget(
                          text: 'At Home Service',
                          fontSize: 18,
                          height: 24,
                          fontWeight: Constant.fontMedium,
                          textColor: AppColors.darkGray),
                      SizedBox(height: 18),
                      Text(
                        'Get the certified therapists at your doorstep and enjoy the therapy at the confines of your home',
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
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 170,
              child: Image.asset('assets/icons/bg_onboarding_corner3.png'),
            ),
          )
        ],
      ),
    );
  }
}
