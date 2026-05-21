import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/domain/util/size_utils.dart';
import 'package:ayursh/presentation/medicines/view/cart_page.dart';
import 'package:ayursh/presentation/medicines/view/component/zoom_image_screen.dart';
import 'package:ayursh/presentation/medicines/view_model/cart_vm.dart';
import 'package:ayursh/presentation/medicines/view_model/medicines_vm.dart';
import 'package:ayursh/presentation/widget/api_state_widgets.dart';
import 'package:ayursh/presentation/widget/custom_button.dart';
import 'package:ayursh/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../util/app_colors.dart';
import '../../widget/image_container.dart';
import '../models/get_product_model.dart';
import 'component/cart_btn.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productId;
  final ProductResult productResult;

  const ProductDetailsPage(
      {required this.productId, required this.productResult});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<MedicinesVM>()
          .getProductDetails(productId: widget.productId);
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
          actions: [
            CartBtn(),
          ],
        ),
        body: CustomApiUi(
          state: context.watch<MedicinesVM>().getProductDetailsApiState,
          error: context.watch<MedicinesVM>().errorGetProductDetails,
          onRefresh: () async {
            await context.read<MedicinesVM>().getProductDetails(
                isRefresh: true, productId: widget.productId);
          },
          onTryAgain: () => context
              .read<MedicinesVM>()
              .getProductDetails(productId: widget.productId),
          customWidget: buildUi(),
        ),
      ),
    );
  }

  buildUi() {
    var data = context.watch<MedicinesVM>().productDetailsModel;
    int qty = 0;

    int i = context
        .watch<CartVM>()
        .cartItems
        .indexWhere((element) => element.id == data?.id);

    if (i >= 0) {
      qty = context.watch<CartVM>().cartItems[i].qty;
    }

    return ListView(
      children: [
        ImageSliderView(),
        h(6),
        Ink(
          color: white,
          child: customPaddingH(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              h(16),
              Text(
                capitalizeEachWord((data?.name ?? "")),
                style: style20600Secondary,
              ),
              if (data?.shortDescription != "" &&
                  data?.shortDescription != null)
                h(8),
              if (data?.shortDescription != "" &&
                  data?.shortDescription != null)
                Text(
                  data?.shortDescription ?? "",
                  style: TextStyle(color: AppColors.darkGray, height: 1.4),
                ),
              h(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "₹ ${data?.price ?? ""}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: primaryGreenColor,
                    ),
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (qty == 0)
                          ? customButton(
                              onTap: () {
                                if (qty != 0) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CartPage()));
                                } else {
                                  context.read<CartVM>().onTapAddItem(
                                      ProductResult(
                                          id: data?.id,
                                          category: data?.category,
                                          name: data?.name,
                                          photo: data?.photo,
                                          price: data?.price,
                                          qty: qty,
                                          shortDescription:
                                              data?.shortDescription,
                                          supplier: data?.supplier));
                                }
                              },
                              isOutLine: false,
                              height: 34,
                              name: qty != 0 ? "View Cart" : "Add to cart",
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              fontSize: 12,
                            )
                          : Row(
                              children: [
                                w(6),
                                Container(
                                  constraints: const BoxConstraints(
                                      maxHeight: 32, maxWidth: 32),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: qty == 0
                                        ? null
                                        : () {
                                            context
                                                .read<CartVM>()
                                                .onTapRemoveItem(
                                                    widget.productResult);
                                          },
                                    icon: SvgPicture.asset(
                                      "assets/icons/remove_item.svg",
                                      height: 22,
                                    ),
                                  ),
                                ),
                                w(6),
                                Text(
                                  "${qty}",
                                  style: style14600Secondary.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                w(6),
                                Container(
                                  constraints: const BoxConstraints(
                                      maxHeight: 32, maxWidth: 32),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      context
                                          .read<CartVM>()
                                          .onTapAddItem(widget.productResult);
                                    },
                                    icon: SvgPicture.asset(
                                      "assets/icons/add_item.svg",
                                      height: 22,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  )
                ],
              ),
              h(16),
            ],
          ),
        ),
        if (data?.ingredients != "" && data?.ingredients != null) h(6),
        if (data?.ingredients != "" && data?.ingredients != null)
          Container(
            color: white,
            child: customPaddingH(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h(12),
                Text(
                  "Ingredients",
                  style: style14600Secondary,
                ),
                h(12),
                Text(
                  data?.ingredients ?? "",
                  style: TextStyle(color: AppColors.darkGray, height: 1.4),
                ),
                h(12),
              ],
            ),
          ),
        if (data?.longDescription != "" && data?.longDescription != null) h(6),
        if (data?.longDescription != "" && data?.longDescription != null)
          Container(
            color: white,
            child: customPaddingH(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h(16),
                Text(
                  data?.longDescription ?? "",
                  style: TextStyle(color: AppColors.darkGray, height: 1.4),
                ),
                h(16),
              ],
            ),
          ),
        h(6),
        Container(
          color: white,
          child: customPaddingH(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              h(16),
              Text(
                "The product will be delivered within 5-7 working days, depending on your location",
                style: TextStyle(color: AppColors.greyMedium, height: 1.3),
              ),
              h(16),
            ],
          ),
        ),
      ],
    );
  }
}

