import 'package:ayursh/domain/model/response/therapy_short_model.dart';
import 'package:ayursh/presentation/therapy_detail/therapy_detail_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TherapyWidget extends StatelessWidget {
  final TherapyShortModel therapyModel;
  final String? categoryTitle;

  TherapyWidget({required this.therapyModel, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 7,
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(TherapyDetailScreen.routName,
                arguments: TherapyDetailArguments(
                    categoryTitle: categoryTitle ?? '',
                    therapyTitle: therapyModel.title));
          },
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: therapyModel.imageUrl,
                    progressIndicatorBuilder: (ctx, url, downloadProgess) {
                      return Center(
                          child: CircularProgressIndicator(
                              color: AppColors.darkYellow));
                    },
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: 220,
                  )),
              SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Expanded(
                      child: Text(therapyModel.name,
                          style: TextStyle(
                              color: AppColors.darkGray,
                              fontWeight: Constant.fontMedium))),
                  SizedBox(width: 16),
                  Text(
                    '● ${therapyModel.sessionDurationInMin} minutes',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.darkGray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 10)
                ],
              ),
              SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Expanded(
                      child: Text(therapyModel.englishName ?? '',
                          style: TextStyle(
                              fontSize: 12, color: AppColors.darkGray))),
                  SizedBox(width: 16),
                  SvgPicture.asset('assets/icons/ic_circle_arrow_right.svg',
                      width: 20, height: 20),
                  SizedBox(width: 10)
                ],
              ),
              SizedBox(height: 12),
            ],
          ),
        ));
  }
}
