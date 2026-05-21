import 'package:ayursh/application/main/main_bloc.dart';
import 'package:ayursh/presentation/payment_success/payment_success_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class CancelConsultationSuccessScreen extends StatelessWidget {
  static final String routName = '/cancel_consultation_success';
  final String doctorName;

  const CancelConsultationSuccessScreen({Key? key, required this.doctorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(''),
              leading: IconButton(
                  onPressed: () {
                    GetIt.I.get<MainBloc>().add(MainEvent.selectTab(0, null));
                    GetIt.I.get<MainBloc>().add(
                        MainEvent.selectTab(1, BookFor.DoctorConsultation));
                    Navigator.popUntil(context, ModalRoute.withName('/main'));
                  },
                  icon: Icon(Icons.arrow_back_rounded,
                      color: AppColors.darkGray)),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/ic_warning.svg',
                      width: 20, height: 18),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Your consultation with $doctorName has been cancelled.\n\nYour refund will be processed in next 7 days.',
                      style: TextStyle(
                          height: 1.5, color: AppColors.darkGray, fontSize: 16),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
