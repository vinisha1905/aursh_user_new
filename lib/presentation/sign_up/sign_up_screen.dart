import 'package:ayursh/application/sign_up/index.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/presentation/login/login_screen.dart';
import 'package:ayursh/presentation/otp_validation/otp_validation_screen.dart';
import 'package:ayursh/presentation/term_and_policy/privacy_and_policy_screen.dart';
import 'package:ayursh/presentation/term_and_policy/term_and_service_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/presentation/widget/underline_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SignUpScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/sign_up';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() {
    return SignUpScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<SignUpBloc>()..add(SignUpEvent.initialize()),
      child: this,
    );
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController userNameController;
  late TextEditingController userEmailController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    userEmailController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (ctx, state) {
              state.result?.fold((error) {
                Constant.showError(error);
              }, (response) {
                Navigator.of(context).pushNamed(OtpValidationScreen.routName,
                    arguments: OtpValidationArguments(
                        state.phoneNumber ?? '', response.otpTokenModel!));
              });
            },
            builder: (ctx, state) {
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
                              text: 'Sign Up',
                              fontSize: 35,
                              height: 46,
                              fontWeight: FontWeight.bold),
                          SizedBox(height: 12),
                          TextWidget(
                              text: 'Please share the following details',
                              fontSize: 14,
                              height: 19),
                          SizedBox(height: 54),
                          Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: UnderLineTextField(
                                error: state.nameError,
                                title: 'Name',
                                controller: userNameController,
                                textInputType: TextInputType.name,
                              )),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 24, left: 8, right: 8),
                              child: UnderLineTextField(
                                error: state.emailError,
                                title: 'E-mail',
                                controller: userEmailController,
                                textInputType: TextInputType.emailAddress,
                              )),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 24, left: 8, right: 8),
                              child: UnderLineTextField(
                                error: state.phoneError,
                                title: 'Mobile No.',
                                prefixWidget: Container(
                                    width: 36,
                                    child: TextWidget(
                                        text: '+91', fontSize: 16, height: 21)),
                                controller: phoneNumberController,
                                textInputType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10)
                                ],
                              )),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextWidget(
                                  text:
                                      'By creating an account you agree to all',
                                  fontSize: 14,
                                  height: 16),
                              SizedBox(height: 12),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          TermAndServiceScreen.routName);
                                    },
                                    child: Text(
                                      'T & C',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 14,
                                          color: AppColors.darkYellow,
                                          fontWeight: Constant.fontMedium),
                                    ),
                                  ),
                                  Text(' & ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14)),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          PrivacyAndPolicyScreen.routName);
                                    },
                                    child: Text(
                                      'Privacy Policy',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 14,
                                          color: AppColors.darkYellow,
                                          fontWeight: Constant.fontMedium),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 80),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 45,
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              AppColors.darkYellow),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)))),
                                  child: Center(
                                      child: TextWidget(
                                          text: 'Get OTP',
                                          fontSize: 16,
                                          height: 21,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center)),
                                  onPressed: () {
                                    context.read<SignUpBloc>().add(
                                        SignUpEvent.signUp(
                                            phoneNumberController.text.trim(),
                                            userNameController.text.trim(),
                                            userEmailController.text.trim()));
                                  },
                                ),
                              ),
                              _bottomTextWidget(context),
                              SizedBox(height: 14)
                            ],
                          ),
                        ],
                      ),
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

  GestureDetector _bottomTextWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          Navigator.of(context).popAndPushNamed(LoginScreen.routName);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        color: AppColors.darkBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
                text: 'Existing User?',
                fontSize: 14,
                height: 16,
                fontWeight: Constant.fontMedium),
            SizedBox(width: 6),
            Text(
              'Log In',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                  color: AppColors.darkYellow,
                  fontWeight: Constant.fontMedium),
            )
          ],
        ),
      ),
    );
  }
}
