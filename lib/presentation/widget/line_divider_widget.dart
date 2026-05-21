import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:flutter/material.dart';

class LineDividerWidget extends StatelessWidget {

  final double height;

  LineDividerWidget({this.height = 0.5});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.dividerColor,
      height: this.height,
    );
  }
}
