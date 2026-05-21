import 'dart:async';
import 'dart:convert';

import 'package:ayursh/application/booked_therapy_detail/booked_therapy_detail_bloc.dart';
import 'package:ayursh/domain/model/business/booked_therapy_info.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/booked_add_on_therapy.dart';
import 'package:ayursh/domain/model/response/booked_therapy_model.dart';
import 'package:ayursh/domain/model/response/session_model.dart';
import 'package:ayursh/domain/util/preference_util.dart';
import 'package:ayursh/presentation/book_therapy_time/book_therapy_time_screen.dart';
import 'package:ayursh/presentation/main/main_screen.dart';
import 'package:ayursh/presentation/pdf_view/pdf_view_screen.dart';
import 'package:ayursh/presentation/rate_us/rate_us_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/line_divider_widget.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/secondary_button_widget.dart';
import 'package:ayursh/presentation/widget/text_icon_row_widget.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/utils/app_extentions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class BookedTherapyDetailArguments {
  final BookedTherapyInfo bookedTherapy;

  const BookedTherapyDetailArguments(this.bookedTherapy);
}

class BookedTherapyDetailScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/booked_therapy_detail';
  final BookedTherapyDetailArguments arguments;

  const BookedTherapyDetailScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  BookedTherapyDetailScreenState createState() {
    return BookedTherapyDetailScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<BookedTherapyDetailBloc>()
        ..add(BookedTherapyDetailEvent.initialize(arguments.bookedTherapy)),
      child: this,
    );
  }
}

class BookedTherapyDetailScreenState extends State<BookedTherapyDetailScreen> {
  late RefreshController _refreshController;
  bool isButtonDisabled = false; // To track if the button is disabled
  int secondsLeft = 60; // Timer countdown
  Timer? timer;
  void startTimer() {
    setState(() {
      isButtonDisabled = true;
      secondsLeft = 60;
    });

    // Start a 60-second timer
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsLeft > 0) {
          secondsLeft--;
        } else {
          isButtonDisabled = false;
          timer.cancel(); // Stop the timer
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
  }

  @override
  void dispose() {
    timer?.cancel(); // Clean up timer if the widget is disposed
    super.dispose();
  }

