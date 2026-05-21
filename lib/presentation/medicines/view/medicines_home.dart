import 'package:ayursh/domain/api_helper.dart';
import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/domain/util/custom_print.dart';
import 'package:ayursh/domain/util/size_utils.dart';
import 'package:ayursh/presentation/medicines/models/get_product_model.dart';
import 'package:ayursh/presentation/medicines/view/cart_page.dart';
import 'package:ayursh/presentation/widget/api_state_widgets.dart';
import 'package:ayursh/presentation/widget/custom_button.dart';
import 'package:ayursh/presentation/widget/image_container.dart';
import 'package:ayursh/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../view_model/cart_vm.dart';
import '../view_model/medicines_vm.dart';
import 'component/cart_btn.dart';
import 'component/filter_drawer.dart';
import 'product_details_page.dart';
import 'search_product_page.dart';

class MedicinesHome extends StatefulWidget {
  MedicinesHome();

  @override
  State<MedicinesHome> createState() => _MedicinesHomeState();
}

class _MedicinesHomeState extends State<MedicinesHome> {
  final PagingController<int, ProductResult> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ProfileEvent.getProfile();
      context.read<MedicinesVM>().getMenuList();
      context.read<CartVM>().loadItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: grey50Color,
        drawer: FilterDrawer(pagingController: pagingController),
        appBar: AppBar(
          backgroundColor: primaryGreenColor,
          title: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchProductPage()));
            },
            child: Container(
              height: 34,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Icon(
                    Icons.search,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Search medicines",
                    style: style13400White,
                  ),
                ],
              ),
            ),
          ),
          elevation: 0,
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.filter_list,
                  color: Colors.white,
                ),
              );
            },
          ),
          actions: [
            CartBtn(),
          ],
        ),
        body: PagedGridView<int, ProductResult>(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: sizer(context, 0.2) + 104 + 34,
          ),
          pagingController: pagingController,
          padding: padding,
          builderDelegate: PagedChildBuilderDelegate<ProductResult>(
            firstPageProgressIndicatorBuilder: (context) => loadingWidget(),
            newPageProgressIndicatorBuilder: (context) => loadingWidget(),
            noItemsFoundIndicatorBuilder: (context) => noItemsFoundWidget(
              title: "Products not found",
            ),
            firstPageErrorIndicatorBuilder: (context) => noItemsFoundWidget(
              title: "${pagingController.error}",
            ),
            itemBuilder: (context, e, index) {
              bool isInCart = false;

              int i = context
                  .watch<CartVM>()
                  .cartItems
                  .indexWhere((element) => element.id == e.id);

              if (i >= 0) {
                isInCart = true;
              }

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(
                        productId: e.id.toString(),
                        productResult: e,
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: Colors.black12,
                          spreadRadius: 4,
                          blurRadius: 14)
                    ],
                  ),
                  child: Column(
                    children: [
                      networkImageContainer(
                        borderRadius: BorderRadius.circular(14),
                        imageUrl: e.photo ?? "",
                        height: sizer(context, 0.2),
                      ),
                      h(6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Text(
                              capitalizeEachWord((e.name ?? "")),
                              style: style14600Secondary,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            if (e.shortDescription != "" &&
                                e.shortDescription != null)
                              h(4),
                            if (e.shortDescription != "" &&
                                e.shortDescription != null)
                              Text(
                                e.shortDescription ?? "",
                                style: style11400Grey500,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              ),
                            h(8),
                            Text(
                              "₹ ${e.price ?? ""}",
                              style: style15600PrimaryGreen,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
                        child: customButton(
                          onTap: () {
                            if (isInCart) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartPage()));
                            } else {
                              context.read<CartVM>().onTapAddItem(e);
                            }
                          },
                          isOutLine: isInCart,
                          height: 34,
                          name: isInCart ? "View Cart" : "Add to cart",
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          fontSize: 12,
                        ),
                      ),
                      h(8),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _fetchPage(int pageKey) async {
    List<FilterModel> manufacturer = context
        .read<MedicinesVM>()
        .manufacturerList
        .where((element) => element.isSelected)
        .toList();
    List<FilterModel> medicines = context
        .read<MedicinesVM>()
        .medicinesList
        .where((element) => element.isSelected)
        .toList();
    List<FilterModel> category = context
        .read<MedicinesVM>()
        .categoryList
        .where((element) => element.isSelected)
        .toList();

    bool isFilterMode =
        manufacturer.isNotEmpty || medicines.isNotEmpty || category.isNotEmpty;

    try {
      String? error;

      // String api = "$getProductListAPI?page=$pageKey";
      //
      // if (isFilterMode) {
      //   for (var e in manufacturer) {
      //     if (e.isSelected) {
      //       api += "&filter_by=supplier-${e.id}";
      //     }
      //   }
      //
      //   for (var e in medicines) {
      //     if (e.isSelected) {
      //       api += "&filter_by=subcategory-${e.id}";
      //     }
      //   }
      //
      //   for (var e in category) {
      //     if (e.isSelected) {
      //       api += "&filter_by=subcategory-${e.id}";
      //     }
      //   }
      // }
      String api = "$getProductListAPI?page=$pageKey";

      final List<String> filterQueries = [];
      context
          .read<MedicinesVM>()
          .manufacturerList
          .where((e) => e.isSelected)
          .forEach((e) => filterQueries.add("supplier-${e.id}"));

      context
          .read<MedicinesVM>()
          .medicinesList
          .where((e) => e.isSelected)
          .forEach((e) => filterQueries.add("subcategory-${e.id}"));

      context
          .read<MedicinesVM>()
          .categoryList
          .where((e) => e.isSelected)
          .forEach((e) => filterQueries.add("subcategory-${e.id}"));

      if (filterQueries.isNotEmpty) {
        api += "&filter_by=" + filterQueries.join("&filter_by=");
      }

      customPrint("api => ${api}");

      final newItems = await ApiHelper.fetchWithApiState(
        method: HttpMethod.get,
        api: api,
        onApiStateChange: (state) {},
        onError: (err) {
          error = err;
        },
        onComplete: (res) {},
        isRefresh: null,
      );

      customPrint("Error : $error");
      customPrint("newData : $newItems");

      if (error != null) {
        throw error ?? "";
      }

      var newData = GetProductModel.fromJson(newItems);

      final isLastPage = newData.next == null;

      if (isLastPage) {
        pagingController.appendLastPage(newData.results ?? []);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newData.results ?? [], nextPageKey);
      }
    } catch (error) {
      customPrint("Catch Error Pagination Home Page => $error");
      pagingController.error = error.toString();
    }
  }
}
