import 'dart:convert';

import 'package:ayursh/application/therapy_checkout/therapy_checkout_bloc.dart';
import 'package:ayursh/application/therapy_detail/therapy_detail_bloc.dart';
import 'package:ayursh/domain/model/business/address_info.dart';
import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:ayursh/domain/model/business/therapy_booking_info.dart';
import 'package:ayursh/domain/model/response/add_on_therapy_post.dart';
import 'package:ayursh/domain/model/response/therapy_create_order_model.dart';
import 'package:ayursh/presentation/main/main_screen.dart';
import 'package:ayursh/presentation/payment_success/payment_success_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/line_divider_widget.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/utils/app_extentions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../domain/util/preference_util.dart';

class TherapyCheckoutArguments {
  final TherapyBookingInfo therapyBookingInfo;
  final BookingSlotInfo bookingSlotInfo;
  final AddressInfo addressInfo;

  TherapyCheckoutArguments(
      {required this.therapyBookingInfo,
      required this.bookingSlotInfo,
      required this.addressInfo});
}

class TherapyCheckoutScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/therapy_checkout';
  final TherapyCheckoutArguments arguments;

  const TherapyCheckoutScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  TherapyCheckoutScreenState createState() {
    return TherapyCheckoutScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<TherapyCheckoutBloc>()
        ..add(TherapyCheckoutEvent.initialize(arguments.therapyBookingInfo,
            arguments.bookingSlotInfo, arguments.addressInfo)),
      child: this,
    );
  }
}

