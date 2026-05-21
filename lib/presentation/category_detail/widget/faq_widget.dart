import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/domain/model/response/faq_model.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';

class FaqWidget extends StatelessWidget {
  final List<FaqModel> faqList;

  FaqWidget(this.faqList);

  @override
  Widget build(BuildContext context) {
    if (faqList.isEmpty) {
      return Container();
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(top: 2, left: 16, right: 16),
      child: Padding(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                text: 'Frequently Asked Questions',
                fontSize: 14,
                height: 19,
                fontWeight: FontWeight.bold,
                textColor: AppColors.darkGray)
          ]..addAll(faqList
              .map((faq) => Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: _faqWidget(faq),
                  ))
              .toList()),
        ),
      ),
    );
  }

  Widget _faqWidget(FaqModel faq) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Text('Q.',
              style: TextStyle(
                  color: AppColors.darkGray, fontWeight: Constant.fontMedium)),
        ),
        SizedBox(width: 12),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Text(faq.question,
                  style: TextStyle(color: AppColors.darkGray, height: 1.3)),
              SizedBox(height: 8),
              Text(faq.answer,
                  style: TextStyle(
                      color: AppColors.darkGray, height: 1.3, fontSize: 12))
            ]))
      ],
    );
  }
}
