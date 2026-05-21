import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/domain/model/response/therapy_category_model.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final TherapyCategoryModel categoryModel;
  final bool isSelected;
  final Function(String title) onTap;

  CategoryWidget(this.categoryModel, this.isSelected, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSelected ? null : () => onTap(categoryModel.title),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          shape: BoxShape.rectangle,
          border: Border.all(color: isSelected? AppColors.darkBlue : AppColors.darkGray),
          color: isSelected? AppColors.darkBlue : Colors.white
        ),
        child: TextWidget(
          text: categoryModel.name,
          fontSize: 12,
          height: 16,
          textColor: isSelected ? Colors.white : AppColors.darkBlue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
