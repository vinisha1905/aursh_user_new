import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OptInputWidget extends StatefulWidget {
  final Function(String otpCode) onCompleted;
  final TextEditingController? otpCodeController;

  OptInputWidget({required this.otpCodeController, required this.onCompleted});

  @override
  OtpInputWidgetState createState() {
    return OtpInputWidgetState();
  }
}

class OtpInputWidgetState extends State<OptInputWidget> {
  String otpCode = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      textStyle: TextStyle(
          fontSize: 18, fontWeight: Constant.fontMedium, color: Colors.white),
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          borderRadius: BorderRadius.circular(5),
          fieldWidth: 40,
          activeFillColor: Colors.transparent,
          activeColor: Colors.white,
          errorBorderColor: Colors.transparent,
          selectedColor: Colors.white,
          inactiveColor: Colors.white30,
          inactiveFillColor: Colors.transparent,
          selectedFillColor: Colors.transparent,
          disabledColor: Colors.white30),
      animationDuration: Duration(milliseconds: 300),
      enableActiveFill: true,
      showCursor: false,
      controller: widget.otpCodeController!,
      onCompleted: (v) => widget.onCompleted(v),
      onChanged: (value) {
        print(value);
        setState(() {
          otpCode = value;
        });
      },
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
