import 'package:ayursh/domain/model/response/therapy_category_model.dart';
import 'package:ayursh/presentation/category_detail/category_detail_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final TherapyCategoryModel categoryModel;
  final String type;

  CategoryWidget(this.categoryModel, this.type);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryDetailScreen.routName,
            arguments: CategoryDetailArguments(
                title: categoryModel.title, type: type));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(offset: Offset(0, 0), blurRadius: 12, spreadRadius: 4, color: Colors.black12)],
        ),
        alignment: Alignment.center,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipOval(
                  child: AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl: categoryModel.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ))),
            ),
            SizedBox(height: 6),
            Text(
              categoryModel.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.darkGray,
                fontWeight: Constant.fontMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
