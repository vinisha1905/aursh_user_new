import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnderLineTextField extends StatelessWidget {
  final Widget? prefixWidget;
  final Function(String?)? onChangedText;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final String title;
  final String? error;

  UnderLineTextField(
      {required this.controller,
      required this.title,
      this.error,
      this.prefixWidget,
      this.onChangedText,
      this.textInputType,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
            text: title,
            fontSize: 14,
            height: 19,
            textColor: error != null ? AppColors.error : Colors.white70,
            fontWeight: Constant.fontMedium),
        SizedBox(height: 12),
        TextField(
          onChanged: onChangedText,
            controller: controller,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: Constant.fontMedium),
            enableSuggestions: false,
            cursorColor: Colors.white,
            autocorrect: false,
            keyboardType: textInputType ?? null,
            inputFormatters: inputFormatters ?? [],
            decoration: InputDecoration(
              focusColor: Colors.white,
              isDense: true,
              prefixIcon: prefixWidget ?? null,
              prefixIconConstraints: prefixWidget != null ? BoxConstraints(minWidth: 0, minHeight: 0) : null,
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            )),
        SizedBox(height: 6),
        TextWidget(
            text: error ?? '',
            fontSize: 12,
            height: 16,
            textColor: AppColors.error,
            fontWeight: Constant.fontMedium),
      ],
    );
  }
}
