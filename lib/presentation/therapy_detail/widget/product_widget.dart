import 'package:ayursh/domain/model/response/product_used_model.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductWidget extends StatelessWidget {
  final ProductUsedModel product;

  ProductWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showError(product.name);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
                child: AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(
                      imageUrl: product.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      errorWidget: (a, b, c) {
                        return Container(
                          color: AppColors.dividerColor,
                        );
                      },
                    ))),
            SizedBox(height: 8),
            Text(
              product.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.darkGray,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  void _showError(String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white70,
        textColor: AppColors.darkBlue,
        fontSize: 12.0);
  }
}
