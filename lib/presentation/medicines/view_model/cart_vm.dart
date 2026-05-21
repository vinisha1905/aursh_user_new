import 'dart:convert';

import 'package:alice/alice.dart';
import 'package:ayursh/application/main/main_bloc.dart';
import 'package:ayursh/application/my_bookings/my_bookings_bloc.dart';
import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/domain/util/custom_print.dart';
import 'package:ayursh/domain/util/preference_util.dart';
import 'package:ayursh/domain/util/snack_bar.dart';
import 'package:ayursh/main.dart';
import 'package:ayursh/presentation/main/main_screen.dart';
import 'package:ayursh/presentation/medicines/models/get_product_model.dart';
import 'package:ayursh/presentation/payment_success/payment_success_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/api_helper.dart';
import '../../../domain/model/arg/cart_arg_model.dart';

class CartVM extends ChangeNotifier {
  List<ProductResult> cartItems = [];

  loadItems() {
    loadCartItems();
  }

  String get getTotal => getTotalFunc();

  String getTotalFunc() {
    double total = 0;

    for (var e in cartItems) {
      total += e.qty * (e.price ?? 0);
    }

    return total.toStringAsFixed(0);
  }

  onTapAddItem(ProductResult productResult) {
    int i = cartItems.indexWhere((element) => element.id == productResult.id);

    if (i >= 0) {
      cartItems[i].qty += 1;
    } else {
      var addProduct = productResult;
      addProduct.qty = 1;
      cartItems.add(addProduct);
    }
    saveCartItems();
    notifyListeners();
  }

  onTapRemoveItem(ProductResult productResult) {
    int i = cartItems.indexWhere((element) => element.id == productResult.id);

    if (i >= 0) {
      if (cartItems[i].qty > 1) {
        cartItems[i].qty -= 1;
      } else {
        cartItems.removeAt(i);
      }
    }
    saveCartItems();
    notifyListeners();
  }

  onTapDeleteItem(ProductResult productResult) {
    cartItems.remove(productResult);
    saveCartItems();
    notifyListeners();
  }

