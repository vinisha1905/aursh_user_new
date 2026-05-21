import 'dart:convert';

import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/domain/util/custom_print.dart';
import 'package:ayursh/domain/util/snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

class ApiHelper {
  static var logger = Logger(printer: PrettyPrinter());
  static var uuid = const Uuid();

  static final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {"accept": "application/json"},
  ));

  // static Future<Options> getOptionsWithToken() async {
  //   String token = await SharedPrefHelper.getString(key: SharedPrefHelper.token) ?? "";
  //   customPrint("Token ===>> $token");
  //   return Options(
  //     headers: {"Authorization": "Bearer $token"},
  //   );
  // }

  ///
  ///  With Loading Methods
  ///

  static Future<dynamic> fetchWithLoading({
    required HttpMethod method,
    required String api,
    dynamic data,
    Options? options,
    bool? decodeResponse,
    bool? isReturnComplete,
    required Function(bool isLoading) onLoadingStatusChange,
    Function(dynamic res)? onComplete,
    Function(dynamic res, int? statusCode)? onCompleteWithStatusCode,
  }) async
  {
    try {
      onLoadingStatusChange(true);
      customLogInfoWithData(data, api, method);
      Response response = method == HttpMethod.get
          ? await dio.get(api, data: data, options: options)
          : method == HttpMethod.post
              ? await dio.post(api, data: data, options: options)
              : method == HttpMethod.delete
                  ? await dio.delete(api, data: data, options: options)
                  : await dio.put(api, data: data, options: options);
      customLogResponse(response, api, method);
      var res = decodeResponse == true && response.data != "" ? jsonDecode(response.data.toString()) : response.data;
      if (res != null) {
        onLoadingStatusChange(false);
        if (onComplete != null) {
          if (isReturnComplete == true) {
            return onComplete(res);
          } else {
            onComplete(res);
          }
        }
        if (onCompleteWithStatusCode != null) {
          if (isReturnComplete == true) {
            return onCompleteWithStatusCode(res, response.statusCode);
          } else {
            onCompleteWithStatusCode(res, response.statusCode);
          }
        }
        return res;
      } else {
        throw somethingWentWrong;
      }
    } on DioException catch (e) {
      handleDioErrorWithLoading(e, api, decodeResponse, onLoadingStatusChange, method);
    } catch (e) {
      handleGeneralError(e, api, onLoadingStatusChange, method);
    } finally {
      onLoadingStatusChange(false);
    }
  }

  ///  With Api State Methods

  static Future<dynamic> fetchWithApiState({
    required HttpMethod method,
    required String api,
    dynamic data,
    Options? options,
    bool? isWithReturnNull,
    bool? decodeResponse,
    required Function(ApiState state) onApiStateChange,
    required Function(dynamic res) onComplete,
    required Function(String error) onError,
    required bool? isRefresh,
  }) async
  {
    try {
      if (isRefresh != true) onApiStateChange(ApiState.loading);
      customLogInfoWithData(data, api, method);
      Response response = method == HttpMethod.get
          ? await dio.get(api, data: data, options: options)
          : method == HttpMethod.post
              ? await dio.post(api, data: data, options: options)
              : method == HttpMethod.delete
                  ? await dio.delete(api, data: data, options: options)
                  : await dio.put(api, data: data, options: options);
      customLogResponse(response, api, method);
      var res = decodeResponse == true && response.data != "" ? jsonDecode(response.data) : response.data;
      if (res != null) {
        onComplete(res);
        onApiStateChange(ApiState.done);
        return res;
      } else {
        if (isWithReturnNull == true) {
          onComplete(res);
          onApiStateChange(ApiState.done);
          return res;
        } else {
          throw somethingWentWrong;
        }
      }
    } on DioException catch (e) {
      handleDioErrorWithApiState(e, api, onError, onApiStateChange, decodeResponse, method);
    } catch (e) {
      handleGeneralErrorWithApiState(e, api, onError, onApiStateChange, method);
    }
  }
}

