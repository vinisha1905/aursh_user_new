import 'package:ayursh/application/main/main_bloc.dart';
import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/domain/util/size_utils.dart';
import 'package:ayursh/presentation/page_my_bookings/medicine_booking_list/medicine_order_detail_page.dart';
import 'package:ayursh/presentation/page_my_bookings/medicine_booking_list/view_model/medicine_booking_vm.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/api_state_widgets.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/utils/my_separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MedicineBookingPage extends StatefulWidget {
  const MedicineBookingPage({Key? key});

  @override
  State<MedicineBookingPage> createState() => _MedicineBookingPageState();
}

class _MedicineBookingPageState extends State<MedicineBookingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MedicineBookingVM>().getBookingList();
      context.read<MainBloc>().add(MainEvent.hideLoading());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomApiUi(
          state: context.watch<MedicineBookingVM>().getProductDetailsApiState,
          error: context.watch<MedicineBookingVM>().errorGetProductDetails,
          onRefresh: () async {
            context.read<MedicineBookingVM>().getBookingList(isRefresh: true);
          },
          onTryAgain: () {
            context.read<MedicineBookingVM>().getBookingList();
          },
          dataNotFoundWidget: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 160,
                  child: PrimaryButtonWidget(
                      title: 'Shop Medicines',
                      height: 34,
                      onTap: () {
                        context.read<MainBloc>().add(MainEvent.selectTab(1, MainState.initialize().bookFor));
                      }),
                ),
              ],
            ),
          ),
          widgets: [
            ...context.watch<MedicineBookingVM>().bookings.map((e) => Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MedicineOrderDetailPage(orderId: e.id ?? 0),
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 14),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
                        BoxShadow(color: Colors.black12, offset: Offset(0, 0), spreadRadius: 4, blurRadius: 14),
                      ]),
                      child: Column(
                        children: [
                          customTile(title: "Order Id : ", subTitle: "#${e.id}"),
                          h(8),
                          customTile(title: "Date : ", subTitle: DateFormat('yyyy-MM-dd').format(e.created ?? DateTime.now())),
                          constHeight10(),
                          const MySeparator(),
                          // customTile(title: "Delivery Price : ", subTitle: Constant.formatCurrency(e.deliveryPrice.toString())),
                          // h(8),
                          // customTile(title: "Total Price : ", subTitle: Constant.formatCurrency(e.totalPrice.toString())),
                          h(8),
                          customTile(title: "Total Medicine Price : ", subTitle: Constant.formatCurrency(e.totalMedicinePrice.toString())),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget customTile({
    required String title,
    required String subTitle,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(color: AppColors.darkGray, height: 1.4, fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          child: Text(
            subTitle,
            style: TextStyle(color: AppColors.darkGray, height: 1.4),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
