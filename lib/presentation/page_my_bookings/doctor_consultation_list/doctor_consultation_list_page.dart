import 'package:ayursh/domain/model/response/doctor_consultation_model.dart';
import 'package:ayursh/presentation/doctor_list/doctor_list_screen.dart';
import 'package:ayursh/presentation/page_my_bookings/doctor_consultation_list/widget/doctor_consultation_widget.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorConsultationListPage extends StatefulWidget {
  final DoctorConsultationModel? doctorConsultationModel;

  DoctorConsultationListPage(this.doctorConsultationModel);

  @override
  DoctorConsultationListPageState createState() {
    return DoctorConsultationListPageState();
  }
}

class DoctorConsultationListPageState extends State<DoctorConsultationListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    if (widget.doctorConsultationModel == null) {
      return Container();
    }
    if (widget.doctorConsultationModel!.internalConsultationBookings.isEmpty) {
      return SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              SvgPicture.asset('assets/icons/ic_doctor.svg',
                  width: 46, height: 60),
              SizedBox(height: 24),
              Text(
                'You have not booked any\ndoctor consultation till now',
                style: TextStyle(color: AppColors.darkGray, height: 1.4),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 160,
                child: PrimaryButtonWidget(
                    title: 'Book Appointment',
                    height: 34,
                    onTap: () {
                      Navigator.of(context).pushNamed(DoctorListScreen.routName,
                          arguments: DoctorListArguments());
                    }),
              )
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: RefreshIndicator(
        color: AppColors.darkBlue,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 3));
        },
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 16),
          itemCount: widget
              .doctorConsultationModel!.internalConsultationBookings.length,
          itemBuilder: (ctx, index) {
            return DoctorConsultationWidget(
                doctorModel: widget.doctorConsultationModel!
                    .internalConsultationBookings[index]);
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
