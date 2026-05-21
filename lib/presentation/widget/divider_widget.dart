import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:flutter/cupertino.dart';

class DividerWidget extends StatelessWidget {

  final double? screenWidth;


  DividerWidget({this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 12, width: screenWidth ?? double.infinity, color: AppColors.offWhite);
  }
}