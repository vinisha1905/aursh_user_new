import 'package:ayursh/presentation/medicines/view_model/cart_vm.dart';
import 'package:ayursh/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart_page.dart';

class CartBtn extends StatelessWidget {
  const CartBtn();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: Icon(
              Icons.shopping_cart_sharp,
              color: Colors.white,
            ),
          ),
          if (context.watch<CartVM>().cartItems.length > 0)
            Container(
              decoration: BoxDecoration(
                color: Colors.red.shade300,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(right: 4),
              child: Text(
                "${context.watch<CartVM>().cartItems.length}",
                style: style12500White,
              ),
            ),
        ],
      ),
    );
  }
}
