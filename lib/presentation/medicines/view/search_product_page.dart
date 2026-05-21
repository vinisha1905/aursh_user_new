import 'dart:async';

import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/domain/util/size_utils.dart';
import 'package:ayursh/presentation/medicines/view_model/search_product_vm.dart';
import 'package:ayursh/presentation/widget/api_state_widgets.dart';
import 'package:ayursh/presentation/widget/image_container.dart';
import 'package:ayursh/presentation/widget/text_filed.dart';
import 'package:ayursh/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_details_page.dart';

class SearchProductPage extends StatefulWidget {
  const SearchProductPage();

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  TextEditingController searchController = TextEditingController();
  Timer? debounce;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchProductVM>().initSearchPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: grey50Color,
        appBar: AppBar(
          backgroundColor: primaryGreenColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
          titleSpacing: 0,
          title: Container(
            constraints: BoxConstraints(maxHeight: 40),
            margin: EdgeInsets.only(right: 16),
            child: customTextFiled(
              controller: searchController,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              borderColor: white,
              autofocus: true,
              fillColor: white,
              hintText: "Search medicines..",
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 40, minWidth: 40),
              onChanged: (value) {
                if (debounce?.isActive ?? false) debounce!.cancel();
                debounce = Timer(const Duration(milliseconds: 500), () async {
                  context.read<SearchProductVM>().onChangeSearch(value);
                  await context.read<SearchProductVM>().getSearchProduct();
                });
              },
              prefixIcon: Icon(
                Icons.search,
                size: 16,
                color: grey500Color,
              ),
            ),
          ),
        ),
        body: CustomApiUi(
          hidePullToRefresh: true,
          state: context.watch<SearchProductVM>().getSearchProductApiState,
          error: context.watch<SearchProductVM>().errorSearchProduct,
          onRefresh: () async {
            await context
                .read<SearchProductVM>()
                .getSearchProduct(isRefresh: true);
          },
          onTryAgain: () => context.read<SearchProductVM>().getSearchProduct(),
          customWidget: buildUi(),
        ),
      ),
    );
  }

  Widget buildUi() {
    List data = context.watch<SearchProductVM>().searchProductsList ?? [];

    if (context.watch<SearchProductVM>().searchText == "") {
      return noItemsFoundWidget(title: "Search to get medicines");
    }

    if (data.isEmpty) {
      return noItemsFoundWidget(title: "No medicines found");
    }

    return ListView(
      children: [
        ...data.map((e) {
          return customInkWellColor(
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
            borderRadius: BorderRadius.circular(12),
            margin: padding,
            child: Ink(
              height: 100,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  networkImageContainer(
                    borderRadius: BorderRadius.circular(6),
                    imageUrl: e.photo ?? "",
                    height: 76,
                    width: 76,
                  ),
                  w(8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            capitalizeEachWord((e.name ?? "")),
                            maxLines: 2,
                            style: style14600Secondary,
                          ),
                        ),
                        Text(
                          "₹ ${e.price ?? ""}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: primaryGreenDarkColor,
                          ),
                        ),
                        h(8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        })
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    debounce?.cancel();
  }
}
