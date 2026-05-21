import 'package:ayursh/presentation/consultation_booking_detail/consultation_booking_detail_screen.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/line_divider_widget.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ayursh/domain/model/response/internal_consultation_model.dart';

class DoctorConsultationWidget extends StatelessWidget {
  final InternalConsultationModel doctorModel;

  const DoctorConsultationWidget({Key? key, required this.doctorModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor = AppColors.darkYellow;
    String status = doctorModel.status.toLowerCase();
    if (status == 'completed') {
      statusColor = AppColors.successColor;
    } else if (status == 'delayed') {
      statusColor = AppColors.darkYellow;
    } else if (status == 'cancelled') {
      statusColor = AppColors.cancelColor;
    } else if (status == 'upcoming') {
      statusColor = AppColors.darkBlue;
    } else if (status == 'ongoing') {
      statusColor = AppColors.yellowColor;
    }

    return Card(
      margin: EdgeInsets.only(left: 16, right: 16, top: 18),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
              ConsultationBookingDetailScreen.routName,
              arguments: ConsultationBookingDetailArguments(doctorModel));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: ClipOval(
                  child: Container(
                width: 60,
                height: 60,
                child: AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(
                      imageUrl: doctorModel.displayImage,
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                      errorWidget: (ctx, a, b) {
                        return Container(
                          color: AppColors.grayLight,
                        );
                      },
                    )),
              )),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 22),
                  TextWidget(
                      text: doctorModel.displayName,
                      fontSize: 16,
                      height: 21,
                      textColor: AppColors.darkGray,
                      fontWeight: Constant.fontMedium),
                  SizedBox(height: 4),
                  TextWidget(
                      text: doctorModel.qualification,
                      fontSize: 14,
                      height: 19,
                      textColor: AppColors.darkGray),
                  SizedBox(height: 8),
                  LineDividerWidget(),
                  SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                          text: doctorModel.status,
                          fontSize: 12,
                          height: 16,
                          textColor: statusColor,
                          fontWeight: FontWeight.bold),
                      SizedBox(width: 8),
                      TextWidget(
                          text: doctorModel.appointmentDate,
                          fontSize: 12,
                          height: 16,
                          textColor: AppColors.grayLight,
                          fontWeight: FontWeight.bold),
                      Expanded(child: Container()),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.darkBlue,
                        size: 16,
                      )
                    ],
                  ),
                  SizedBox(height: 14),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
