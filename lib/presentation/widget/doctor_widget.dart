import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:ayursh/domain/model/business/session_selected_info.dart';
import 'package:ayursh/domain/model/response/doctor_model.dart';
import 'package:ayursh/presentation/book_appointment/book_appointment_screen.dart';
import 'package:ayursh/presentation/booking_user_consultation/booking_user_consultation_screen.dart';
import 'package:ayursh/presentation/doctor_detail/doctor_detail_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/divider_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/secondary_button_widget.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ayursh/utils/app_extentions.dart';

class DoctorWidget extends StatelessWidget {
  final DoctorModel doctorModel;
  final SessionSelectedInfo? sessionSelectedInfo;

  DoctorWidget({required this.doctorModel, this.sessionSelectedInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(DoctorDetailScreen.routName,
                    arguments: DoctorDetailArguments(
                        doctorInfo: doctorModel,
                        sessionSelectedInfo: sessionSelectedInfo));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl: doctorModel.displayImage,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (ctx, url, downloadProgess) {
                          return Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.darkYellow));
                        },
                        errorWidget: (ctx, url, downloadProgess) {
                          return Container(
                            color: Colors.black12,
                            child: Center(
                              child: TextWidget(
                                  text: 'No Image',
                                  fontSize: 14,
                                  height: 19,
                                  textColor: AppColors.darkBlue,
                                  fontWeight: Constant.fontMedium),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 32),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(doctorModel.displayName,
                            style: TextStyle(
                                color: AppColors.darkGray,
                                fontSize: 16,
                                height: 1.4,
                                fontWeight: Constant.fontMedium)),
                        SizedBox(height: 4),
                        TextWidget(
                            text: doctorModel.qualification,
                            fontSize: 14,
                            height: 19,
                            textColor: AppColors.darkGray),
                        SizedBox(height: 4),
                        TextWidget(
                            text: 'Experience ${doctorModel.experience} years ',
                            fontSize: 12,
                            height: 16,
                            textColor: AppColors.darkGray),
                        SizedBox(height: 8),
                        TextWidget(
                            text: '${Constant.formatCurrency(doctorModel.consultationFee.display())}',
                            fontSize: 16,
                            height: 21,
                            textColor: AppColors.darkBlue,
                            fontWeight: Constant.fontMedium),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 9,
                              height: 9,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: doctorModel.isOnline
                                    ? AppColors.successColor
                                    : AppColors.darkGray,
                              ),
                            ),
                            SizedBox(width: 12),
                            TextWidget(
                              text: doctorModel.isOnline ? 'Online' : 'Offline',
                              fontSize: 12,
                              height: 16,
                              fontWeight: Constant.fontMedium,
                              textColor: AppColors.darkGray,
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Icon(Icons.arrow_forward_ios_rounded,
                                color: AppColors.darkBlue, size: 18),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              SizedBox(width: 16),
              Expanded(
                child: SecondaryButtonWidget(
                    title: 'Consult Now',
                    isEnable: doctorModel.isOnline,
                    onTap: () {
                      var currentDateTime = DateTime.now();
                      var day = new DateFormat('EEEE').format(currentDateTime);
                      var date =
                          new DateFormat('dd MMM').format(currentDateTime);
                      var time =
                          new DateFormat('hh:mm a').format(currentDateTime);
                      var bookingSlotInfo =
                          BookingSlotInfo(day, date, time, true);
                      Navigator.of(context).pushNamed(
                          BookingUserConsultationScreen.routName,
                          arguments: BookingUserConsultationArguments(
                              doctorInfo: doctorModel,
                              bookingSlotInfo: bookingSlotInfo,
                              sessionSelectedInfo: sessionSelectedInfo));
                    }),
              ),
              SizedBox(width: 12),
              Expanded(
                  child: PrimaryButtonWidget(
                      title: 'Book Appointment',
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            BookAppointmentScreen.routName,
                            arguments: BookAppointmentArguments(
                                doctorInfo: doctorModel,
                                sessionSelectedInfo: sessionSelectedInfo));
                      })),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 10),
          DividerWidget()
        ],
      ),
    );
  }
}