  Future<http.Response> callInitiating(
      String bookingId, String sessionId) async {
    try {
      // Construct URL
      var url = Uri.parse(
          "https://prod.ayursh.com/therapy/api/v1/therapist/booking/click-to-call/$bookingId/$sessionId");
      // Prepare data
      Map<String, dynamic> data = {"source": "user"};
      var jsonBody = jsonEncode(data);

      // Get Access Token
      var accessToken = await GetIt.I.get<PreferenceUtil>().getAccessToken();
      if (accessToken == null || accessToken.isEmpty) {
        throw Exception('Access token is missing');
      }

      // Make the API call
      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: jsonBody,
      );
      print(response.body.toString());
      // Return the response
      return response;
    } catch (e) {
      print('Error during API call: ${e.toString()}');
      rethrow; // Optionally, rethrow the error or handle accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<BookedTherapyDetailBloc, BookedTherapyDetailState>(
          listener: (ctx, state) {
        if (state.bookingCanceled) {
          Navigator.popUntil(
              context,
              ModalRoute.withName(
                MainScreen.routName,
              ));
        }
        if (state.loadingState == LoadingState.isCompleted) {
          _refreshController.refreshCompleted();
        }
        if (state.isStart != null && state.session != null) {
          _showToast("OTP sent successfully!");
          context
              .read<BookedTherapyDetailBloc>()
              .add(BookedTherapyDetailEvent.resetOTP());
        } else if (state.otpError != null) {
          _showToast("Couldn't send OTP!");
        }
      }, builder: (ctx, state) {
        var bookedTherapy = state.bookedTherapy;
        var therapyBooking = state.bookedTherapy?.bookedTherapyModel;
        String status = therapyBooking?.therapyStatus.toLowerCase() ?? '';
        String firstSessionIcon = '';
        String secondSessionIcon = '';
        SessionModel? firstSession;
        SessionModel? recentSession;
        if (therapyBooking != null) {
          firstSession = therapyBooking.sessions
              .firstWhere((session) => session.sessionNo == 1);
          if (therapyBooking.therapyMessages.length == 1) {
            if (status == 'completed') {
              firstSessionIcon = 'assets/icons/ic_session_completed.png';
            } else {
              firstSessionIcon = 'assets/icons/ic_session_ongoing.png';
            }
          } else if (therapyBooking.therapyMessages.length == 2) {
            firstSessionIcon = 'assets/icons/ic_session_completed.png';
            secondSessionIcon = 'assets/icons/ic_session_ongoing.png';
          }

          for (SessionModel sessions in therapyBooking.sessions) {
            if (sessions.sessionNo == therapyBooking.recentSession) {
              recentSession = sessions;
            }
          }
          if (recentSession == null) {
            recentSession = therapyBooking.sessions[0];
          }
        }

        var statusColor;
        String statusText = '';
        bool canBookNext = therapyBooking?.canBookNext ?? false;
        bool canRateUs = false;
        bool showUpcomingSession = false;
        String upComingSessionText = '1st Session';
        String upComingScheduledOn = '';

        print(
            "ayursh Add ${state.bookedTherapy?.bookedTherapyModel.addOnTherapies}");

        if (status == 'upcoming') {
          statusText = 'Upcoming';
          statusColor = AppColors.darkBlue;
          showUpcomingSession = true;
          upComingScheduledOn = therapyBooking?.sessions
                  .firstWhere((session) => session.sessionNo == 1)
                  .therapyTime ??
              '';
          if (upComingScheduledOn.isEmpty) {
            upComingScheduledOn =
                therapyBooking?.sessions.first.therapyTime ?? '';
          }
        } else if (status == 'ongoing' || status == 'delayed') {
          statusText = status == 'ongoing' ? 'Ongoing' : 'Delayed';
          statusColor = status == 'ongoing'
              ? AppColors.yellowColor
              : AppColors.darkYellow;
          var message = therapyBooking?.therapyMessages ?? [];
          if (message.length == 2 ||
              (message.length == 1 && recentSession!.sessionNo == 1)) {
            if (message.length == 2) {
              upComingSessionText = message[1];
            } else {
              upComingSessionText = message[0];
            }
            showUpcomingSession = true;
            upComingScheduledOn = recentSession!.therapyTime;

            if (recentSession.status.toLowerCase() == 'completed') {
              showUpcomingSession = false;
            }
          }
        } else if (status == 'completed') {
          statusText = 'Completed';
          statusColor = AppColors.successColor;
          canRateUs = therapyBooking?.canProvideFeedback ?? false;
        } else if (status == 'cancelled') {
          statusText = 'Cancelled';
          statusColor = AppColors.darkYellow;
          canRateUs = therapyBooking?.canProvideFeedback ?? false;
        }
        //Test Data

        num firstTherapyAmount = 0;

        if (state.bookedTherapy != null) {
          if (state.bookedTherapy!.bookedTherapyModel.amountPayable
                  .runtimeType ==
              String) {
            firstTherapyAmount = double.parse(
                state.bookedTherapy!.bookedTherapyModel.amountPayable);
          } else {
            firstTherapyAmount =
                state.bookedTherapy!.bookedTherapyModel.amountPayable;
          }
        }

        num firstTotalAmount = 0;

        if (state.bookedTherapy != null) {
          if (state.bookedTherapy!.bookedTherapyModel.totalAmount
                  .runtimeType == String) {
            firstTotalAmount = double.parse(
                state.bookedTherapy!.bookedTherapyModel.totalAmount.toString());
          } else {
            firstTotalAmount =
                state.bookedTherapy!.bookedTherapyModel.totalAmount;
          }
        }

        return Stack(
          children: [
            Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text('View Details'),
                  leading: IconButton(
                      onPressed: () {
                        if (state.dataChanged == true) {
                          Navigator.pop(context, true);
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      icon: Icon(Icons.arrow_back_rounded,
                          color: AppColors.darkGray)),
                ),
                body: therapyBooking != null
                    ? SmartRefresher(
                        controller: _refreshController,
                        header: ClassicHeader(
                          textStyle: TextStyle(color: AppColors.darkYellow),
                          completeIcon:
                              Icon(Icons.done, color: AppColors.darkYellow),
                          idleIcon: Icon(Icons.arrow_downward,
                              color: AppColors.darkYellow),
                          releaseIcon:
                              Icon(Icons.refresh, color: AppColors.darkYellow),
                          refreshingIcon: SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: const CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  color: AppColors.darkYellow)),
                        ),
                        enablePullDown: true,
                        onRefresh: () async {
                          context
                              .read<BookedTherapyDetailBloc>()
                              .add(BookedTherapyDetailEvent.refresh());
                        },
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _nameAndAmountWidget(
                                    therapyBooking, statusText, statusColor),
                                LineDividerWidget(),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 16, left: 16, right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipOval(
                                                child: Container(
                                              width: 65,
                                              height: 65,
                                              color: Colors.blueGrey,
                                              child: AspectRatio(
                                                  aspectRatio: 1,
                                                  child: CachedNetworkImage(
                                                    imageUrl: therapyBooking
                                                        .displayImage,
                                                    width: 65,
                                                    height: 65,
                                                    fit: BoxFit.contain,
                                                    errorWidget: (ctx, a, b) {
                                                      return Container(
                                                        color:
                                                            AppColors.grayLight,
                                                      );
                                                    },
                                                  )),
                                            )),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, top: 12),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: TextWidget(
                                                              text: therapyBooking
                                                                  .sessions
                                                                  .first
                                                                  .displayName,
                                                              fontSize: 12,
                                                              // height: 16,
                                                              fontWeight: Constant
                                                                  .fontMedium,
                                                              textColor:
                                                                  AppColors
                                                                      .darkGray),
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            therapyBooking
                                                                        .therapyMessages
                                                                        .length ==
                                                                    1
                                                                ? _firstSessionWidget(
                                                                    firstSessionIcon,
                                                                    therapyBooking)
                                                                : SizedBox(),
                                                            _secondSessionWidget(
                                                                secondSessionIcon,
                                                                therapyBooking),
                                                            SizedBox(
                                                                height: (recentSession!
                                                                            .enableEndValidation &&
                                                                        recentSession
                                                                            .enableStartValidation)
                                                                    ? 0
                                                                    : 10),
                                                            Text.rich(TextSpan(
                                                                text: recentSession.enableEndValidation ==
                                                                            false &&
                                                                        recentSession.enableStartValidation ==
                                                                            false
                                                                    ? ""
                                                                    : ("${recentSession.enableEndValidation ? "End OTP: " : "Start OTP: "}"),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: AppColors
                                                                        .darkGray),
                                                                children: [
                                                                  TextSpan(
                                                                      text: recentSession.enableEndValidation == false &&
                                                                              recentSession.enableStartValidation ==
                                                                                  false
                                                                          ? ""
                                                                          : "${recentSession.enableEndValidation ? recentSession.alternateEndOtp.toString() : recentSession.alternateStartOtp.toString()}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color: AppColors
                                                                              .darkGray,
                                                                          fontWeight:
                                                                              FontWeight.w900)),
                                                                ]))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    _startAtWidget(
                                                        therapyBooking,
                                                        recentSession)
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      therapyBooking.canTherapistBeCalled ==
                                              true
                                          ? SizedBox(height: 5)
                                          : SizedBox(),
                                      therapyBooking.canTherapistBeCalled ==
                                              true
                                          ? InkWell(
                                              onTap: isButtonDisabled
                                                  ? null
                                                  : () {
                                                      showConfirmationDialog(
                                                          recentSession!
                                                              .therapistBookingId,
                                                          recentSession.id);
                                                    },
                                              child: Container(
                                                  width: 80,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      color: isButtonDisabled
                                                          ? Colors.grey
                                                          : Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Center(
                                                      child: Text(
                                                          isButtonDisabled
                                                              ? '00:$secondsLeft'
                                                              : "Call Now",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontWeight: Constant
                                                                .fontMedium,
                                                          )))),
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                ),
                                _bookNextWidget(canBookNext, state),
                                _rateUsWidget(canRateUs, state, recentSession),
                                // _startServiceButtonWidget(
                                //     statusText, recentSession),
                                // _endServiceButtonWidget(
                                //     statusText, recentSession),
                                SizedBox(height: 16),
                                LineDividerWidget(),
                                SizedBox(height: 16),
                                Container(
                                    padding: EdgeInsets.only(left: 20),
                                    height: 190,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 5.0),
                                          child: SingleTherapyItemWidget(
                                              item: BookedAddOnTherapy(
                                            state
                                                .bookedTherapy!
                                                .bookedTherapyModel
                                                .therapyTitle,
                                            "",
                                            state
                                                .bookedTherapy!
                                                .bookedTherapyModel
                                                .sessionDurationInMin,
                                            0,
                                            firstTherapyAmount,
                                            firstTotalAmount,
                                            state.bookedTherapy!
                                                .bookedTherapyModel.imageUrl,
                                            state
                                                .bookedTherapy!
                                                .bookedTherapyModel
                                                .totalSessions
                                                .toString(),
                                            state
                                                .bookedTherapy!
                                                .bookedTherapyModel
                                                .therapyHeadline,
                                          )),
                                        ),
                                        if (state
                                                    .bookedTherapy!
                                                    .bookedTherapyModel
                                                    .addOnTherapies !=
                                                null &&
                                            state
                                                .bookedTherapy!
                                                .bookedTherapyModel
                                                .addOnTherapies!
                                                .isNotEmpty)
                                          for (final item in state
                                              .bookedTherapy!
                                              .bookedTherapyModel
                                              .addOnTherapies!)
                                            if (item != null)
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 20.0),
                                                  child:
                                                      SingleTherapyItemWidget(
                                                          item: item)),
                                        SizedBox(width: 20),
                                      ],
                                    )),
                                SizedBox(height: 16),
                                Padding(
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  child: RichText(
                                      text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.darkGray,
                                      fontWeight: Constant.fontMedium,
                                    ),
                                    text: '${state.bookedTherapy!.bookedTherapyModel.addressFlatNoBuilding}'
                                            .isNotEmpty
                                        ? '${state.bookedTherapy!.bookedTherapyModel.addressFlatNoBuilding}, '
                                        : '',
                                    children: [
                                      if ('${state.bookedTherapy!.bookedTherapyModel.addressAreaLocality}'
                                          .isNotEmpty)
                                        TextSpan(
                                            text:
                                                '${state.bookedTherapy!.bookedTherapyModel.addressAreaLocality}'),
                                      if ('${state.bookedTherapy!.bookedTherapyModel.addressLandmark}'
                                          .isNotEmpty)
                                        TextSpan(
                                            text:
                                                ', ${state.bookedTherapy!.bookedTherapyModel.addressLandmark}'),
                                      if ('${state.bookedTherapy!.bookedTherapyModel.addressCity}'
                                          .isNotEmpty)
                                        TextSpan(
                                            text:
                                                ', ${state.bookedTherapy!.bookedTherapyModel.addressCity}'),
                                    ],
                                  )),
                                ),
                                _upComingSessionWidget(
                                    showUpcomingSession,
                                    recentSession?.status ?? '',
                                    upComingSessionText,
                                    upComingScheduledOn,
                                    recentSession!),
                                _previousSessionWidget(state, therapyBooking),
                                LineDividerWidget(),
                                if (recentSession!
                                    .canTherapySessionBeRescheduled!)
                                  TextIconRowWidget(
                                      icon: SvgPicture.asset(
                                          'assets/icons/ic_schedule.svg',
                                          width: 18,
                                          height: 16,
                                          color: AppColors.darkGray),
                                      title: 'Reschedule',
                                      onTap: () async {
                                        await Navigator.pushNamed(context,
                                            BookTherapyTimeScreen.routName,
                                            arguments: BookTherapyTimeArguments(
                                                rescheduleBooking: true,
                                                bookedTherapy:
                                                    state.bookedTherapy));
                                      }),
                                if (recentSession.canTherapySessionBeCancelled!)
                                  TextIconRowWidget(
                                      icon: SvgPicture.asset(
                                          'assets/icons/ic_cancel.svg',
                                          width: 18,
                                          height: 16,
                                          color: AppColors.darkGray),
                                      title: 'Cancel Booking',
                                      onTap: () async {
                                        _showCancelConfirmationDialog(context);
                                      }),
                                TextIconRowWidget(
                                    icon: SvgPicture.asset(
                                        'assets/icons/ic_invoice.svg',
                                        width: 18,
                                        height: 16,
                                        color: AppColors.darkGray),
                                    title: 'Invoice',
                                    onTap: () async {
                                      _showInvoice(firstSession, therapyBooking,
                                          context);
                                    }),
                                TextIconRowWidget(
                                    icon: SvgPicture.asset(
                                        'assets/icons/ic_about_us.svg',
                                        width: 18,
                                        height: 18,
                                        color: AppColors.darkGray),
                                    title: 'Help',
                                    onTap: () {
                                      _handleHelp();
                                    })
                              ]),
                        ),
                      )
                    : Container()),
            LoadingWidget(loadingState: state.loadingState)
          ],
        );
      }),
    );
  }

  // Function to show the confirmation popup
  void showConfirmationDialog(String bookingId, String sessionId) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                  text: 'Do you want to call therapist?',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.black),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            color: AppColors.cancelColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text("No",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14)))),
                  ),
                  InkWell(
                    onTap: () {
                      // startTimer();
                      callInitiating(bookingId, sessionId).then((value) {
                        Navigator.of(context).pop(); // Close the dialog
                        startTimer(); // Disable button and start timer
                      });
                    },
                    child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text("Yes",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14)))),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void _showInvoice(SessionModel? firstSession,
      BookedTherapyModel bookedTherapyModel, BuildContext context) {
    print(bookedTherapyModel.toJson());
    print(firstSession?.toJson());
    var url = bookedTherapyModel.invoiceUrl;
    // Constant.baseUrl +
    //     'onboarding/api/v1/therapy/booking/${firstSession!.therapistBookingId}/booked-on/${bookedTherapyModel.bookedOnTs}/invoice';
    print(url);
    Navigator.of(context).pushNamed(PdfViewScreen.routName,
        arguments: PdfViewArguments(url ?? "", 'invoice.pdf'));
  }

  Widget _bookNextWidget(bool canBookNext, BookedTherapyDetailState state) {
    return canBookNext == true
        ? Padding(
            padding: EdgeInsets.fromLTRB(80, 24, 80, 0),
            child: PrimaryButtonWidget(
                title: 'Book Next',
                height: 38,
                onTap: () async {
                  var booked = await Navigator.of(context).pushNamed(
                      BookTherapyTimeScreen.routName,
                      arguments: BookTherapyTimeArguments(
                          bookedTherapy: state.bookedTherapy));
                  if (booked == true) {
                    context
                        .read<BookedTherapyDetailBloc>()
                        .add(BookedTherapyDetailEvent.setDataChanged());
                    context
                        .read<BookedTherapyDetailBloc>()
                        .add(BookedTherapyDetailEvent.refresh());
                  }
                }),
          )
        : Container();
  }

  Widget _startServiceButtonWidget(
      String therapyStatus, SessionModel? recentSession) {
    if (therapyStatus.toLowerCase() == 'completed' ||
        (recentSession != null && !recentSession.enableStartValidation)) {
      return Container();
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(80, 24, 80, 0),
      child: PrimaryButtonWidget(
          title: 'Start Service',
          height: 38,
          onTap: () {
            _sendOTP(context, true, recentSession);
          }),
    );
  }

  Widget _endServiceButtonWidget(
      String therapyStatus, SessionModel? recentSession) {
    if (therapyStatus.toLowerCase() == 'completed' ||
        (recentSession != null && !recentSession.enableEndValidation)) {
      return Container();
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(80, 24, 80, 0),
      child: PrimaryButtonWidget(
          title: 'End Service',
          height: 38,
          onTap: () {
            _sendOTP(context, false, recentSession);
          }),
    );
  }

  Padding _nameAndAmountWidget(
      BookedTherapyModel bookedTherapyModel, status, statusColor) {
    var words = bookedTherapyModel.therapyHeadline.split(' ');
    var nameDisplay = bookedTherapyModel.therapyHeadline;
    if (words.length == 4) {
      nameDisplay = '${words[0]} ${words[1]} ${words[2]} \n${words[3]}';
    }
    if (words.length == 5) {
      nameDisplay =
          '${words[0]} ${words[1]} ${words[2]} \n${words[3]} ${words[4]}';
    }
    if (words.length == 6) {
      nameDisplay =
          '${words[0]} ${words[1]} ${words[2]} \n${words[3]} ${words[4]} ${words[5]}';
    }
    return Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(nameDisplay,
                        style: TextStyle(
                            color: AppColors.darkGray,
                            height: 1.3,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 12),
                  Flexible(
                    flex: 1,
                    child: Text(
                        '${Constant.formatCurrency(bookedTherapyModel.totalAmount.toString())}',
                        style: TextStyle(
                            height: 1.3,
                            color: AppColors.darkGray,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            // SizedBox(width: 12),
            // Text(status,
            //     style: TextStyle(
            //         color: statusColor,
            //         fontWeight: FontWeight.bold,
            //         height: 1.3))
          ],
        ));
  }

  Row _firstSessionWidget(
      String firstSessionIcon, BookedTherapyModel bookedTherapyModel) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
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
        ?
        //     ? Padding(
        //         padding: const EdgeInsets.only(top: 10),
        //         child:
        Row(
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
          )
        // )
        : Container();
  }

  Widget _rateUsWidget(bool canRateUs, BookedTherapyDetailState state,
      SessionModel? recentSession) {
    return canRateUs == true
        ? Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                    text: 'How was your experience?',
                    fontSize: 14,
                    height: 19,
                    textColor: AppColors.darkGray,
                    fontWeight: Constant.fontMedium),
                Container(
                  width: 120,
                  child: PrimaryButtonWidget(
                      title: 'Rate Us',
                      height: 34,
                      onTap: () => _rateUs(state, recentSession)),
                )
              ],
            ),
          )
        : Container();
  }

  Widget _startAtWidget(
      BookedTherapyModel bookedTherapyModel, SessionModel? recentSession) {
    if (bookedTherapyModel.therapyStatus.toLowerCase() != 'completed' &&
        recentSession != null &&
        recentSession.status.toLowerCase() != 'completed' &&
        recentSession.startQrTokenSessionValidatedAt != null &&
        recentSession.startQrTokenSessionValidatedAt!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextWidget(
            text: recentSession.startQrTokenSessionValidatedAt!,
            fontSize: 14,
            height: 19,
            textColor: AppColors.darkGray),
      );
    }
    return Container();
  }

  Widget _upComingSessionWidget(bool isShow, String status, String sessionName,
      String scheduledOn, SessionModel session) {
    if (!isShow) {
      return Container();
    }
    var statusText = '';
    if (status.isNotEmpty) {
      var firstLetter = status.substring(0, 1).toLowerCase();
      statusText = status
          .toLowerCase()
          .replaceFirst(firstLetter, firstLetter.toUpperCase());
    }
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // TextWidget(
          //     text: statusText,
          //     fontSize: 12,
          //     height: 16,
          //     textColor: AppColors.darkGray,
          //     fontWeight: Constant.fontMedium),
          // SizedBox(height: 6),
          TextWidget(
              text: sessionName,
              fontSize: 14,
              height: 19,
              textColor: AppColors.darkGray),
          SizedBox(height: 6),
          TextWidget(
              text: scheduledOn,
              fontSize: 14,
              height: 19,
              textColor: AppColors.darkGray),
          // SizedBox(
          //     height:
          //         (session.enableEndValidation && session.enableStartValidation)
          //             ? 0
          //             : 6),
          // Text(
          //     session.enableEndValidation == false &&
          //             session.enableStartValidation == false
          //         ? ""
          //         : ("${session.enableEndValidation ? "End OTP: " : "Start OTP: "}" +
          //             "${session.enableEndValidation ? session.alternateEndOtp.toString() : session.alternateStartOtp.toString()}"),
          //     style: TextStyle(
          //         fontSize: 14,
          //         height: 1.3,
          //         color: AppColors.darkGray,
          //         fontWeight: Constant.fontLight)),
        ]));
  }

  Widget _previousSessionWidget(
      BookedTherapyDetailState state, BookedTherapyModel? bookedTherapyModel) {
    List<SessionModel> completedSessions = bookedTherapyModel?.sessions
            .where((session) => session.status.toLowerCase() == 'completed')
            .toList() ??
        [];
    if (completedSessions.isEmpty) {
      return Container();
    }
    if (state.previousSessionExpanded) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LineDividerWidget(),
          InkWell(
            onTap: () {
              context
                  .read<BookedTherapyDetailBloc>()
                  .add(BookedTherapyDetailEvent.setExpandPreviousSession());
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                      text: 'View Previous Sessions',
                      fontSize: 12,
                      height: 16,
                      textColor: AppColors.darkGray,
                      fontWeight: Constant.fontMedium),
                  SizedBox(width: 6),
                  Icon(Icons.keyboard_arrow_up_rounded,
                      size: 20, color: AppColors.darkBlue)
                ],
              ),
            ),
          )
        ]..addAll(completedSessions
            .map((session) => _sessionWidget(session))
            .toList()),
      );
    } else {
      return InkWell(
        onTap: () {
          context
              .read<BookedTherapyDetailBloc>()
              .add(BookedTherapyDetailEvent.setExpandPreviousSession());
        },
        child: Column(
          children: [
            LineDividerWidget(),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                      text: 'View Previous Sessions',
                      fontSize: 12,
                      height: 16,
                      textColor: AppColors.darkGray,
                      fontWeight: Constant.fontMedium),
                  SizedBox(width: 6),
                  Icon(Icons.keyboard_arrow_down_rounded,
                      size: 20, color: AppColors.darkBlue)
                ],
              ),
            )
          ],
        ),
      );
    }
  }

  Widget _sessionWidget(SessionModel session) {
    var sessionText = '';
    switch (session.sessionNo) {
      case 1:
        {
          sessionText = '1st Session';
          break;
        }
      case 2:
        {
          sessionText = '2nd Session';
          break;
        }
      case 3:
        {
          sessionText = '3rd Session';
          break;
        }
      default:
        {
          sessionText = '${session.sessionNo}th Session';
          break;
        }
    }
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                text: sessionText,
                fontSize: 14,
                height: 19,
                textColor: AppColors.darkGray),
            SizedBox(height: 6),
            Text(session.therapyTime,
                style: TextStyle(
                    fontSize: 14,
                    height: 1.3,
                    color: AppColors.darkGray,
                    fontWeight: Constant.fontLight)),
            // SizedBox(
            //     height: (session.enableEndValidation &&
            //             session.enableStartValidation)
            //         ? 6
            //         : 0),
            // Text(
            //     session.enableEndValidation && session.enableStartValidation
            //         ? ("${session.enableEndValidation ? "End OTP: " : "Start OTP: "}" +
            //             "${session.enableEndValidation ? session.alternateEndOtp.toString() : session.alternateStartOtp.toString()}")
            //         : '',
            //     style: TextStyle(
            //         fontSize: 14,
            //         height: 1.3,
            //         color: AppColors.darkGray,
            //         fontWeight: Constant.fontLight)),
          ],
        ));
  }

  void _handleHelp() {
    Freshchat.showConversations();
  }

  // Future _showQrDialog(BuildContext context, File qrFile) async {
  //   Size size = MediaQuery.of(context).size;
  //   return await showDialog(
  //       context: context,
  //       builder: (BuildContext ctx) {
  //         return Material(
  //           color: Colors.transparent,
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(8.0)), //this right here
  //           child: Container(
  //             width: size.width,
  //             height: size.height,
  //             child: Stack(
  //               children: [
  //                 Align(
  //                   alignment: Alignment.center,
  //                   child: Container(
  //                     width: size.width - 64,
  //                     child: Image.file(qrFile, fit: BoxFit.fill),
  //                   ),
  //                 ),
  //                 Positioned(
  //                   top: 40,
  //                   right: 16,
  //                   child: IconButton(
  //                       onPressed: () {
  //                         context
  //                             .read<BookedTherapyDetailBloc>()
  //                             .add(BookedTherapyDetailEvent.setDataChanged());
  //                         context
  //                             .read<BookedTherapyDetailBloc>()
  //                             .add(BookedTherapyDetailEvent.refresh());
  //                         Navigator.of(context).pop();
  //                       },
  //                       icon: Icon(Icons.close, size: 32, color: Colors.white)),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  void _sendOTP(BuildContext context, bool isStart, SessionModel? session) {
    if (session == null) {
      return;
    }
    context
        .read<BookedTherapyDetailBloc>()
        .add(BookedTherapyDetailEvent.generateOTP(isStart, session));
  }

  Future _rateUs(
      BookedTherapyDetailState state, SessionModel? recentSession) async {
    var consultationBookingId = state.bookedTherapy?.consultationBookingId;
    var nonConsultationBookingId =
        state.bookedTherapy?.nonConsultationTherapyBookingId;
    var bookingId = '';
    if (consultationBookingId != null && consultationBookingId.isNotEmpty) {
      bookingId = consultationBookingId;
    } else {
      bookingId = nonConsultationBookingId ?? '';
    }
    var therapyName =
        state.bookedTherapy?.bookedTherapyModel.therapyHeadline ?? '';
    var therapistName = recentSession?.displayName ?? '';
    var therapistImageUrl = recentSession?.displayImage ?? '';
    var isSubmitted = await Navigator.of(context).pushNamed(
        RateUsScreen.routName,
        arguments: RateUsArguments(
            bookingId, therapyName, therapistName, therapistImageUrl));
    if (isSubmitted == true) {
      Navigator.pop(context, true);
    }
  }

  void _showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white70,
        textColor: AppColors.darkBlue,
        fontSize: 12.0);
  }

  void _showCancelConfirmationDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)), //this right here
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Are you sure you want to cancel the booking?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButtonWidget(
                              title: 'Yes, Cancel',
                              height: 36,
                              onTap: () {
                                context.read<BookedTherapyDetailBloc>().add(
                                    BookedTherapyDetailEvent.cancelBooking());
                                Navigator.pop(context);
                              }),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: SecondaryButtonWidget(
                              title: 'No, Forget it',
                              height: 36,
                              onTap: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class SingleTherapyItemWidget extends StatelessWidget {
  const SingleTherapyItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final BookedAddOnTherapy item;

  @override
  Widget build(BuildContext context) {
    int sessionCount = 0;

    if (item.totalSessions.runtimeType == int) {
      sessionCount = item.totalSessions as int;
    } else if (item.totalSessions.runtimeType == String) {
      sessionCount = int.parse(item.totalSessions as String);
    }

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 0.75,
              color: Colors.grey,
            )),
        width: 150,
        child: Column(children: [
          _photoWidget(context, item),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(item.headline,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 12)),
          ),
          SizedBox(height: 4),
          Text(
              "${item.totalSessions} ${(sessionCount) > 1 ? "Sessions" : "Session"}",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.grey, fontSize: 12)),
          SizedBox(height: 4),
          Text(
              "${Constant.formatCurrency(double.parse(item.totalAmount.toString()).display())}",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.grey, fontSize: 12)),
          SizedBox(height: 10),
        ]));
  }

  Widget _photoWidget(BuildContext context, BookedAddOnTherapy therapyDetail) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(10), topLeft: Radius.circular(10)),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: therapyDetail.imageUrl,
            progressIndicatorBuilder: (ctx, url, downloadProgess) {
              return Center(
                  child:
                      CircularProgressIndicator(color: AppColors.darkYellow));
            },
            width: double.infinity,
            fit: BoxFit.fill,
            height: 90,
          ),
          // Positioned.fill(
          //     child: Align(
          //         alignment: Alignment.bottomCenter,
          //         child: Container(
          //             width: double.infinity,
          //             height: 45,
          //             decoration: BoxDecoration(
          //               color: Colors.black.withOpacity(0.4),
          //             ),
          //             child: Center(
          //                 child: Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Text(
          //                 therapyDetail.name,
          //                 maxLines: 2,
          //                 textAlign: TextAlign.center,
          //                 style:
          //                     Theme.of(context).textTheme.bodyLarge?.copyWith(
          //                           color: Colors.white,
          //                         ),
          //               ),
          //             )))))
        ],
      ),
    );
  }
}