class TherapyCheckoutScreenState extends State<TherapyCheckoutScreen> {
  late Razorpay _razorpay;
  TextEditingController referralController = TextEditingController();
  GlobalKey<FormState> referralKey = GlobalKey();
  ReferralModal? referralModel;
  String referralCode = '';
  String? referralError;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // facebookAppEvents.logPurchase(
    //   amount: widget.arguments.therapyBookingInfo.addOnTherapies[0].amountPayable,
    //   currency: 'INR',
    //   parameters: {
    //     "therapy_title": widget.arguments.therapyBookingInfo.addOnTherapies[0].name, // 'REQUIRED': array of product IDs
    //     "value": widget.arguments.therapyBookingInfo.addOnTherapies[0].amountPayable, // REQUIRED, up to 2 decimals optional
    //     "currency": 'INR', // REQUIRED
    //     "content_type": 'product', // RECOMMENDED: Either product or product_group based on the content_ids or contents being passed.
    //   },
    // );
    _trackPayment(true,
        'paymentId: ${response.paymentId}, orderId: ${response.orderId}, signature: ${response.signature}');
    if (response.paymentId != null && response.signature != null) {
      context.read<TherapyCheckoutBloc>().add(
          TherapyCheckoutEvent.checkoutOrder(
              response.paymentId!, response.signature!, referralModel));
    }
    _razorpay.clear();
  }

  void _onTextChanged(String value) {
    final upper = value.toUpperCase();
    if (referralController.text != upper) {
      final selection = referralController.selection;
      referralController.value = TextEditingValue(
        text: upper,
        selection: selection,
      );
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    _trackPayment(
        false, 'code: ${response.code}, message: ${response.message}');
    _showError('Payment Failed');
    _razorpay.clear();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    _razorpay.clear();
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<TherapyCheckoutBloc, TherapyCheckoutState>(
        listener: (ctx, state) {
          if (state.createOrderResult != null && !state.isConsumedOrderId) {
            context
                .read<TherapyCheckoutBloc>()
                .add(TherapyCheckoutEvent.consumeOrderId(true));
            _openRazorPay(state.createOrderResult!, state);
          }
          if (state.errorMessage != null) {
            _showError(state.errorMessage!);
            context
                .read<TherapyCheckoutBloc>()
                .add(TherapyCheckoutEvent.resetError());
          }
          if (state.bookingCompleted) {
            Navigator.of(context).pushNamed(PaymentSuccessScreen.routName,
                arguments: PaymentSuccessArguments(
                    BookFor.Therapy,
                    state.razorpayPaymentId == null ? false : true,
                    state.razorpayPaymentId ?? ''));
          }
        },
        builder: (ctx, state) {
          var therapyBookingInfo = state.therapyBookingInfo;
          var addressInfo = state.addressInfo;
          var bookingSlotInfo = state.bookingSlotInfo;

          // final total = widget.arguments.therapyBookingInfo.totalAmount;

          // var totalAddOns = 0.0;

          // for (final item in widget.arguments.therapyBookingInfo.addOnTherapies)
          //   totalAddOns += item.amountPayable;
          if (therapyBookingInfo == null ||
              addressInfo == null ||
              bookingSlotInfo == null) {
            return Container();
          }
          var bookingFor =
              '${therapyBookingInfo.bookingUserModel!.bookingForName},'
              ' ${therapyBookingInfo.bookingUserModel!.bookingForGender.substring(0, 1).toUpperCase()},'
              ' ${therapyBookingInfo.bookingUserModel!.bookingForAge}';
          var dateTime = '${bookingSlotInfo.date} at ${bookingSlotInfo.time}';
          var address =
              '${addressInfo.flatNoBuilding}, ${addressInfo.localityArea}, '
              '${addressInfo.landMark}';
          return Stack(
            children: [
              Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: Text('Check Out'),
                    leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back_rounded,
                            color: AppColors.darkGray)),
                  ),
                  bottomNavigationBar: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _bottomBottomWidget(state),
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                    text: 'Booking For',
                                    fontSize: 14,
                                    height: 19,
                                    textColor: AppColors.darkGray),
                                TextWidget(
                                    text: '$bookingFor',
                                    fontSize: 14,
                                    height: 18,
                                    fontWeight: Constant.fontMedium,
                                    textColor: AppColors.darkGray),
                              ]),
                        ),
                        LineDividerWidget(),
                        SizedBox(height: 20),
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            height: 230,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 5.0),
                                  child: SingleCheckoutItemWidget(
                                      item: AddOnTherapyPost(
                                          widget.arguments.therapyBookingInfo
                                              .totalAmount,
                                          widget
                                              .arguments
                                              .therapyBookingInfo
                                              .sessionSelectedInfo
                                              .sessionDurationInMin!,
                                          int.parse(widget
                                              .arguments
                                              .therapyBookingInfo
                                              .sessionSelectedInfo
                                              .totalSession!),
                                          widget.arguments.therapyBookingInfo
                                              .therapyTitle,
                                          int.parse(widget
                                              .arguments
                                              .therapyBookingInfo
                                              .sessionSelectedInfo
                                              .totalSession!),
                                          widget.arguments.therapyBookingInfo
                                              .therapyImage,
                                          widget.arguments.therapyBookingInfo
                                              .therapyHeadline,
                                          widget.arguments.therapyBookingInfo
                                              .serviceTypeEnum,
                                          widget.arguments.therapyBookingInfo
                                              .servicePart)),
                                ),
                                for (final item in widget.arguments
                                    .therapyBookingInfo.addOnTherapies)
                                  Container(
                                      margin: const EdgeInsets.only(left: 20.0),
                                      child:
                                          SingleCheckoutItemWidget(item: item)),
                                SizedBox(width: 20),
                              ],
                            )),
                        SizedBox(height: 20),
                        LineDividerWidget(),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                    text: 'Appointment Date & Time',
                                    fontSize: 14,
                                    height: 19,
                                    textColor: AppColors.darkGray),
                                TextWidget(
                                    text: '$dateTime',
                                    fontSize: 14,
                                    height: 18,
                                    fontWeight: Constant.fontMedium,
                                    textColor: AppColors.darkGray),
                              ]),
                        ),
                        LineDividerWidget(),
                        if (widget
                                .arguments.therapyBookingInfo.servicesOffered !=
                            'in-clinic') ...[
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                      text: 'Address',
                                      fontSize: 14,
                                      height: 19,
                                      textColor: AppColors.darkGray),
                                  SizedBox(height: 6),
                                  Text('$address',
                                      style: TextStyle(
                                          fontSize: 14,
                                          height: 1.3,
                                          fontWeight: Constant.fontMedium,
                                          color: AppColors.darkGray)),
                                ]),
                          )
                        ] else ...[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 16, top: 5, right: 16, bottom: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        text: 'Ayursh Centre',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.darkBlue),
                                        children: [
                                      TextSpan(
                                        text:
                                            '${"\nYou will visit nearest Centre (${widget.arguments.therapyBookingInfo.finderResponse?.data?.locations?[0].distance ?? 0} Km)"}',
                                        style: TextStyle(
                                            height: 1.5,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.darkGray),
                                      )
                                    ])),
                                SizedBox(height: 12),
                                Text(
                                  'You will receive full address of Ayursh Centre post booking confirmation.',
                                  style: TextStyle(
                                      color: AppColors.darkGray, fontSize: 14),
                                ),
                                SizedBox(height: 5),
                                LineDividerWidget(height: 1),
                              ],
                            ),
                          ),
                        ],
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16,
                            top: 5,
                            right: 16,
                          ),
                          child: Form(
                            key: referralKey,
                            child: TextFormField(
                              enabled: referralModel == null ? true : false,
                              cursorColor: AppColors.darkGray,
                              onChanged: (val) {
                                _onTextChanged(val);

                                setState(() {
                                  referralError = null;
                                });
                              },
                              controller: referralController,
                              validator: (val) {
                                // if (val!.isEmpty) {
                                //   return "Please enter the referral code";
                                // } else if (val.length != 6 ||
                                //     referralController.text.length != 6) {
                                //   return "Referral code must be 6 digits";
                                // }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[A-Za-z0-9]')),
                                LengthLimitingTextInputFormatter(6),
                              ],
                              autovalidateMode: AutovalidateMode.onUnfocus,
                              decoration: InputDecoration(
                                  focusColor: AppColors.dividerColor,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.dividerColor)),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  hintText: "Referral Code",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.dividerColor)),
                                  errorText: referralError,
                                  errorMaxLines: 2,
                                  suffixIcon: IconButton(
                                      onPressed: () async {
                                        FocusScope.of(context).unfocus();
                                        if (referralKey.currentState!
                                            .validate()) {
                                          referralCode =
                                              referralController.text;
                                          String url =
                                              "https://prod.ayursh.com/onboarding/api/v1/therapy/booking/referral";
                                          print(
                                              "consultation :${widget.arguments.therapyBookingInfo.consultationBookingId}");
                                          print(
                                              "consultation :${widget.arguments.therapyBookingInfo.doctorBookingId}");
                                          print(
                                              "consultation :${widget.arguments.therapyBookingInfo.bookingUserModel?.bookingForName}");
                                          print(
                                              "consultation :${widget.arguments.therapyBookingInfo.sessionSelectedInfo.totalSession}");
                                          await GetIt.I.allReady();
                                          var preferenceUtil =
                                              GetIt.I.get<PreferenceUtil>();
                                          var accessToken = await preferenceUtil
                                              .getAccessToken();
                                          final headers = {
                                            "Content-Type": "application/json",
                                            "Authorization":
                                                "Bearer $accessToken",
                                          };

                                          final body = jsonEncode({
                                            "referral_code": referralController
                                                .text
                                                .toUpperCase(),
                                            "total_amount": therapyBookingInfo
                                                .totalAmountOfSessions,
                                          });

                                          try {
                                            final response = await http.post(
                                                Uri.parse(url),
                                                headers: headers,
                                                body: body);
                                            print(
                                                "Referral code response : $response");
                                            if (response.statusCode == 200) {
                                              print(
                                                  "run time type : ${response.body.runtimeType}");
                                              referralModel =
                                                  getReferralFromJson(
                                                      response.body);
                                              referralController.clear();
                                              referralError = null;
                                              setState(() {});
                                            } else {
                                              print(
                                                  "response error: ${response.body}");
                                              print(
                                                  "run time type : ${response.body.runtimeType}");
                                              var decodeData =
                                                  jsonDecode(response.body);
                                              if (referralController
                                                  .text.isEmpty) {
                                                referralError =
                                                    "Please enter the referral code";
                                              } else if (referralController
                                                      .text.length !=
                                                  6) {
                                                referralError =
                                                    "Referral code must be 6 digits";
                                              } else {
                                                referralError =
                                                    decodeData['message'];
                                              }
                                              setState(() {});
                                            }
                                          } catch (error, stack) {
                                            print("Response error : $error");
                                            print("Response error : $stack");
                                          }
                                        }
                                      },
                                      icon: Opacity(
                                        opacity:
                                            referralModel != null ? 0.4 : 1,
                                        child: SvgPicture.asset(
                                          "assets/icons/ic_circle_arrow_right.svg",
                                          height: 50,
                                          width: 50,
                                        ),
                                      ))),
                            ),
                          ),
                        ),
                        if (referralModel != null)
                          Container(
                            margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  referralCode,
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      referralCode = '';
                                      referralModel = null;
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.close,
                                      size: 20,
                                    ))
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (referralModel != null)
                                Column(
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                              text: 'SubTotal',
                                              fontSize: 16,
                                              height: 21,
                                              fontWeight: Constant.fontMedium,
                                              textColor: AppColors.darkGray),
                                          TextWidget(
                                              text:
                                                  '${Constant.formatCurrency(therapyBookingInfo.totalAmountOfSessions.display())}',
                                              fontSize: 16,
                                              height: 21,
                                              fontWeight: Constant.fontMedium,
                                              textColor: AppColors.darkGray),
                                        ]),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                              text:
                                                  'Discount (${referralModel!.data!.referralDiscount}%)',
                                              fontSize: 16,
                                              height: 21,
                                              fontWeight: Constant.fontMedium,
                                              textColor: AppColors.darkGray),
                                          TextWidget(
                                              text:
                                                  '${Constant.formatCurrency((int.parse(therapyBookingInfo.totalAmountOfSessions.display()) - int.parse(referralModel!.data!.discountedAmount.toString())).toString())}',
                                              fontSize: 16,
                                              height: 21,
                                              fontWeight: Constant.fontMedium,
                                              textColor: AppColors.darkGray),
                                        ]),
                                  ],
                                ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                        text: 'Total Amount Payable',
                                        fontSize: 16,
                                        height: 21,
                                        fontWeight: Constant.fontMedium,
                                        textColor: AppColors.darkGray),
                                    TextWidget(
                                        text: (referralModel != null)
                                            ? "${Constant.formatCurrency(referralModel!.data!.discountedAmount.toString())}"
                                            : '${Constant.formatCurrency(therapyBookingInfo.totalAmountOfSessions.display())}',
                                        fontSize: 16,
                                        height: 21,
                                        fontWeight: Constant.fontMedium,
                                        textColor: AppColors.darkGray),
                                  ]),
                            ],
                          ),
                        ),
                        LineDividerWidget(),
                        SizedBox(height: 120)
                      ],
                    ),
                  )),
              LoadingWidget(loadingState: state.loadingState)
            ],
          );
        },
      ),
    );
  }

  Widget _bottomBottomWidget(TherapyCheckoutState state) {
    return Container(
      color: Colors.white,
      // width: 200,
      padding: EdgeInsets.only(bottom: 22, left: 32, right: 32, top: 20),
      child: Column(
        children: [
          PrimaryButtonWidget(
              title: 'Payment',
              onTap: () {
                context
                    .read<TherapyCheckoutBloc>()
                    .add(TherapyCheckoutEvent.createOrder(referralModel));
              }),
          SizedBox(height: 20),
          PrimaryButtonWidget(
              title: 'Cash on Delivery',
              onTap: () {
                // context
                //     .read<TherapyCheckoutBloc>()
                //     .add(TherapyCheckoutEvent.createCODOrder());
                _showCODConfirmationDialog(context);
              }),
        ],
      ),
    );
  }

  void _openRazorPay(
      TherapyCreateOrderModel createOrderModel, TherapyCheckoutState state) {
    try {
      Map<String, dynamic> options = {};
      options['key'] = Constant.razorKey;
      options['name'] = createOrderModel.name;
      options['description'] = createOrderModel.ayurshOrderId;
      options['image'] = 'https://s3.amazonaws.com/rzp-mobile/images/rzp.png';
      options['currency'] = createOrderModel.currency;
      options['order_id'] = createOrderModel.razorpayOrderId;
      options['amount'] = createOrderModel.amountDue;
      options['prefill.name'] = createOrderModel.prefill.name;
      options['prefill.email'] = createOrderModel.prefill.email;
      options['prefill.contact'] = createOrderModel.prefill.contact;
      print('options pass in razor pay ${options.toString()}');

      _razorpay.open(options);

      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    } catch (e) {
      print("_openRazorPay Error : $e");
    }
  }

  void _showError(String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white70,
        textColor: AppColors.darkBlue,
        fontSize: 12.0);
  }

  void _trackPayment(bool isSuccess, String paymentData) {
    Map<String, dynamic> data = {};
    data['isPaymentSuccess'] = isSuccess;
    data['paymentData'] = paymentData;
    data['receipt'] =
        context.read<TherapyCheckoutBloc>().state.createOrderResult?.receipt ??
            '';
    context
        .read<TherapyCheckoutBloc>()
        .add(TherapyCheckoutEvent.trackPayment(data));
  }

  void _showCODConfirmationDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            clipBehavior: Clip.antiAlias,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top grey icon section
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Color(0xFFF0F0F0),
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/icons/ic_hand_money.svg',
                        height: 120,
                        colorFilter:
                            ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      )),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child:
                            Icon(Icons.close, size: 22, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                // Bottom white content section
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 28),
                  child: Column(
                    children: [
                      Text(
                        'Half payment to be paid in Advance.',
                        // 'Do you want to proceed with this booking ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF444444),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Remaining half to be paid once therapist arrives your home',
                        // '(Advance ₹1000 to be paid)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF444444),
                        ),
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.read<TherapyCheckoutBloc>().add(
                                TherapyCheckoutEvent.createCODOrder(
                                    referralModel));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFBF6B35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Agree',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class SingleCheckoutItemWidget extends StatelessWidget {
  const SingleCheckoutItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final AddOnTherapyPost item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.75,
            color: Colors.grey,
          )),
      width: 180,
      child: Column(
        children: [
          _photoWidget(context, item),
          Spacer(),
          Text('${Constant.formatCurrency(item.amountPayable.display())}',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
          Spacer(),
          Text(
              '${item.totalSessions} ${item.totalSessions == 1 ? 'Session' : 'Sessions'}',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
          Spacer(),
          Text('${item.sessionDurationInMin}-minutes',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
          Spacer(),
          Text(
              "${item.servicePart == ServicePart.Body && item.serviceType == ServiceType.Part ? "Half Body" : item.servicePart == ServicePart.Body && item.serviceType == ServiceType.Full ? 'Full Body' : item.servicePart == ServicePart.Knee && item.serviceType == ServiceType.Part ? 'One Knee' : item.servicePart == ServicePart.Knee && item.serviceType == ServiceType.Full ? 'Two Knee' : ''}",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
          Spacer(),
        ],
      ),
    );
  }

  Widget _photoWidget(BuildContext context, AddOnTherapyPost therapyDetail) {
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
            height: 120,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      therapyDetail.name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

ReferralModal getReferralFromJson(String str) =>
    ReferralModal.fromJson(json.decode(str));

String getReferralToJson(ReferralModal data) => json.encode(data.toJson());

class ReferralModal {
  bool? success;
  String? errorCode;
  String? message;
  Data? data;

  ReferralModal({this.success, this.errorCode, this.message, this.data});

  ReferralModal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['error_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? referrerType;
  String? referrerId;
  int? discountedAmount;
  int? referrerCommission;
  int? referralDiscount;

  Data(
      {this.referrerType,
      this.referrerId,
      this.discountedAmount,
      this.referrerCommission,
      this.referralDiscount});

  Data.fromJson(Map<String, dynamic> json) {
    referrerType = json['referrer_type'];
    referrerId = json['referrer_id'];
    discountedAmount = json['discounted_amount'];
    referrerCommission = json['referrer_commission'];
    referralDiscount = json['referral_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['referrer_type'] = this.referrerType;
    data['referrer_id'] = this.referrerId;
    data['discounted_amount'] = this.discountedAmount;
    data['referrer_commission'] = this.referrerCommission;
    data['referral_discount'] = this.referralDiscount;
    return data;
  }
}
