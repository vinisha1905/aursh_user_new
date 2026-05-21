import 'package:ayursh/domain/api_helper.dart';
import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/domain/model/response/medicine_booking_detail_model.dart';
import 'package:ayursh/domain/model/response/medicine_booking_model.dart';
import 'package:ayursh/domain/util/preference_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class MedicineBookingVM extends ChangeNotifier {
  List<MedicineBookingModel> bookings = [];
  ApiState getProductDetailsApiState = ApiState.none;

  String errorGetProductDetails = "";

  Future getBookingList({bool? isRefresh}) async {
    String token = "Bearer " + await GetIt.I.get<PreferenceUtil>().getAccessToken();
    await ApiHelper.fetchWithApiState(
      method: HttpMethod.get,
      api: "$medicineOrderListAPI",
      options: Options(headers: {
        "Authorization": token,
      }),
      isRefresh: isRefresh,
      onApiStateChange: (state) {
        getProductDetailsApiState = state;
        notifyListeners();
      },
      onError: (error) {
        errorGetProductDetails = error;
        notifyListeners();
      },
      onComplete: (res) {
        bookings = MedicineBookingModel.fromJsonList(res);
        notifyListeners();
      },
    );
  }

  MedicineBookingDetailModel? medicineBookingDetailModel;
  ApiState getBookingDetailsApiState = ApiState.none;

  String errorGetBookingDetails = "";

  Future getBookingDetail({bool? isRefresh, required int orderId}) async {
    String token = "Bearer " + await GetIt.I.get<PreferenceUtil>().getAccessToken();
    await ApiHelper.fetchWithApiState(
      method: HttpMethod.get,
      api: "$medicineOrderDetailAPI?order_id=$orderId",
      options: Options(headers: {
        "Authorization": token,
      }),
      isRefresh: isRefresh,
      onApiStateChange: (state) {
        getBookingDetailsApiState = state;
        notifyListeners();
      },
      onError: (error) {
        errorGetBookingDetails = error;
        notifyListeners();
      },
      onComplete: (res) {
        medicineBookingDetailModel = MedicineBookingDetailModel.fromJson(res);
        notifyListeners();
      },
    );
  }
}
