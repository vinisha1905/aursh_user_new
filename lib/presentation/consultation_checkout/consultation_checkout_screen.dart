import 'package:ayursh/application/consultation_checkout/consultation_checkout_bloc.dart';
import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:ayursh/domain/model/business/session_selected_info.dart';
import 'package:ayursh/domain/model/response/booking_user_model.dart';
import 'package:ayursh/domain/model/response/consultation_create_order_model.dart';
import 'package:ayursh/domain/model/response/doctor_model.dart';
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../main.dart';

class ConsultationCheckoutArguments {
  final DoctorModel doctorInfo;
  final BookingSlotInfo bookingSlotInfo;
  final BookingUserModel bookingUser;
  final SessionSelectedInfo? sessionSelectedInfo;

  ConsultationCheckoutArguments(this.doctorInfo, this.bookingSlotInfo,
      this.bookingUser, this.sessionSelectedInfo);
}

class ConsultationCheckoutScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/consultation_checkout';
  final ConsultationCheckoutArguments arguments;

  const ConsultationCheckoutScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  ConsultationCheckoutScreenState createState() {
    return ConsultationCheckoutScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<ConsultationCheckoutBloc>()
        ..add(ConsultationCheckoutEvent.initialize(
            arguments.doctorInfo,
            arguments.bookingSlotInfo,
            arguments.bookingUser,
            arguments.sessionSelectedInfo)),
      child: this,
    );
  }
}

