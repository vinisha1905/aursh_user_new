import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  double? height;
  final double fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  TextWidget(
      {required this.text,
      required this.fontSize,
      this.height,
      this.textColor = Colors.white,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
