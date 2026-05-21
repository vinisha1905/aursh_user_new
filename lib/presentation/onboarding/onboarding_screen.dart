import 'package:ayursh/presentation/login/login_screen.dart';
import 'package:ayursh/presentation/onboarding/widget/onboarding1_widget.dart';
import 'package:ayursh/presentation/onboarding/widget/onboarding2_widget.dart';
import 'package:ayursh/presentation/onboarding/widget/onboarding3_widget.dart';
import 'package:ayursh/presentation/onboarding/widget/onboarding_indicator_widget.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  static final String routName = '/onboarding';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  OnboardingScreenState createState() {
    return OnboardingScreenState();
  }
}

class OnboardingScreenState extends State<OnboardingScreen> {
  TextEditingController _editingController = TextEditingController();

  int selectedIndex = 0;

  @override
  void dispose() {
    _editingController.dispose();
    selectedIndex = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
                itemCount: 3,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                itemBuilder: (ctx, index) {
                  if (index == 0) {
                    return Onboarding1Widget();
                  }
                  if (index == 1) {
                    return Onboarding2Widget();
                  }
                  if (index == 2) {
                    return Onboarding3Widget();
                  }
                  return Container();
                }),
            Positioned(
              left: 16,
              right: 16,
              top: 36,
              child: OnboardingIndicatorWidget(3, selectedIndex),
            ),
            Positioned(
              left: 16,
              top: 58,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).popAndPushNamed(LoginScreen.routName);
                },
                child: SvgPicture.asset('assets/icons/ic_close.svg', width: 20),
              ),
            ),
            Positioned(
                bottom: 32,
                left: 0,
                right: 0,
                child: selectedIndex == 2
                    ? Container(
                        width: double.infinity,
                        height: 42,
                        padding: EdgeInsets.symmetric(horizontal: 56),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.darkYellow),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)))),
                          child: Center(
                              child: TextWidget(
                                  text: 'Get Started',
                                  fontSize: 14,
                                  height: 19,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center)),
                          onPressed: () {
                            Navigator.of(context)
                                .popAndPushNamed(LoginScreen.routName);
                          },
                        ),
                      )
                    : Container())
          ],
        ),
      ),
    );
  }
}
