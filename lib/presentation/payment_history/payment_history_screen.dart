import 'package:ayursh/application/payment_history/payment_history_bloc.dart';
import 'package:ayursh/domain/model/response/payment_model.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/line_divider_widget.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/utils/app_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class PaymentHistoryScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/payment_history';

  const PaymentHistoryScreen({Key? key}) : super(key: key);

  @override
  PaymentHistoryScreenState createState() {
    return PaymentHistoryScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<PaymentHistoryBloc>()
        ..add(PaymentHistoryEvent.initialize()),
      child: this,
    );
  }
}

class PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
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
    return BlocBuilder<PaymentHistoryBloc, PaymentHistoryState>(
      builder: (ctx, state) {
        return SafeArea(
          child: Stack(
            children: [
              Scaffold(
                  appBar: AppBar(
                    title: Text('Payment History'),
                    leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back_rounded,
                            color: AppColors.darkGray)),
                  ),
                  body: state.paymentModels != null
                      ? (state.paymentModels!.isNotEmpty
                          ? ListView.builder(
                              itemCount: state.paymentModels!.length,
                              itemBuilder: (ctx, index) {
                                return _paymentHistoryItem(
                                    state.paymentModels![index]);
                              })
                          : _emptyWidget())
                      : Container()),
              LoadingWidget(loadingState: state.loadingState)
            ],
          ),
        );
      },
    );
  }

  Widget _paymentHistoryItem(PaymentModel payment) {
    Widget icon =
        SvgPicture.asset('assets/icons/ic_emi.svg', width: 19, height: 19);
    String status = payment.status ?? 'N/A';
    String paidOn = 'N/A';
    String method = 'N/A';
    String amount = payment.amountPaid != null
        ? 'Amount  ${Constant.formatCurrency(payment.amountPaid!.display())}'
        : 'N/A';
    Color statusColor = AppColors.darkBlue;

    if (status.contains('Successful')) {
      statusColor = AppColors.successColor;
    } else if (status.contains('Cancelled')) {
      statusColor = AppColors.darkYellow;
    } else if (status.contains('Failed')) {
      statusColor = AppColors.error;
    }

    if (payment.paidOn != null || payment.type != null) {
      paidOn =
          'Paid on ${payment.paidOn ?? 'N/A'} for ${payment.type ?? 'N/A'}';
    }

    String methodName = payment.method?.toLowerCase() ?? 'N/A';
    if (methodName == 'card') {
      icon =
          SvgPicture.asset('assets/icons/ic_card.svg', width: 22, height: 18);
      method = 'Card';
    } else if (methodName == 'netbanking') {
      icon = SvgPicture.asset('assets/icons/ic_banking.svg',
          width: 19, height: 21);
      method = 'Netbanking';
    } else if (methodName == 'upi') {
      icon = SvgPicture.asset('assets/icons/ic_upi.svg', width: 17, height: 23);
      method = 'UPI';
    } else if (methodName == 'wallet') {
      icon =
          SvgPicture.asset('assets/icons/ic_wallet.svg', width: 22, height: 18);
      method = 'Wallet';
    } else {
      method = methodName.toUpperCase();
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Colors.white,
                  child: Container(
                    width: 62,
                    height: 62,
                    child: Column(children: [
                      SizedBox(height: 8),
                      Container(
                        width: 24,
                        height: 24,
                        child: Center(child: icon),
                      ),
                      SizedBox(height: 8),
                      Text(method,
                          style: TextStyle(
                              color: AppColors.darkBlue,
                              fontSize: 10,
                              fontWeight: Constant.fontMedium)),
                      SizedBox(height: 8),
                    ]),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$status',
                      style: TextStyle(
                          color: statusColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text('$paidOn',
                      style: TextStyle(
                          color: AppColors.darkGray,
                          fontSize: 12,
                          height: 1.4)),
                  SizedBox(height: 8),
                  Text('$amount',
                      style: TextStyle(
                          color: AppColors.darkGray,
                          fontSize: 14,
                          fontWeight: Constant.fontMedium)),
                ],
              ))
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: LineDividerWidget())
      ],
    );
  }

  Widget _emptyWidget() {
    return Column(
      children: [
        Expanded(flex: 1, child: Container()),
        SvgPicture.asset('assets/icons/ic_history_empty.svg',
            width: 80, height: 80),
        SizedBox(height: 16),
        TextWidget(
            text: 'You don\'t have any payment history',
            fontSize: 16,
            height: 21,
            textColor: AppColors.darkGray),
        Expanded(flex: 2, child: Container()),
      ],
    );
  }
}
