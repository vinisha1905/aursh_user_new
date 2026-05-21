import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';

class Onboarding1Widget extends StatelessWidget {
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
                        'assets/icons/bg_onboarding1.png',
                        fit: BoxFit.fill,
                        width: 290,
                        height: 186,
                      ),
                      SizedBox(height: 30),
                      TextWidget(
                          text: 'Consult Doctor Online',
                          fontSize: 18,
                          height: 24,
                          fontWeight: Constant.fontMedium,
                          textColor: AppColors.darkGray),
                      SizedBox(height: 18),
                      Text(
                        'At Ayursh you get an option to take doctor’s\nvideo consultation through the app',
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
            alignment: Alignment.topRight,
            child: Container(
              width: 150,
              child: Image.asset('assets/icons/bg_onboarding_corner1.png'),
            ),
          )
        ],
      ),
    );
  }
}
