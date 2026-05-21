import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:flutter/material.dart';

class DialogAddressWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputAction action;
  final bool isEditable;

  DialogAddressWidget(this.controller, this.hint, {this.action = TextInputAction.next, this.isEditable = true});

  @override
  DialogAddressWidgetState createState() {
    return DialogAddressWidgetState();
  }
}

class DialogAddressWidgetState extends State<DialogAddressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(
            enabled: widget.isEditable,
            textInputAction: widget.action,
            cursorColor: AppColors.darkBlue,
            keyboardType: TextInputType.name,
            controller: widget.controller,
            style: TextStyle(color: AppColors.darkGray),
            decoration: InputDecoration(
              labelText: widget.hint,
              labelStyle: TextStyle(color: AppColors.darkGray),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkGray),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkBlue),
              ),
            ),
          )
        ],
      ),
    );
  }
}
