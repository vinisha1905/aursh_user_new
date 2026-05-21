import 'package:ayursh/domain/model/business/booked_therapy_info.dart';
import 'package:ayursh/domain/model/response/booked_therapy_model.dart';
import 'package:ayursh/domain/model/response/session_model.dart';
import 'package:ayursh/presentation/rate_us/rate_us_screen.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/line_divider_widget.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TherapyBookingWidget extends StatelessWidget {
  final BookedTherapyInfo bookedTherapy;
  final Function(BookedTherapyInfo bookedTherapy) onTap;
  final Function() onRefresh;

  const TherapyBookingWidget(
      {Key? key,
      required this.bookedTherapy,
      required this.onTap,
      required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor = AppColors.darkYellow;
    BookedTherapyModel bookedTherapyModel = bookedTherapy.bookedTherapyModel;
    String status = bookedTherapyModel.therapyStatus.toLowerCase();
    // String status = bookedTherapyModel.sessions.first.status.toLowerCase();
    String statusText;
    bool canBookNext = bookedTherapyModel.canBookNext;
    bool canRateUs = false;

    if (status == 'upcoming') {
      statusText = 'Upcoming';
      statusColor = AppColors.darkBlue;
    } else if (status == 'ongoing') {
      statusText = 'Ongoing';
      statusColor = AppColors.yellowColor;
    } else if (status == 'completed') {
      statusText = 'Completed';
      statusColor = AppColors.successColor;
      canRateUs = bookedTherapyModel.canProvideFeedback;
    } else if (status.toLowerCase() == 'cancelled') {
      statusText = 'Cancelled';
      statusColor = AppColors.darkYellow;
    } else {
      statusText = 'Delayed';
      statusColor = AppColors.darkYellow;
    }

    String firstSessionIcon = '';
    String secondSessionIcon = '';
    if (bookedTherapyModel.therapyMessages.length == 1) {
      if (status == 'completed') {
        firstSessionIcon = 'assets/icons/ic_session_completed.png';
      } else {
        firstSessionIcon = 'assets/icons/ic_session_ongoing.png';
      }
    } else if (bookedTherapyModel.therapyMessages.length == 2) {
      firstSessionIcon = 'assets/icons/ic_session_completed.png';
      secondSessionIcon = 'assets/icons/ic_session_ongoing.png';
    }

    return Card(
      elevation: 3,
      margin: EdgeInsets.only(left: 16, right: 16, top: 18),
      child: InkWell(
        onTap: () => onTap(bookedTherapy),
        child: Column(
          children: [
            _nameAndStatusWidget(bookedTherapyModel, statusText, statusColor),
            LineDividerWidget(),
            Padding(
              padding: EdgeInsets.only(top: 18, left: 16, right: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                      child: Container(
                    width: 65,
                    height: 65,
                    color: Colors.blueGrey,
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: CachedNetworkImage(
                          imageUrl: bookedTherapyModel.displayImage,
                          width: 65,
                          height: 65,
                          fit: BoxFit.contain,
                          errorWidget: (ctx, a, b) {
                            return Container(
                              color: AppColors.grayLight,
                            );
                          },
                        )),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextWidget(
                                text: bookedTherapyModel
                                    .sessions.first.displayName,
                                fontSize: 12,
                                height: 16,
                                fontWeight: Constant.fontMedium,
                                textColor: AppColors.darkGray),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _firstSessionWidget(
                                      firstSessionIcon, bookedTherapyModel),
                                  _secondSessionWidget(
                                      secondSessionIcon, bookedTherapyModel),
                                ],
                              ),
                              _rateUsWidget(context, canRateUs),
                              _bottomArrowAndBookNextWidget(
                                  canBookNext, secondSessionIcon.isNotEmpty)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _nameAndStatusWidget(BookedTherapyModel bookedTherapyModel,
      String statusText, Color statusColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
              text: bookedTherapyModel.therapyHeadline,
              fontSize: 12,
              height: 16,
              textColor: AppColors.darkGray,
              fontWeight: FontWeight.bold),
          // TextWidget(
          //     text: statusText,
          //     fontSize: 12,
          //     height: 16,
          //     textColor: statusColor,
          //     fontWeight: FontWeight.bold),
        ],
      ),
    );
  }

  Row _firstSessionWidget(
      String firstSessionIcon, BookedTherapyModel bookedTherapyModel) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(firstSessionIcon, width: 18, height: 18),
        SizedBox(width: 6),
        TextWidget(
            text: bookedTherapyModel.therapyMessages.first,
            fontSize: 14,
            height: 19,
            textColor: AppColors.darkGray)
      ],
    );
  }

  Widget _secondSessionWidget(
      String secondSessionIcon, BookedTherapyModel bookedTherapyModel) {
    return secondSessionIcon.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(secondSessionIcon, width: 18, height: 18),
                SizedBox(width: 6),
                TextWidget(
                    text: bookedTherapyModel.therapyMessages.elementAt(1),
                    fontSize: 14,
                    height: 19,
                    textColor: AppColors.darkGray)
              ],
            ),
          )
        : Container();
  }

  Widget _rateUsWidget(BuildContext context, bool canRateUs) {
    return canRateUs
        ? Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              height: 28,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.darkYellow),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextWidget(
                      text: 'Rate Us',
                      fontSize: 14,
                      height: 19,
                      fontWeight: Constant.fontMedium,
                      textAlign: TextAlign.center),
                )),
                onPressed: () async {
                  SessionModel? recentSession;
                  for (SessionModel sessions
                      in bookedTherapy.bookedTherapyModel.sessions) {
                    if (sessions.sessionNo ==
                        bookedTherapy.bookedTherapyModel.recentSession) {
                      recentSession = sessions;
                    }
                  }
                  if (recentSession == null) {
                    recentSession =
                        bookedTherapy.bookedTherapyModel.sessions[0];
                  }
                  var consultationBookingId =
                      bookedTherapy.consultationBookingId;
                  var nonConsultationBookingId =
                      bookedTherapy.nonConsultationTherapyBookingId;
                  var bookingId = '';
                  if (consultationBookingId != null &&
                      consultationBookingId.isNotEmpty) {
                    bookingId = consultationBookingId;
                  } else {
                    bookingId = nonConsultationBookingId ?? '';
                  }
                  var therapyName =
                      bookedTherapy.bookedTherapyModel.therapyHeadline;
                  var therapistName = recentSession.displayName;
                  var therapistImageUrl = recentSession.displayImage;
                  var isSubmitted = await Navigator.of(context).pushNamed(
                      RateUsScreen.routName,
                      arguments: RateUsArguments(bookingId, therapyName,
                          therapistName, therapistImageUrl));
                  if (isSubmitted == true) {
                    onRefresh.call();
                  }
                },
              ),
            ),
          )
        : Container();
  }

  Widget _bottomArrowAndBookNextWidget(bool canBookNext, bool hasNextSession) {
    return Padding(
      padding: EdgeInsets.only(
        top: hasNextSession ? 12 : 22,
        bottom: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          canBookNext
              ? TextWidget(
                  text: 'Book Next',
                  fontSize: 12,
                  height: 16,
                  textColor: AppColors.darkGray)
              : Container(),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward_ios_rounded,
              color: AppColors.darkBlue, size: 14)
        ],
      ),
    );
  }
}
