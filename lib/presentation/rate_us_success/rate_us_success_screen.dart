import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RateUsSuccessScreen extends StatelessWidget {
  static final String routName = '/rate_us_success';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Rate Us'),
              leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  icon: Icon(Icons.arrow_back_rounded,
                      color: AppColors.darkGray)),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: Column(children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset('assets/icons/bg_rate_us_success.png',
                        fit: BoxFit.fitWidth),
                  ),
                  SizedBox(height: 48),
                  TextWidget(
                      text: 'Thank You for your feedback',
                      fontSize: 20,
                      height: 26,
                      textColor: Colors.black,
                      fontWeight: Constant.fontMedium)
                ]),
              ),
            )),
      ),
    );
  }
}
