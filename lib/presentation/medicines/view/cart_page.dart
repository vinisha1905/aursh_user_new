import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/domain/util/size_utils.dart';
import 'package:ayursh/presentation/medicines/view/checkout_page.dart';
import 'package:ayursh/presentation/medicines/view_model/cart_vm.dart';
import 'package:ayursh/presentation/widget/api_state_widgets.dart';
import 'package:ayursh/presentation/widget/custom_button.dart';
import 'package:ayursh/presentation/widget/image_container.dart';
import 'package:ayursh/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatefulWidget {
  const CartPage();

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: grey50Color,
        appBar: AppBar(
          backgroundColor: primaryGreenColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Cart",
            style: TextStyle(color: white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
        body: context.watch<CartVM>().cartItems.isEmpty
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Your cart is empty.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: secondaryColor),
                    ),
                    constHeight10(),
                    customButton(
                      height: 40,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      name: "Continue Shopping",
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      fontSize: 14,
                    ),
                  ],
                ),
              )
            : ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.black12,
                              spreadRadius: 4,
                              blurRadius: 14)
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          h(12),
                          Padding(
                            padding: paddingH,
                            child: Text(
                              "Cart Items",
                              style: style14600Secondary.copyWith(fontSize: 15),
                            ),
                          ),
                          ...context.watch<CartVM>().cartItems.map(
                            (e) {
                              bool isLast =
                                  context.watch<CartVM>().cartItems.last == e;

                              return Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Column(
                                    children: [
                                      Ink(
                                        height: 120,
                                        padding: const EdgeInsets.all(12),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            networkImageContainer(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              imageUrl: e.photo ?? "",
                                              height: 96,
                                              width: 92,
                                            ),
                                            w(8),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 32),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            capitalizeEachWord(
                                                                (e.name ?? "")),
                                                            maxLines: 2,
                                                            style:
                                                                style14600Secondary
                                                                    .copyWith(
                                                                        fontSize:
                                                                            16),
                                                          ),
                                                          h(4),
                                                          Text(
                                                            e.shortDescription ??
                                                                "",
                                                            style:
                                                                style12400Grey500,
                                                            maxLines: 1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "₹ ${e.price ?? ""}",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                primaryGreenColor,
                                                          ),
                                                        ),
                                                      ),
                                                      w(6),
                                                      Container(
                                                        constraints:
                                                            const BoxConstraints(
                                                                maxHeight: 26,
                                                                maxWidth: 26),
                                                        child: IconButton(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          onPressed: e.qty == 0
                                                              ? null
                                                              : () {
                                                                  context
                                                                      .read<
                                                                          CartVM>()
                                                                      .onTapRemoveItem(
                                                                          e);
                                                                },
                                                          icon:
                                                              SvgPicture.asset(
                                                            "assets/icons/remove_item.svg",
                                                            height: 18,
                                                          ),
                                                        ),
                                                      ),
                                                      w(6),
                                                      Text(
                                                        "${e.qty}",
                                                        style:
                                                            style12400Secondary
                                                                .copyWith(
                                                                    fontSize:
                                                                        14),
                                                      ),
                                                      w(6),
                                                      Container(
                                                        constraints:
                                                            const BoxConstraints(
                                                                maxHeight: 26,
                                                                maxWidth: 26),
                                                        child: IconButton(
                                                          onPressed: () {
                                                            context
                                                                .read<CartVM>()
                                                                .onTapAddItem(
                                                                    e);
                                                          },
                                                          padding:
                                                              EdgeInsets.zero,
                                                          icon:
                                                              SvgPicture.asset(
                                                            "assets/icons/add_item.svg",
                                                            height: 18,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (!isLast)
                                        Divider(
                                          height: 1,
                                          endIndent: 16,
                                          indent: 16,
                                          color: grey300Color,
                                        ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                          maxHeight: 34, maxWidth: 34),
                                      child: IconButton(
                                        onPressed: () {
                                          context
                                              .read<CartVM>()
                                              .onTapDeleteItem(e);
                                        },
                                        icon: SvgPicture.asset(
                                          "assets/icons/bin.svg",
                                          colorFilter: const ColorFilter.mode(
                                              Colors.red, BlendMode.srcIn),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                          Divider(
                            height: 1,
                            color: grey500Color,
                          ),
                          h(16),
                          Padding(
                            padding: paddingH,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: style15600Secondary,
                                    ),
                                    Text(
                                      "₹ ${context.watch<CartVM>().getTotal}",
                                      style: style16600Secondary,
                                    ),
                                  ],
                                ),
                                h(16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: customButton(
                                        isOutLine: true,
                                        height: 40,
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        name: "Continue Shopping",
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                        fontSize: 14,
                                      ),
                                    ),
                                    w(16),
                                    Expanded(
                                      child: customButton(
                                        height: 40,
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CheckoutPage()));
                                        },
                                        name: "Checkout",
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          h(16),
                        ],
                      ),
                    ),
                  ),
                  h(24),
                ],
              ),
      ),
    );
  }
}
