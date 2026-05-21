import 'package:ayursh/utils/app_constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

import '../../domain/util/preference_util.dart';
import '../util/app_colors.dart';
import '../widget/route_wrapper.dart';
import '../widget/text_widget.dart';
import 'modal/get_referral_code_modal.dart';

class ReferAndEarn extends StatefulWidget with RouteWrapper {
  static final String routName = '/refer_and_earn';
  const ReferAndEarn();

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    throw UnimplementedError();
  }
}

class _ReferAndEarnState extends State<ReferAndEarn> {
  List<String> referralText = [];
  ReferralTextData? data;
  String textToCopy = "";
  bool isLoading = false;
  double opacityOnTap = 1;

  static Future<GetReferralTextModal?> getReferralTextApi() async {
    await GetIt.I.allReady();
    var preferenceUtil = GetIt.I.get<PreferenceUtil>();
    var accessToken = await preferenceUtil.getAccessToken();
    String url = Constant.baseUrl + "onboarding/api/v1/referral-text";
    var response = await http
        .get(Uri.parse(url), headers: {'Authorization': "Bearer $accessToken"});
    print("get therapy referral code text : ${response.body}");
    print("get therapy referral code text : ${accessToken}");
    if (response.statusCode == 200) {
      print("get therapy referral code text : ${response.body}");
      return getReferralTextFromJson(response.body);
    } else
      return null;
  }

  void getReferralText() async {
    try {
      isLoading = true;

      var response = await getReferralTextApi();
      if (response != null) {
        if (response.success!) {
          referralText = response.data!.referralText!;
          data = response.data;
          textToCopy = response.data!.referralCode!;
          isLoading = false;
          ;
          setState(() {});
        } else {
          isLoading = false;
        }
      }
    } finally {
      isLoading = false;
    }
  }

  @override
  void initState() {
    getReferralText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          actions: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.asset(
                'assets/icons/ic_launcher.png',
              ),
            ),
          ],
        ),
        body: (isLoading)
            ? Container(
                color: Colors.black26,
                width: double.infinity,
                height: double.infinity,
                child: Material(
                    type: MaterialType.transparency,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                                color: AppColors.darkYellow),
                            SizedBox(width: 16),
                            TextWidget(
                                text: 'Please wait...',
                                fontSize: 12,
                                height: 16,
                                fontWeight: Constant.fontMedium,
                                textColor: AppColors.darkYellow)
                          ],
                        ),
                      ),
                    )))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.53,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/background_container.png"),
                                  fit: BoxFit.fill)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(
                                "Refer your Friends \nand Earn",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              Image.asset(
                                "assets/gift_box.png",
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                              Text(
                                "Your friend gets ${data!.referralDiscount}% off on therapy booking \nand you get ${data!.referrerCommission}% of their booking value to your wallet.",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.03,
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.15),
                                child: DottedBorder(
                                  dashPattern: [6, 3], // 6px dash, 3px gap
                                  color: Colors.white,
                                  strokeWidth: 2,
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(10),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Center(
                                              child: Text(
                                                "Your referral code",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 12,
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 0.8)),
                                              ),
                                            ),
                                            Text(
                                              textToCopy,
                                              style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        Container(
                                          height: 36,
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Clipboard.setData(ClipboardData(
                                                text: textToCopy));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      'Copied to clipboard')),
                                            );
                                          },
                                          child: Text(
                                            "Copy\nCode",
                                            style: GoogleFonts.roboto(
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.8)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Share your Referral Code via",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                              ),
                            ],
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        Container(
                          height: (MediaQuery.of(context).size.height * 0.53) +
                              (55 / 2),
                          alignment: AlignmentDirectional.bottomCenter,
                          child: GestureDetector(
                            onTap: () async {
                              print("on tap whats app");
                              opacityOnTap = 0.5;
                              setState(() {});
                              await Share.share(
                                'Hello! Check out Ayursh app at: \n\nAndroid: https://play.google.com/store/apps/details?id=com.ayursh\niOS: https://apps.apple.com/us/app/ayursh/id1596043263\n\nUse Referral code ${data!.referralCode}. Get ${data!.referralDiscount}% discount on your therapy bookings.',
                              ).then((onValue) {
                                opacityOnTap = 1;
                                setState(() {});
                              });
                            },
                            child: PhysicalModel(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              elevation: 3,
                              child: Opacity(
                                opacity: opacityOnTap,
                                child: SvgPicture.asset(
                                  "assets/svg/whatsapp_icon.svg",
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: 40,
                        // ),
                        // InkWell(
                        //   onTap: () {},
                        //   child: PhysicalModel(
                        //       color: Colors.white,
                        //       shape: BoxShape.circle,
                        //       elevation: 3,
                        //       child: SvgPicture.asset("assets/svg/messanger_icon.svg")),
                        // ),
                        //   ],
                        // ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "How it works",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFF525151)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: referralText
                            .map((e) => TimelineTile(
                                  text: e,
                                  isLast: referralText.lastIndexOf(e) ==
                                      referralText.length - 1,
                                ))
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

class TimelineTile extends StatelessWidget {
  final bool isLast;
  final String text;

  const TimelineTile({this.isLast = false, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left timeline
        Column(
          children: [
            // Dot
            SizedBox(
              height: 3,
            ),
            Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: Color(0xFF00263B),
                shape: BoxShape.circle,
              ),
            ),
            // Line
            if (!isLast)
              SizedBox(
                height: 60,
                child: CustomPaint(
                  painter: DottedLinePainter(),
                ),
              ),
          ],
        ),
        const SizedBox(width: 12),
        // Text content
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double dashHeight = 4;
    const double dashSpace = 4;
    double startY = 0;
    final paint = Paint()
      ..color = Color(0xFF00263B) // or your darkBlue
      ..strokeWidth = 2;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
