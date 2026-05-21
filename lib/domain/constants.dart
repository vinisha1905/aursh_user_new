import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';

// Enum
enum ApiState { none, loading, error, done }

enum HttpMethod { get, post, delete, put }

enum PaginationApiState { none, noDataFound, loading, error, done }

var mediaType = MediaType.parse('image/png');

const baseUrl = "https://shop.ayursh.com/";

const getProductListAPI = "api/product-list";
const getProductDetailsAPI = "api/product-detail";
const getMenuListAPI = "api/menu-list";
const searchProductAPI = "search";
const createOrderAPIAPI = "api/product/create-order/";
const medicineOrderListAPI = "api/order-list/";
const medicineOrderDetailAPI = "api/order-detail";
const checkOutOrderAPI = "https://prod.ayursh.com/payment/api/v1/pub/medicine/checkout-order";

const somethingWentWrong = "Something Went Wrong";
const tryAgain = "Try Again";

// Padding

const padding = EdgeInsets.only(top: 16, right: 16, left: 16);
const paddingH = EdgeInsets.symmetric(horizontal: 16);
const paddingV = EdgeInsets.symmetric(vertical: 16);

const paddingA = EdgeInsets.all(20);

const primaryGreenColor = Color(0xff67b963);
const primaryGreenDarkColor = Color(0xff52924F);
const secondaryColor = Color(0xFF00263B);
const primaryGreenColorForImage = Color(0xffe7f4e7);
const greenScaffoldBackGroundColor = Color(0xffe9fae9);
const cardColor = Color(0xffededed);
const errorColor = Color(0xffDC2F58);

const white = Colors.white;
const grey = Colors.grey;
const black = Colors.black;

const grey900Color = Color(0xff212121);
const grey800Color = Color(0xff424242);
const grey700Color = Color(0xff616161);
const grey600Color = Color(0xff757575);
const grey500Color = Color(0xff9E9E9E);
const grey400Color = Color(0xffBDBDBD);
const grey300Color = Color(0xffE0E0E0);
const grey200Color = Color(0xffEEEEEE);
const grey100Color = Color(0xffF5F5F5);
const grey50Color = Color(0xffFAFAFA);

String capitalizeEachWord(String text) {
  List<String> words = text.split(" "); // Split the string by spaces to get individual words
  for (int i = 0; i < words.length; i++) {
    if (words[i].isNotEmpty) {
      words[i] = words[i][0].toUpperCase() + words[i].toLowerCase().substring(1); // Capitalize each word
    }
  }
  return words.join(" "); // Join the words back into a single string with spaces
}
