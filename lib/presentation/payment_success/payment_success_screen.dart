import 'dart:async';

import 'package:ayursh/application/main/main_bloc.dart';
import 'package:ayursh/presentation/main/main_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

enum BookFor { DoctorConsultation, Therapy, Medicine }

class PaymentSuccessArguments {
  final BookFor bookFor;
  final bool isPaidOnline;
  final String referenceId;

  PaymentSuccessArguments(this.bookFor, this.isPaidOnline, this.referenceId);
}

class PaymentSuccessScreen extends StatefulWidget {
  static final String routName = '/payment_success';
  final PaymentSuccessArguments arguments;

  const PaymentSuccessScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  PaymentSuccessScreenState createState() {
    return PaymentSuccessScreenState();
  }
}

class PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          MainScreen.routName, (route) => true,
          arguments: ArgModelMain(
              pageIndex: 2,
              tabIndex: widget.arguments.bookFor == BookFor.DoctorConsultation
                  ? 1
                  : 0));
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            Scaffold(
              body: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle,
                        color: AppColors.successColor, size: 150),
                    SizedBox(height: 16),
                    TextWidget(
                        text: widget.arguments.isPaidOnline
                            ? 'Payment Successful'
                            : 'Booking Confirmed',
                        fontSize: 22,
                        height: 29,
                        textColor: Colors.black,
                        fontWeight: Constant.fontMedium),
                    SizedBox(height: 6),
                    if (widget.arguments.referenceId.isNotEmpty)
                      TextWidget(
                          text:
                              'Reference ID : ${widget.arguments.referenceId}',
                          fontSize: 16,
                          height: 21,
                          textColor: AppColors.darkGray),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
            )
          ],
        )),
      ),
    );
  }
}