  Future<void> saveCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartItemsJson = cartItems.map((item) => json.encode(item.toJson())).toList();
    await prefs.setStringList('cart_items', cartItemsJson);
  }

  Future<void> loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartItemsJson = prefs.getStringList('cart_items');
    if (cartItemsJson != null) {
      cartItems = cartItemsJson.map((item) => ProductResult.fromJson(json.decode(item))).toList();
      notifyListeners();
    }
  }

  /// Create Order

  onInitCheckOutPage() {
    isLoadingPlaceOrder = false;
    razorpay = Razorpay();
    cartArgModel = null;
    notifyListeners();
  }

  bool isLoadingPlaceOrder = false;

  Future onTapPlaceOrder({
    required String firstName,
    required String lastName,
    required String email,
    required String address,
    required String pinCode,
    required String city,
    required int deliveryPrice,
    required int totalPrice,
    required String totalMedicinePrice,
    required String receiptId,
    required String razorPayPaymentId,
    required String razorPaySignature,
    required String razorPayOrderId,
  }) async {
    String token = "Bearer " + await GetIt.I.get<PreferenceUtil>().getAccessToken();
    return await ApiHelper.fetchWithLoading(
      method: HttpMethod.post,
      api: "${createOrderAPIAPI}?price=${getTotal}&user_id=${await getIt.get<PreferenceUtil>().getUserId()}",
      data: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile": "${await getIt.get<PreferenceUtil>().getPhoneNumber()}",
        "address": address,
        "postal_code": pinCode,
        "city": city,
        "delivery_price": deliveryPrice,
        "total_price": totalPrice,
        "total_medicine_price": totalMedicinePrice,
        "cart": [
          ...cartItems.map((e) {
            return {"product": e.id, "price": e.price, "quantity": e.qty};
          })
        ]
      },
      options: Options(headers: {
        "Authorization": token,
      }),
      onLoadingStatusChange: (isLoading) {
        isLoadingPlaceOrder = isLoading;
        notifyListeners();
      },
      isReturnComplete: true,
      onComplete: (res) async {
        if (res["success"] == true) {
          isLoadingPlaceOrder = true;
          notifyListeners();
          Dio dio = Dio(BaseOptions(headers: {"accept": "application/json"}));
          var res = await dio.post(
            "$checkOutOrderAPI?receipt_id=$receiptId",
            data: {
              "razorpay_payment_id": razorPayPaymentId,
              "razorpay_order_id": razorPayOrderId,
              "razorpay_signature": razorPaySignature,
            },
          );
          if (res.data != null) {
            if (res.data["success"] == true) {
              showToast(msg: "Order Placed Successfully");
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove("cart_items");
              cartItems = [];
              isLoadingPlaceOrder = false;
              notifyListeners();
              getIt.get<Alice>().getNavigatorKey()?.currentState?.pushNamedAndRemoveUntil(MainScreen.routName, (route) => true, arguments: ArgModelMain(pageIndex: 2, tabIndex: 2));
            } else {
              throw somethingWentWrong;
            }
          } else {
            throw somethingWentWrong;
          }
          return true;
        }
      },
    );
  }

  late Razorpay razorpay;

  void handlePaymentSuccess(PaymentSuccessResponse response) async {
    customPrint('razorpay success -->> ${response.data} ${response.orderId} ${response.paymentId} ${response.signature}');
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'Payment Failed', toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.white70, textColor: AppColors.darkBlue, fontSize: 12.0);
    razorpay.clear();
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    razorpay.clear();
  }

  CartArgModel? cartArgModel;

  Future onTapGetOrderId({
    required String firstName,
    required String lastName,
    required String email,
    required String address,
    required String pinCode,
    required String city,
  }) async {
    cartArgModel = CartArgModel(firstName: firstName, lastName: lastName, email: email, address: address, pinCode: pinCode, city: city);
    notifyListeners();
    String token = "Bearer " + await GetIt.I.get<PreferenceUtil>().getAccessToken();
    return await ApiHelper.fetchWithLoading(
      method: HttpMethod.get,
      api: "${createOrderAPIAPI}?price=${getTotal}&user_id=${await getIt.get<PreferenceUtil>().getUserId()}",
      onLoadingStatusChange: (isLoading) {
        isLoadingPlaceOrder = isLoading;
        notifyListeners();
      },
      options: Options(headers: {
        "Authorization": token,
      }),
      isReturnComplete: true,
      onComplete: (res) async {
        customPrint("res -->>> ${res}");
        if (res != null) {
          isLoadingPlaceOrder = true;
          notifyListeners();
          final callbackUrl = res["callback_url"] ?? '';
          final parsedCallbackUri = callbackUrl.isNotEmpty ? Uri.tryParse(callbackUrl) : null;
          Map<String, String> query = parsedCallbackUri?.queryParameters ?? {};
          openRazorPay(
            options: {
              "key": Constant.razorKey,
              "name": res['name'],
              "description": res['ayursh_order_id'],
              "image": 'https://s3.amazonaws.com/rzp-mobile/images/rzp.png',
              "amount": res['razorpay_amount'],
              "razorpay_merchant_key": res['razorpay_merchant_key'],
              "order_id": res['razorpay_order_id'],
              // "razorpay_order_id": res['razorpay_order_id'],
              "receipt_id": query['receipt_id'],
              "shipping_cost": res['shipping_cost'],
              'prefill': {'contact': "${await getIt.get<PreferenceUtil>().getPhoneNumber()}", 'email': email, 'name': "${firstName} ${lastName}"}
            },
          );
        }
      },
    );
  }

  void openRazorPay({required Map<String, dynamic> options}) {
    try {
      isLoadingPlaceOrder = true;
      notifyListeners();
      print('options pass in razor pay ${options.toString()}');

      razorpay.open(options);

      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (PaymentSuccessResponse response) {
        customPrint('razorpay success -->> ${response.data} ${response.orderId} ${response.paymentId} ${response.signature}');

        onTapPlaceOrder(
            razorPayOrderId: options['razorpay_order_id'] ?? '',
            razorPaySignature: response.signature ?? '',
            receiptId: options['receipt_id'],
            razorPayPaymentId: response.paymentId ?? '',
            firstName: cartArgModel?.firstName ?? '',
            lastName: cartArgModel?.lastName ?? '',
            email: cartArgModel?.email ?? '',
            address: cartArgModel?.address ?? '',
            pinCode: cartArgModel?.pinCode ?? '',
            city: cartArgModel?.city ?? '',
            deliveryPrice: options['shipping_cost'],
            totalMedicinePrice: getTotal,
            totalPrice: options['amount']);
        razorpay.clear();
      });
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    } catch (e) {
      customPrint("openRazorPay Error : $e");
    }
  }
}
