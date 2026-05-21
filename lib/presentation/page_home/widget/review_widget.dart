import 'package:ayursh/domain/model/response/user_review_model.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewWidget extends StatelessWidget {
  final UserReviewModel reviewModel;

  ReviewWidget(this.reviewModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset('assets/icons/quote_left.svg'),
                  ),
                  Positioned(
                    left: 4,
                    top: 12,
                    right: 0,
                    bottom: 12,
                    child: SvgPicture.asset('assets/icons/bg_user_reviews.svg',
                        fit: BoxFit.fill),
                  ),
                  Positioned(
                    left: 18,
                    top: 36,
                    right: 24,
                    bottom: 32,
                    child: Container(
                      child: Center(
                        child: ClipOval(
                          child: Image.network(
                           reviewModel.userImageUrl,

                          )
                        ),
                      ),
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(left: 14, top: 18, right: 24),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4, bottom: 4),
                          child: Text(reviewModel.userReview,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: AppColors.darkGray, height: 1.4, )),
                        ),
                        SvgPicture.asset('assets/icons/quote_right.svg')
                      ],
                    ),
                    Positioned(
                      bottom: 12,
                      right: 3,
                      child: TextWidget(
                        text: reviewModel.userName, fontSize: 12, height: 16, textColor: AppColors.darkGray,
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
