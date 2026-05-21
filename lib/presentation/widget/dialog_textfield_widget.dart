import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';

class DialogTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final TextInputType textInputType;

  DialogTextFieldWidget(
      {required this.controller,
      required this.title,
      this.textInputType = TextInputType.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: TextWidget(
              text: title,
              fontSize: 14,
              height: 16,
              fontWeight: Constant.fontMedium,
              textColor: AppColors.darkGray),
        ),
        SizedBox(width: 24),
        Expanded(
          flex: 8,
          child: TextField(
            controller: controller,
            keyboardType: textInputType,
            style: TextStyle(
                color: AppColors.darkGray,
                fontSize: 14,
                fontWeight: Constant.fontMedium),
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(bottom: 2),
                border: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder()),
          ),
        )
      ],
    );
  }
}