class ConsultationCheckoutScreenState
    extends State<ConsultationCheckoutScreen> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
  }

  var price, doctorName;
  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // facebookAppEvents.logPurchase(
    //   amount:price ,
    //   currency: 'INR',
    //   parameters: {
    //     "content_ids": doctorName, // 'REQUIRED': array of product IDs
    //     "value": price, // REQUIRED, up to 2 decimals optional
    //     "currency": 'INR', // REQUIRED
    //     "content_type": 'product', // RECOMMENDED: Either product or product_group based on the content_ids or contents being passed.
    //   },
    // );
    _trackPayment(true,
        'paymentId: ${response.paymentId}, orderId: ${response.orderId}, signature: ${response.signature}');
    if (response.paymentId != null && response.signature != null) {
      context.read<ConsultationCheckoutBloc>().add(
          ConsultationCheckoutEvent.checkoutOrder(
              response.paymentId!, response.signature!));
    }
    _razorpay.clear();
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
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child:
            BlocConsumer<ConsultationCheckoutBloc, ConsultationCheckoutState>(
          listener: (ctx, state) {
            if (state.createOrderResult != null && !state.isConsumedOrderId) {
              context
                  .read<ConsultationCheckoutBloc>()
                  .add(ConsultationCheckoutEvent.consumeOrderId(true));
              _openRazorPay(state.createOrderResult!, state);
            }
            if (state.errorMessage != null) {
              _showError(state.errorMessage!);
              context
                  .read<ConsultationCheckoutBloc>()
                  .add(ConsultationCheckoutEvent.resetError());
            }
            if (state.bookingCompleted) {
              Navigator.of(context).pushNamed(PaymentSuccessScreen.routName,
                  arguments: PaymentSuccessArguments(BookFor.DoctorConsultation,
                      true, state.razorpayPaymentId ?? ''));
            }
          },
          builder: (ctx, state) {
            var doctorInfo = state.doctorInfo;
            var bookingUser = state.bookingUser;
            var bookingSlotInfo = state.bookingSlotInfo;
            price = doctorInfo?.consultationFee;
            doctorName = doctorInfo?.displayName;
            if (doctorInfo == null ||
                bookingUser == null ||
                bookingSlotInfo == null) {
              return Container();
            }
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
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            margin: EdgeInsets.all(16),
                            elevation: 0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _avatarWidget(doctorInfo),
                                _doctorInfoWidget(doctorInfo)
                              ],
                            ),
                          ),
                          LineDividerWidget(),
                          _amountWidget(doctorInfo),
                          LineDividerWidget(),
                          _infoWidget(
                              SvgPicture.asset(
                                'assets/icons/ic_tab_profile_unselected.svg',
                                width: 16,
                                color: AppColors.darkGray,
                                fit: BoxFit.fitWidth,
                              ),
                              'Booking For',
                              '${bookingUser.bookingForName}, ${bookingUser.bookingForGender}, ${bookingUser.bookingForAge}'),
                          LineDividerWidget(),
                          _infoWidget(
                              SvgPicture.asset(
                                'assets/icons/ic_tab_booking_unselected.svg',
                                width: 16,
                                color: AppColors.darkGray,
                                fit: BoxFit.fitWidth,
                              ),
                              'Scheduled On',
                              '${bookingSlotInfo.day}, ${bookingSlotInfo.date}, ${bookingSlotInfo.time}'),
                          LineDividerWidget(),
                          SizedBox(height: 100)
                        ],
                      ),
                    )),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: _bottomBottomWidget(state)),
                LoadingWidget(loadingState: state.loadingState)
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _amountWidget(DoctorModel doctorInfo) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 30, right: 26),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/ic_hand_money.svg',
              color: AppColors.darkGray, width: 20, fit: BoxFit.fitWidth),
          SizedBox(width: 12),
          TextWidget(
              text: 'Amount Payable',
              fontSize: 16,
              height: 21,
              textColor: AppColors.darkGray),
          Expanded(
              child: Text(
            '${Constant.formatCurrency(doctorInfo.consultationFee.display())}',
            style: TextStyle(
                fontSize: 18,
                fontWeight: Constant.fontMedium,
                color: AppColors.darkBlue),
            textAlign: TextAlign.end,
          )),
        ],
      ),
    );
  }

  Expanded _doctorInfoWidget(DoctorModel doctorInfo) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 6, top: 10, bottom: 16, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(doctorInfo.displayName,
                style: TextStyle(
                    fontSize: 16,
                    height: 1.3,
                    fontWeight: Constant.fontMedium,
                    color: AppColors.darkGray)),
            SizedBox(height: 6),
            TextWidget(
                text: doctorInfo.qualification,
                fontSize: 14,
                height: 19,
                textColor: AppColors.darkGray),
            SizedBox(height: 6),
            TextWidget(
                text: 'Experience ${doctorInfo.experience} years',
                fontSize: 12,
                height: 16,
                textColor: AppColors.darkGray),
            SizedBox(height: 10),
            Text('Expertise in ${doctorInfo.expertise}',
                style: TextStyle(
                    fontSize: 14,
                    height: 1.3,
                    fontWeight: Constant.fontLight,
                    color: AppColors.darkGray)),
          ],
        ),
      ),
    );
  }

  Padding _avatarWidget(DoctorModel doctorInfo) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Container(
        width: 100,
        height: 100,
        child: ClipOval(
          child: Container(
              width: 100,
              height: 100,
              child: CachedNetworkImage(
                imageUrl: doctorInfo.displayImage,
                errorWidget: (_, url, ___) {
                  return Container(
                    color: AppColors.greyMedium,
                  );
                },
              )),
        ),
      ),
    );
  }

  Widget _infoWidget(Widget icon, String title, String subTitle) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 30, right: 26),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextWidget(
                    text: title,
                    fontSize: 16,
                    height: 21,
                    textColor: AppColors.darkGray),
                SizedBox(height: 10),
                Text(subTitle,
                    style: TextStyle(
                        height: 1.3,
                        color: AppColors.darkGray,
                        fontWeight: Constant.fontMedium,
                        fontSize: 18))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bottomBottomWidget(ConsultationCheckoutState state) {
    return Container(
      color: Colors.white,
      width: 200,
      padding: EdgeInsets.only(bottom: 22, left: 32, right: 32),
      child: PrimaryButtonWidget(
          title: 'Payment',
          onTap: () {
            context
                .read<ConsultationCheckoutBloc>()
                .add(ConsultationCheckoutEvent.createOrder());
          }),
    );
  }

  void _openRazorPay(ConsultationCreateOrderModel createOrderModel,
      ConsultationCheckoutState state) {
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
      print(e);
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
    data['receipt'] = context
            .read<ConsultationCheckoutBloc>()
            .state
            .createOrderResult
            ?.receipt ??
        '';
    context
        .read<ConsultationCheckoutBloc>()
        .add(ConsultationCheckoutEvent.trackPayment(data));
  }
}
