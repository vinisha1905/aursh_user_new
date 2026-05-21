import 'package:ayursh/application/login/index.dart';
import 'package:ayursh/presentation/otp_validation/otp_validation_screen.dart';
import 'package:ayursh/presentation/sign_up/sign_up_screen.dart';
import 'package:ayursh/presentation/term_and_policy/privacy_and_policy_screen.dart';
import 'package:ayursh/presentation/term_and_policy/term_and_service_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/presentation/widget/underline_text_field.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_phone_validator/country_phone_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class LoginArguments {
  final String message;

  const LoginArguments(this.message);
}

class LoginScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/login';

  final LoginArguments? arguments;

  const LoginScreen({Key? key, this.arguments}) : super(key: key);

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<LoginBloc>()..add(LoginEvent.initialize()),
      child: this,
    );
  }
}

class LoginScreenState extends State<LoginScreen> {
  bool isValid = false;
  TextEditingController _editingController = TextEditingController();
  CountryCode _countryCode = CountryCode(dialCode: "+91");
  int _maxLength = 10; // default for IN
  String? error;
  @override
  void initState() {
    super.initState();
    if (widget.arguments != null) {
      _showMessage(widget.arguments!.message);
    }
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: BlocConsumer<LoginBloc, LoginState>(
              listener: (ctx, state) {
                state.result?.fold((l) => print(l), (loginResp) {
                  Navigator.of(context).pushNamed(OtpValidationScreen.routName,
                      arguments: OtpValidationArguments(
                          state.phoneNumber ?? '', loginResp.otpTokenModel!));
                });
              },
              builder: (ctx, state) {
                state.result?.fold((l) {
                  error = l;
                }, (r) => null);
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
                      child: ListView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        children: [
                          SizedBox(height: 50),
                          TextWidget(
                              text: 'Log In',
                              fontSize: 35,
                              height: 46,
                              fontWeight: FontWeight.bold),
                          SizedBox(height: 12),
                          TextWidget(
                              text:
                                  'Enter your registered mobile number to log in',
                              fontSize: 14,
                              height: 19),
                          SizedBox(height: 54),
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: UnderLineTextField(
                              onChangedText: (val) {
                                isValid = CountryUtils.validatePhoneNumber(
                                  val ?? "",
                                  _countryCode.dialCode ?? "",
                                );
                                error = isValid ? null : 'Invalid phone number';
                                setState(() {});
                              },
                              error: error,
                              title: 'Mobile No.',
                              prefixWidget: Container(
                                height: 35,
                                child: CountryCodePicker(
                                  padding: EdgeInsets.zero,
                                  margin: EdgeInsets.only(right: 5),
                                  onChanged: (element) {
                                    setState(() {
                                      _countryCode = element;
                                      _maxLength = 11;
                                    });
                                  },
                                  showDropDownButton: false,
                                  initialSelection: 'IN',
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              controller: _editingController,
                              textInputType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(_maxLength),
                              ],
                            ),
                          ),
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
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 14,
                      left: 0,
                      right: 0,
                      child: Column(
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
                              onPressed: isValid
                                  ? () {
                                      context.read<LoginBloc>().add(
                                          LoginEvent.signIn(
                                              (_countryCode.dialCode! +
                                                  _editingController.text)));
                                    }
                                  : () {},
                            ),
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.of(context)
                          //         .pushNamed(SignUpScreen.routName);
                          //   },
                          //   child: Container(
                          //     padding: const EdgeInsets.symmetric(vertical: 12),
                          //     width: double.infinity,
                          //     color: AppColors.darkBlue,
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         TextWidget(
                          //             text: 'New User?',
                          //             fontSize: 14,
                          //             height: 16,
                          //             fontWeight: Constant.fontMedium),
                          //         SizedBox(width: 6),
                          //         Text(
                          //           'Sign Up',
                          //           style: TextStyle(
                          //               decoration: TextDecoration.underline,
                          //               fontSize: 14,
                          //               color: AppColors.darkYellow,
                          //               fontWeight: Constant.fontMedium),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    LoadingWidget(
                      loadingState: state.loadingState,
                      color: Colors.black54,
                    )
                  ],
                );
              },
            )),
      ),
    );
  }

  void _showMessage(String error) {
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