///
///  Error Handling With Loading
///
///
void handleDioErrorWithLoading(DioException e, String api, bool? decodeResponse, Function(bool) onLoadingStatusChange, HttpMethod method) {
  onLoadingStatusChange(false);
  if (e.response != null) {
    // if (e.response?.statusCode == 401) {
    //   SharedPrefHelper.deleteAll();
    //   navigatorKey.currentState?.pushNamedAndRemoveUntil(LoginPage.name, (route) => false);
    // }
    if (kDebugMode) {
      DateTime now = DateTime.now();
      ApiHelper.logger.e(
          "${DateFormat("dd/MM/yyy").add_jms().format(now)} ==>> DioException\n${method.name} $baseUrl$api || ${e.response?.statusCode} || ${e.error} \nResponse || ${prettyPrint(e.response?.data)}");
    }
    try {
      var err = (decodeResponse == true ? jsonDecode(e.response?.data) : e.response?.data) ?? somethingWentWrong;
      handelThrowAndShowSnackBar(err);
    } catch (e) {
      showToast(msg: somethingWentWrong);
      // Get.showSnackbar(errorSnackBar(message: somethingWentWrong));
    }
  } else {
    if (kDebugMode) {
      DateTime now = DateTime.now();
      ApiHelper.logger.e("${DateFormat("dd/MM/yyy").add_jms().format(now)} ==>>${method.name} $baseUrl$api DioException ===>>> Response || Something Went Wrong || ${e.error}");
    }
    showToast(msg: somethingWentWrong);
    // Get.showSnackbar(errorSnackBar(message: somethingWentWrong));
  }
}

void handleGeneralError(dynamic e, String api, Function(bool) onLoadingStatusChange, HttpMethod method) {
  if (kDebugMode) {
    DateTime now = DateTime.now();
    ApiHelper.logger.e("${DateFormat("dd/MM/yyy").add_jms().format(now)} || ${method.name} $baseUrl$api\nError : ${e.toString()}");
  }
  showToast(msg: e.toString());
  // Get.showSnackbar(errorSnackBar(message: e.toString()));
  onLoadingStatusChange(false);
}

///
///   Error Handling With Api State
///

void handleDioErrorWithApiState(DioException e, String api, Function(String) onError, Function(ApiState) onApiStateChange, bool? decodeResponse, HttpMethod method) {
  if (e.response != null) {
    // if (e.response?.statusCode == 401) {
    //   SharedPrefHelper.deleteAll();
    //   navigatorKey.currentState?.pushNamedAndRemoveUntil(LoginPage.name, (route) => false);
    // }
    // customLogErrorDioException(e, api);
    if (kDebugMode) {
      DateTime now = DateTime.now();
      ApiHelper.logger.e(
          "${DateFormat("dd/MM/yyy").add_jms().format(now)} ==>> DioException\n${method.name} $baseUrl$api || ${e.response?.statusCode} || ${e.error} \nResponse || ${prettyPrint(e.response?.data)}");
    }
    var err = (decodeResponse == true ? jsonDecode(e.response?.data) : e.response?.data) ?? somethingWentWrong;
    onError(handelThrowAndReturnError(err));
    onApiStateChange(ApiState.error);
  } else {
    if (kDebugMode) {
      DateTime now = DateTime.now();
      ApiHelper.logger.e("${DateFormat("dd/MM/yyy").add_jms().format(now)} ==>> ${method.name} $baseUrl$api DioException ===>>> Response || Something Went Wrong || ${e.error}");
    }
    onError(somethingWentWrong);
    onApiStateChange(ApiState.error);
  }
}

void handleGeneralErrorWithApiState(dynamic e, String api, Function(String) onError, Function(ApiState) onApiStateChange, HttpMethod method) {
  if (kDebugMode) {
    DateTime now = DateTime.now();
    ApiHelper.logger.e("${DateFormat("dd/MM/yyy").add_jms().format(now)} || ${method.name} $baseUrl$api\nError : ${e.toString()}");
  }
  onError(e.toString());
  onApiStateChange(ApiState.error);
}

// Extract Error From Res

handelThrowAndShowSnackBar(e) {
  if (e != null) {
    if (e is Map) {
      showToast(msg: e["message"] ?? e.toString());
      // Get.showSnackbar(errorSnackBar(message: e["message"] ?? e.toString()));
    } else {
      showToast(msg: e.toString());
      // Get.showSnackbar(errorSnackBar(message: e.toString()));
    }
  } else {
    showToast(msg: somethingWentWrong);
    // Get.showSnackbar(errorSnackBar(message: somethingWentWrong));
  }
}

handelThrowAndReturnError(e) {
  if (e is Map) {
    return e["message"] ?? e.toString();
  } else {
    return e.toString();
  }
}

String prettyPrint(dynamic data) {
  try {
    if (data != null && data is String && isJson(data)) {
      var decoded = jsonDecode(data);
      var prettyString = const JsonEncoder.withIndent('  ').convert(decoded);
      return "\n$prettyString";
    } else {
      return data.toString();
    }
  } catch (e) {
    return data.toString();
  }
}

// Utility to check if a string is JSON
bool isJson(String data) {
  try {
    jsonDecode(data);
    return true;
  } catch (_) {
    return false;
  }
}
