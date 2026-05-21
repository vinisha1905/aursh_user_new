import 'package:ayursh/domain/model/response/booking_user_model.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingUserWidget extends StatelessWidget {
  final BookingUserModel? bookingUserModel;
  final Function() onTap;

  BookingUserWidget(this.bookingUserModel, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: bookingUserModel != null
                            ? AppColors.greyMedium
                            : AppColors.darkYellow),
                    shape: BoxShape.circle,
                    color: bookingUserModel != null
                        ? AppColors.greyMedium
                        : Colors.white),
                child: bookingUserModel != null
                    ? SvgPicture.asset(
                        'assets/icons/ic_tab_profile_selected.svg',
                        fit: BoxFit.fill,
                        color: Colors.white,
                      )
                    : Column(children: [
                        Expanded(
                            child: Icon(Icons.add, color: AppColors.darkYellow))
                      ]),
              ),
            ),
            SizedBox(height: 6),
            Text(
              bookingUserModel?.bookingForName ?? '',
              style: TextStyle(color: AppColors.darkGray, height: 1.3),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
