import 'dart:async';

import 'package:ayursh/application/otp_validation/otp_validation_bloc.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/domain/model/response/otp_token_model.dart';
import 'package:ayursh/domain/model/response/otp_validation_response.dart';
import 'package:ayursh/domain/util/preference_util.dart';
import 'package:ayursh/presentation/main/main_screen.dart';
import 'package:ayursh/presentation/otp_validation/widget/opt_input_widget.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class OtpValidationArguments {
  final OtpTokenModel otpTokenModel;
  final String phoneNumber;

  OtpValidationArguments(this.phoneNumber, this.otpTokenModel);
}

class OtpValidationScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/otp_validation';
  final OtpValidationArguments arguments;

  const OtpValidationScreen({Key? key, required this.arguments})
      : super(key: key);
  @override
  OtpValidationScreenState createState() {
    return OtpValidationScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<OtpValidationBloc>()
        ..add(OtpValidationEvent.initialize(
            arguments.phoneNumber,
            arguments.otpTokenModel.userId,
            arguments.otpTokenModel.smsTokenSessionId)),
      child: this,
    );
  }
}

class OtpValidationScreenState extends State<OtpValidationScreen> {
  TextEditingController? otpController;
  Timer? timer;
  final liveTime = 59;
  bool disableSend = true;
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    otpController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocConsumer<OtpValidationBloc, OtpValidationState>(
            listener: (ctx, state) {
              state.result?.fold((l) => print(l), (loginResp) {
                GetIt.I.get<OtpValidationBloc>()
                  ..add(OtpValidationEvent.initialize(
                      widget.arguments.phoneNumber,
                      widget.arguments.otpTokenModel.userId,
                      state.smsTokenSessionId ?? ""));
              });
              if (state.aliveTime != null) {
                if (state.aliveTime! == liveTime) {
                  timer = Timer.periodic(Duration(seconds: 1), (timer) {
                    context
                        .read<OtpValidationBloc>()
                        .add(OtpValidationEvent.countTime());
                  });
                }
                if (state.aliveTime == 0) {
                  disableSend = false;
                  setState(() {});
                }
              } else {
                timer?.cancel();
              }
              state.result?.fold((error) {
                _showError(error);
              }, (otpValidationResp) {
                _handleSuccess(otpValidationResp, context);
              });
            },
            builder: (ctx, state) {
              String? aliveTime = _formatAliveTime(state);
              return Stack(
                children: [
                  Container(
                    color: AppColors.darkBlue,
                  ),
                  Container(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/icons/login_crop_bg.png',
                        fit: BoxFit.fitWidth,
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 28, right: 28),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50),
                          TextWidget(
                              text: 'Enter OTP',
                              fontSize: 35,
                              height: 46,
                              fontWeight: FontWeight.bold),
                          SizedBox(height: 12),
                          TextWidget(
                              text: ('OTP sent to ${state.phoneNumber}' +
                                  (state.phoneNumber != null
                                      ? (state.phoneNumber!.contains("+91")
                                          ? ''
                                          : ' on whatsapp')
                                      : '')),
                              fontSize: 14,
                              height: 19),
                          SizedBox(height: 54),
                          OptInputWidget(
                              otpCodeController: otpController,
                              onCompleted: (otpCode) {
                                context
                                    .read<OtpValidationBloc>()
                                    .add(OtpValidationEvent.submitOtp(otpCode));
                              }),
                          SizedBox(height: 8),
                          Align(
                            alignment: Alignment.center,
                            child: aliveTime != null
                                ? TextWidget(
                                    text: '$aliveTime',
                                    fontSize: 16,
                                    height: 21)
                                : Container(),
                          ),
                          SizedBox(height: 16),
                          GestureDetector(
                            onTap: disableSend
                                ? () {}
                                : () {
                                    disableSend = true;
                                    context
                                        .read<OtpValidationBloc>()
                                        .add(OtpValidationEvent.resendOtp());
                                  },
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextWidget(
                                      text: 'Didn’t get the code?',
                                      fontSize: 12,
                                      height: 16,
                                      fontWeight: Constant.fontMedium),
                                  SizedBox(width: 6),
                                  Text(
                                    'Resend',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 12,
                                        color: !disableSend
                                            ? AppColors.darkYellow
                                            : AppColors.greyMedium,
                                        fontWeight: Constant.fontMedium),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 26,
                    right: 16,
                    child: InkWell(
                      onTap: () {
                        context.read<OtpValidationBloc>().add(
                            OtpValidationEvent.submitOtp(
                                otpController?.text ?? ''));
                      },
                      child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.darkYellow,
                          ),
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: SvgPicture.asset(
                                'assets/icons/ic_arrow_right.svg'),
                          )),
                    ),
                  ),
                  LoadingWidget(
                      loadingState: state.loadingState, color: Colors.black54)
                ],
              );
            },
          )),
    );
  }

  String? _formatAliveTime(OtpValidationState state) {
    String? aliveTime;
    if (state.aliveTime != null) {
      aliveTime = state.aliveTime!.toString();
      if (aliveTime.length == 1) {
        aliveTime = '0:0$aliveTime';
      } else {
        aliveTime = '0:$aliveTime';
      }
    }
    return aliveTime;
  }

  void _handleSuccess(
      OtpValidationResponse otpValidationResp, BuildContext context) {
    var model = otpValidationResp.otpValidationModel;
    if (model != null) {
      GetIt.I.get<PreferenceUtil>().saveExpiryTime(model.authTokenExpiry);
      GetIt.I.get<PreferenceUtil>().saveAccessToken(model.authToken);
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);
    }
  }

  void _showError(String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: AppColors.darkBlue,
        fontSize: 12.0);
  }
}
