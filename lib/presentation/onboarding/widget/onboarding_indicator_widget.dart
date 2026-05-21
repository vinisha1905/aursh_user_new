import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingIndicatorWidget extends StatefulWidget {
  final int length;
  final int currentIndex;

  OnboardingIndicatorWidget(this.length, this.currentIndex);

  @override
  OnboardingIndicatorWidgetState createState() {
    return OnboardingIndicatorWidgetState();
  }
}

class OnboardingIndicatorWidgetState extends State<OnboardingIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _indicatosWidget(),
        ),
      ),
    );
  }

  List<Widget> _indicatosWidget() {
    List<Widget> _dotsWidget = [];
    for (int i = 0; i < widget.length; i++) {
      _dotsWidget.add(
          _indicatorWidget(i == widget.currentIndex, i == widget.length - 1));
    }
    return _dotsWidget;
  }

  Widget _indicatorWidget(bool isSelected, bool isLast) {
    return Expanded(
        child: Row(
      children: [
        Expanded(
            child: Container(
          height: 8,
          decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.darkBlue
                  : AppColors.dotGray.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        )),
        isLast ? Container() : SizedBox(width: 8)
      ],
    ));
  }
}
