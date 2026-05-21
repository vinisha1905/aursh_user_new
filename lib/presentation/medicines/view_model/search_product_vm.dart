import 'package:ayursh/domain/api_helper.dart';
import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/presentation/medicines/models/get_product_model.dart';
import 'package:flutter/cupertino.dart';

class SearchProductVM extends ChangeNotifier {
  String searchText = "";

  initSearchPage() {
    searchText = "";
    searchProductsList = [];
    notifyListeners();
  }

  onChangeSearch(String val) {
    searchText = val;
    notifyListeners();
  }

  ApiState getSearchProductApiState = ApiState.done;

  String errorSearchProduct = "";
  List<ProductResult>? searchProductsList;

  Future getSearchProduct({bool? isRefresh}) async {
    await ApiHelper.fetchWithApiState(
      method: HttpMethod.get,
      api: "$searchProductAPI?q=$searchText",
      isRefresh: isRefresh,
      onApiStateChange: (state) {
        getSearchProductApiState = state;
        notifyListeners();
      },
      onError: (error) {
        errorSearchProduct = error;
        notifyListeners();
      },
      onComplete: (res) {
        if (res is List) {
          searchProductsList = res.map((e) => ProductResult.fromJson(e)).toList();
          notifyListeners();
        }
      },
    );
  }
}
