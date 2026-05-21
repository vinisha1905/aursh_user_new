import 'dart:convert';
import 'dart:developer';

import 'package:ayursh/domain/api_helper.dart';
import 'package:ayursh/domain/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

customPrint(String value) {
  if (kDebugMode) {
    DateTime now = DateTime.now();
    log("===>>> ${DateFormat("dd/MM/yyy").add_jms().format(now)} ===>>> $value");
  }
}

customLogInfo(String value) {
  if (kDebugMode) {
    DateTime now = DateTime.now();
    ApiHelper.logger.i("${DateFormat("dd/MM/yyy").add_jms().format(now)} ==>> $value");
  }
}

customLogInfoWithData(dynamic data, String api, HttpMethod method) {
  if (kDebugMode && data != null) {
    String value = "${method.name} $baseUrl$api Data ===>>> ${data is FormData ? data.fields : prettyPrint(jsonEncode(data))}";
    DateTime now = DateTime.now();
    ApiHelper.logger.i("${DateFormat("dd/MM/yyy").add_jms().format(now)} ==>> $value");
  }
}

customLogResponse(Response response, String api, HttpMethod method) {
  if (kDebugMode) {
    String value = "${method.name} $baseUrl$api || Response || ${response.statusCode} ${prettyPrint(jsonEncode(response.data))}";
    DateTime now = DateTime.now();
    ApiHelper.logger.v("${DateFormat("dd/MM/yyy").add_jms().format(now)} ==>> $value");
  }
}

customLogError(String value) {
  if (kDebugMode) {
    DateTime now = DateTime.now();
    ApiHelper.logger.e("${DateFormat("dd/MM/yyy").add_jms().format(now)} ==>> $value");
  }
}

customLogErrorCatch(dynamic e, String api) {
  if (kDebugMode) {
    DateTime now = DateTime.now();
    ApiHelper.logger.e("${DateFormat("dd/MM/yyy").add_jms().format(now)} || $baseUrl$api\nError : ${e.toString()}");
  }
}

customLogErrorDioExceptionWithoutRes(String api) {
  if (kDebugMode) {
    String value = "$baseUrl$api DioException ===>>> Response || Something Went Wrong";
    DateTime now = DateTime.now();
    ApiHelper.logger.e("${DateFormat("dd/MM/yyy").add_jms().format(now)} ==>> $value");
  }
}

customLogErrorDioException(DioException e, String api) {
  if (kDebugMode) {
    String value = "DioException\n$baseUrl$api || ${e.response?.statusCode} || ${e.error} \nResponse || ${prettyPrint(e.response?.data)}";
    DateTime now = DateTime.now();
    ApiHelper.logger.e("${DateFormat("dd/MM/yyy").add_jms().format(now)} ==>> $value");
  }
}
