import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:flutter/material.dart';

class DotsIndicatorWidget extends StatefulWidget {
  final int length;
  final int currentIndex;
  final double size;

  DotsIndicatorWidget(this.length, this.currentIndex, this.size);

  @override
  DotsIndicatorState createState() {
    return DotsIndicatorState();
  }
}

class DotsIndicatorState extends State<DotsIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: _dotsWidget(),
      ),
    );
  }

  List<Widget> _dotsWidget() {
    List<Widget> _dotsWidget = [];
    for (int i = 0; i < widget.length; i++) {
      _dotsWidget
          .add(_dotWidget(i == widget.currentIndex, i == widget.length - 1));
    }
    return _dotsWidget;
  }

  Widget _dotWidget(bool isSelected, bool isLast) {
    return Row(
      children: [
        Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected
                ? AppColors.darkBlue
                : AppColors.dotGray.withOpacity(0.2),
          ),
        ),
        isLast ? Container() : SizedBox(width: widget.size)
      ],
    );
  }
}
