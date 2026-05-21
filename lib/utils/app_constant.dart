import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Constant {
  Constant._();
  static const FontWeight fontLight = FontWeight.w300;
  static const FontWeight fontMedium = FontWeight.w500;

  static const int otpLiveTime = 59;

  static void showError(String error, {bool isShort = false}) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: isShort ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: AppColors.darkBlue,
        fontSize: 12.0);
  }


  static const String baseUrl = 'https://prod.ayursh.com/';
  static final String razorKey = 'rzp_live_Mc5uQZphH3SbfX';
  static final String freshChatAppId = 'bac58c97-9fc9-4922-b0c4-bd358cf7485f';
  static final String freshChatAppKey = '96ed1598-caa3-4d69-99c6-846912fe5a81';
  static final String freshChatDomain = 'msdk.in.freshchat.com';
  static final String agoraAppId = '99c2e8c1d07141cfab1f63e8d5b02363';

  static String formatCurrency(String price) {
    try {
      final parsedPrice = int.tryParse(price);
      if (parsedPrice == null) {
        return '₹ 0';
      }
      return NumberFormat.currency(
        name: "INR",
        locale: 'en_IN',
        decimalDigits: 0,
        symbol: '₹ ',
      ).format(parsedPrice);
    } catch (e) {
      return '₹ 0';
    }
  }
}

class ArgModelMain {
  int pageIndex;
  int tabIndex;

  ArgModelMain({required this.pageIndex, required this.tabIndex});
}
