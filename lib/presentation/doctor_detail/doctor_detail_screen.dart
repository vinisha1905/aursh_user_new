import 'package:ayursh/application/doctor_detail/doctor_detail_bloc.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:ayursh/domain/model/business/session_selected_info.dart';
import 'package:ayursh/domain/model/response/doctor_detail_model.dart';
import 'package:ayursh/domain/model/response/doctor_model.dart';
import 'package:ayursh/presentation/book_appointment/book_appointment_screen.dart';
import 'package:ayursh/presentation/booking_user_consultation/booking_user_consultation_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/line_divider_widget.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/secondary_button_widget.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:ayursh/utils/app_extentions.dart';

class DoctorDetailArguments {
  final DoctorModel doctorInfo;
  final SessionSelectedInfo? sessionSelectedInfo;

  const DoctorDetailArguments(
      {required this.doctorInfo, this.sessionSelectedInfo});
}

class DoctorDetailScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/doctor_detail';
  final DoctorDetailArguments arguments;

  const DoctorDetailScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  DoctorDetailScreenState createState() {
    return DoctorDetailScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<DoctorDetailBloc>()
        ..add(DoctorDetailEvent.initialize(
            arguments.doctorInfo, arguments.sessionSelectedInfo))
        ..add(DoctorDetailEvent.getDoctorDetail()),
      child: this,
    );
  }
}

class DoctorDetailScreenState extends State<DoctorDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<DoctorDetailBloc, DoctorDetailState>(
          builder: (ctx, state) {
        return Stack(
          children: [
            Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back_rounded,
                          color: AppColors.darkGray)),
                ),
                body: state.result?.fold((l) => Container(), (response) {
                      var doctorDetail = response.doctorDetail;
                      return Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Card(
                                    margin: EdgeInsets.all(16),
                                    elevation: 3,
                                    child: Row(
                                      children: [
                                        _avatarWidget(doctorDetail),
                                        _doctorInfoWidget(doctorDetail)
                                      ],
                                    ),
                                  ),
                                  LineDividerWidget(),
                                  SizedBox(height: 8),
                                  _infoWidget(
                                      SvgPicture.asset(
                                          'assets/icons/ic_expertise.svg',
                                          width: 15,
                                          height: 24),
                                      'Expertise in ${doctorDetail.expertise}'),
                                  _infoWidget(
                                      SvgPicture.asset(
                                          'assets/icons/ic_verification.svg',
                                          width: 19,
                                          height: 19),
                                      'Registration ID  ${doctorDetail.registrationNumber.toString()}'),
                                  SizedBox(height: 16),
                                  LineDividerWidget(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 16, left: 16, right: 16),
                                    child: TextWidget(
                                        text: 'Further Details',
                                        fontSize: 14,
                                        height: 19,
                                        fontWeight: FontWeight.bold,
                                        textColor: AppColors.darkGray),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 6,
                                          left: 16,
                                          right: 16,
                                          bottom: 100),
                                      child: Text('${doctorDetail.description}',
                                          style: TextStyle(
                                              fontWeight: Constant.fontLight,
                                              color: AppColors.darkGray,
                                              height: 1.4))),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: _bottomBottomWidget(
                                doctorDetail.isOnline, state),
                          ),
                        ],
                      );
                    }) ??
                    Container()),
            LoadingWidget(loadingState: state.loadingState)
          ],
        );
      }),
    );
  }

  Expanded _doctorInfoWidget(DoctorDetailModel doctorDetail) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 6, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(doctorDetail.displayName,
                style: TextStyle(
                    fontSize: 16,
                    height: 1.3,
                    fontWeight: Constant.fontMedium,
                    color: AppColors.darkGray)),
            SizedBox(height: 6),
            TextWidget(
                text: doctorDetail.qualification,
                fontSize: 14,
                height: 19,
                textColor: AppColors.darkGray),
            SizedBox(height: 6),
            TextWidget(
                text: 'Experience ${doctorDetail.experience} years',
                fontSize: 12,
                height: 16,
                textColor: AppColors.darkGray),
            SizedBox(height: 10),
            TextWidget(
                text:
                    '${Constant.formatCurrency(doctorDetail.consultationFee.display())}',
                fontSize: 16,
                height: 21,
                fontWeight: Constant.fontMedium,
                textColor: AppColors.darkBlue),
          ],
        ),
      ),
    );
  }

  Padding _avatarWidget(DoctorDetailModel doctorDetail) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Container(
        width: 120,
        height: 120,
        child: Stack(
          children: [
            ClipOval(
              child: Container(
                  width: 120,
                  height: 120,
                  child: CachedNetworkImage(
                    imageUrl: doctorDetail.displayImage,
                    errorWidget: (_, url, ___) {
                      return Container(
                        color: AppColors.greyMedium,
                      );
                    },
                  )),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: doctorDetail.isOnline
                      ? AppColors.successColor
                      : AppColors.darkGray,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoWidget(Widget icon, String info) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            child: Center(
              child: icon,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
              child: Text(info,
                  style: TextStyle(
                      fontSize: 14, color: AppColors.darkGray, height: 1.3)))
        ],
      ),
    );
  }

  Widget _bottomBottomWidget(bool isOnLine, DoctorDetailState state) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 22),
      child: Row(
        children: [
          SizedBox(width: 16),
          Expanded(
            child: SecondaryButtonWidget(
              title: 'Consult Now',
              isEnable: isOnLine,
              onTap: () {
                var currentDateTime = DateTime.now();
                var day = new DateFormat('EEEE').format(currentDateTime);
                var date = new DateFormat('dd MMM').format(currentDateTime);
                var time = new DateFormat('hh:mm a').format(currentDateTime);
                print('$day $date $time');
                var bookingSlotInfo = BookingSlotInfo(day, date, time, true);
                Navigator.of(context).pushNamed(
                    BookingUserConsultationScreen.routName,
                    arguments: BookingUserConsultationArguments(
                        doctorInfo: state.doctorModel!,
                        bookingSlotInfo: bookingSlotInfo,
                        sessionSelectedInfo: state.sessionSelectedInfo));
              },
            ),
          ),
          SizedBox(width: 12),
          Expanded(
              child: PrimaryButtonWidget(
                  title: 'Book Appointment',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        BookAppointmentScreen.routName,
                        arguments: BookAppointmentArguments(
                            doctorInfo: state.doctorModel!,
                            sessionSelectedInfo: state.sessionSelectedInfo));
                  })),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
