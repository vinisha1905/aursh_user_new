import 'package:fluttertoast/fluttertoast.dart';

showToast({required String? msg}) {
  return Fluttertoast.showToast(
    msg: msg ?? "",
    gravity: ToastGravity.BOTTOM,
    // backgroundColor: lightColorScheme.secondaryContainer,
    // textColor: lightColorScheme.onSecondaryContainer,
    fontSize: 16.0,
  );
}