class ImageSliderView extends StatefulWidget {
  const ImageSliderView();

  @override
  State<ImageSliderView> createState() => _ImageSliderViewState();
}

class _ImageSliderViewState extends State<ImageSliderView> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var image = [
      context.watch<MedicinesVM>().productDetailsModel?.mainImage ?? "",
      context.watch<MedicinesVM>().productDetailsModel?.childImages ?? ""
    ];

    if (image.isEmpty) {
      return networkImageContainer(
        imageUrl: "",
        height: 300,
        width: double.infinity,
        fit: BoxFit.fitHeight,
      );
    } else {
      return Stack(
        children: [
          SizedBox(
            height: 300,
            width: width(context, 1),
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                context.read<MedicinesVM>().setImageSliderIndex(value);
              },
              children: [
                ...image.map((e) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            ZoomImageScreen(
                          index: image.indexOf(e),
                          galleryImages: image,
                        ),
                      ));
                    },
                    child: networkImageContainer(
                      imageUrl: e,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                  );
                })
              ],
            ),
          ),
          if (image.length > 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 300,
                  width: width(context, 0.2),
                  alignment: Alignment.center,
                  child: customInkWellColor(
                    onTap: context.watch<MedicinesVM>().imageSliderIndex == 0
                        ? null
                        : () {
                            pageController.animateToPage(
                              context.read<MedicinesVM>().imageSliderIndex - 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                    borderRadius: BorderRadius.circular(10),
                    child: Ink(
                      height: width(context, 0.1),
                      width: width(context, 0.1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            context.watch<MedicinesVM>().imageSliderIndex == 0
                                ? white.withOpacity(0.1)
                                : white.withOpacity(0.2),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/arrow_left_slider.svg",
                          height: 18,
                          colorFilter:
                              context.watch<MedicinesVM>().imageSliderIndex == 0
                                  ? const ColorFilter.mode(
                                      grey400Color, BlendMode.srcIn)
                                  : null,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: width(context, 0.2),
                  alignment: Alignment.center,
                  child: customInkWellColor(
                    onTap: context.watch<MedicinesVM>().imageSliderIndex ==
                            (image.length - 1)
                        ? null
                        : () {
                            pageController.animateToPage(
                              context.read<MedicinesVM>().imageSliderIndex + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                    borderRadius: BorderRadius.circular(10),
                    child: Ink(
                      height: width(context, 0.1),
                      width: width(context, 0.1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: context.watch<MedicinesVM>().imageSliderIndex ==
                                (image.length - 1)
                            ? white.withOpacity(0.1)
                            : white.withOpacity(0.2),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/arrow_right_slider.svg",
                          height: 18,
                          colorFilter:
                              context.watch<MedicinesVM>().imageSliderIndex ==
                                      (image.length - 1)
                                  ? const ColorFilter.mode(
                                      grey400Color, BlendMode.srcIn)
                                  : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
        ],
      );
    }
  }
}
