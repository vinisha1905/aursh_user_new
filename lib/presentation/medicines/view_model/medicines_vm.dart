import 'package:ayursh/domain/api_helper.dart';
import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/presentation/medicines/models/get_product_details_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/get_menu_list_model.dart';

class MedicinesVM extends ChangeNotifier {
  int imageSliderIndex = 0;

  setImageSliderIndex(int val) {
    imageSliderIndex = val;
    notifyListeners();
  }

  ApiState getProductDetailsApiState = ApiState.none;

  String errorGetProductDetails = "";
  GetProductDetailsModel? productDetailsModel;

  Future getProductDetails({bool? isRefresh, required String productId}) async {
    if (isRefresh != true) {
      imageSliderIndex = 0;
    }
    await ApiHelper.fetchWithApiState(
      method: HttpMethod.get,
      api: "$getProductDetailsAPI/$productId",
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
        productDetailsModel = GetProductDetailsModel.fromJson(res as Map<String, dynamic>);
        notifyListeners();
      },
    );
  }

  /// Filters
  List<FilterModel> manufacturerList = [];
  List<FilterModel> medicinesList = [];
  List<FilterModel> categoryList = [];

  onTapClearFilter() {
    for (var element in manufacturerList) {
      element.isSelected = false;
    }
    for (var element in medicinesList) {
      element.isSelected = false;
    }
    for (var element in categoryList) {
      element.isSelected = false;
    }
    notifyListeners();
  }

  onTapManufacturerSelect(FilterModel e) {
    int index = manufacturerList.indexOf(e);
    manufacturerList[index].isSelected = !manufacturerList[index].isSelected;
    notifyListeners();
  }

  onTapMedicinesSelect(FilterModel e) {
    int index = medicinesList.indexOf(e);
    medicinesList[index].isSelected = !medicinesList[index].isSelected;
    notifyListeners();
  }

  onTapCategorySelect(FilterModel e) {
    int index = categoryList.indexOf(e);
    categoryList[index].isSelected = !categoryList[index].isSelected;
    notifyListeners();
  }

  ApiState getMenuListApiState = ApiState.none;

  String errorGetMenuList = "";
  GetMenuListModel? getMenuListModel;

  Future getMenuList({bool? isRefresh}) async {
    if (isRefresh != true) {
      imageSliderIndex = 0;
    }
    await ApiHelper.fetchWithApiState(
      method: HttpMethod.get,
      api: getMenuListAPI,
      isRefresh: isRefresh,
      onApiStateChange: (state) {
        getMenuListApiState = state;
        notifyListeners();
      },
      onError: (error) {
        errorGetMenuList = error;
        notifyListeners();
      },
      onComplete: (res) {
        getMenuListModel = GetMenuListModel.fromJson(res as Map<String, dynamic>);
        manufacturerList = getMenuListModel?.suppliers?.map((e) => FilterModel(title: e.shopname, id: e.id, isSelected: false)).toList() ?? [];
        medicinesList = getMenuListModel?.medicines?.map((e) => FilterModel(title: e.subCategoryTitle, id: e.id, isSelected: false)).toList() ?? [];
        categoryList = getMenuListModel?.subCategories?.map((e) => FilterModel(title: e.subCategoryTitle, id: e.id, isSelected: false)).toList() ?? [];
        notifyListeners();
      },
    );
  }
}

class FilterModel {
  String? title;
  int? id;
  bool isSelected;

  FilterModel({required this.title, required this.id, required this.isSelected});
}
