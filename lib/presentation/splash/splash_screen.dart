import 'package:ayursh/domain/util/preference_util.dart';
import 'package:ayursh/presentation/login/login_screen.dart';
import 'package:ayursh/presentation/main/main_screen.dart';
import 'package:ayursh/presentation/onboarding/onboarding_screen.dart';
import 'package:ayursh/presentation/sign_up/sign_up_screen.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  static final String routName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    await GetIt.I.allReady();
    var preferenceUtil = GetIt.I.get<PreferenceUtil>();
    var accessToken = await preferenceUtil.getAccessToken();
    var expiryTime = await preferenceUtil.getExpiryTime();
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    var isFistTimeOpenApp = await preferenceUtil.isFirstTimeOpenApp();
    initFreshChat();
    await Future.delayed(Duration(seconds: 3));
    if (isFistTimeOpenApp) {
      await preferenceUtil.saveFirstTimeOpenApp();
      Navigator.of(context).popAndPushNamed(OnboardingScreen.routName);
    } else {
      if (accessToken.isNotEmpty && expiryTime > currentTime) {
        Navigator.of(context).popAndPushNamed(MainScreen.routName);
      } else {
        Navigator.of(context).popAndPushNamed(LoginScreen.routName);
      }
    }
  }

  Future<void> initFreshChat() async {
    Freshchat.init(Constant.freshChatAppId, Constant.freshChatAppKey, Constant.freshChatDomain, cameraCaptureEnabled: true, gallerySelectionEnabled: true, responseExpectationEnabled: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
        body: Container(color: Colors.transparent));
  }
}
