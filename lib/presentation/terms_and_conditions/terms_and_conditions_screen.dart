import 'package:ayursh/application/tems_and_conditions/terms_and_conditions_bloc.dart';
import 'package:ayursh/domain/model/business/therapy_booking_info.dart';
import 'package:ayursh/presentation/book_therapy_time/book_therapy_time_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class TermsAndConditionsArguments {
  final TherapyBookingInfo therapyBookingInfo;

  const TermsAndConditionsArguments(this.therapyBookingInfo);
}

class TermsAndConditionsScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/terms_and_conditions';
  final TermsAndConditionsArguments arguments;

  const TermsAndConditionsScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  TermsAndConditionsScreenState createState() {
    return TermsAndConditionsScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<TermsAndConditionsBloc>()
        ..add(TermsAndConditionsEvent.initialize(therapyType: "ayur")),
      child: this,
    );
  }
}

class TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
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
      child: BlocBuilder<TermsAndConditionsBloc, TermsAndConditionsState>(
          builder: (ctx, state) {
        return Stack(
          children: [
            Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text(state.therapyBookingInfo?.therapyHeadline ?? ''),
                  leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back_rounded,
                          color: AppColors.darkGray)),
                ),
                body: state.contents != null
                    ? Stack(
                        children: [
                          SingleChildScrollView(
                            padding: EdgeInsets.only(top: 32, bottom: 180),
                            child: Column(
                              children: state.contents!
                                  .map((content) => _contentWidget(content))
                                  .toList(),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(30, 16, 16, 0),
                              color: Colors.white,
                              child: TextWidget(
                                  text: 'Terms & Conditions',
                                  textColor: AppColors.darkBlue,
                                  fontSize: 16,
                                  height: 21,
                                  fontWeight: Constant.fontMedium),
                            ),
                          ),
                          Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: _bottomWidget(state))
                        ],
                      )
                    : Container()),
            LoadingWidget(loadingState: state.loadingState)
          ],
        );
      }),
    );
  }

  Widget _contentWidget(String content) {
    return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.darkBlue,
                  )),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(content,
                  style: TextStyle(color: AppColors.darkGray, height: 1.3)),
            )
          ],
        ));
  }

  Widget _bottomWidget(TermsAndConditionsState state) {
    return Container(
      padding: EdgeInsets.fromLTRB(4, 0, 16, 30),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                  value: state.isAgree,
                  fillColor:
                      MaterialStateProperty.all<Color>(AppColors.darkBlue),
                  onChanged: (e) {
                    context
                        .read<TermsAndConditionsBloc>()
                        .add(TermsAndConditionsEvent.setAgree());
                  }),
              GestureDetector(
                  onTap: () => context
                      .read<TermsAndConditionsBloc>()
                      .add(TermsAndConditionsEvent.setAgree()),
                  child: TextWidget(
                      text: 'I agree to all Terms & Conditions',
                      fontSize: 14,
                      height: 19,
                      textColor: AppColors.darkGray))
            ],
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: PrimaryButtonWidget(
                title: 'Continue',
                onTap: () {
                  if (!state.isAgree) {
                    Constant.showError('Please accept terms and conditions');
                  } else {
                    Navigator.of(context).pushNamed(
                        BookTherapyTimeScreen.routName,
                        arguments: BookTherapyTimeArguments(
                            therapyBookingInfo: state.therapyBookingInfo!));
                  }
                }),
          )
        ],
      ),
    );
  }
}
