import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/domain/util/size_utils.dart';
import 'package:ayursh/presentation/page_my_bookings/medicine_booking_list/view_model/medicine_booking_vm.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/api_state_widgets.dart';
import 'package:ayursh/presentation/widget/image_container.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicineOrderDetailPage extends StatefulWidget {
  final int orderId;

  MedicineOrderDetailPage({Key? key, required this.orderId});

  @override
  State<MedicineOrderDetailPage> createState() => _MedicineOrderDetailPageState();
}

class _MedicineOrderDetailPageState extends State<MedicineOrderDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MedicineBookingVM>().getBookingDetail(orderId: widget.orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back_rounded, color: AppColors.darkGray)),
      ),
      body: SafeArea(
        child: CustomApiUi(
          state: context.watch<MedicineBookingVM>().getBookingDetailsApiState,
          error: context.watch<MedicineBookingVM>().errorGetBookingDetails,
          onTryAgain: () {
            context.read<MedicineBookingVM>().getBookingDetail(orderId: widget.orderId);
          },
          onRefresh: () async {
            context.read<MedicineBookingVM>().getBookingDetail(orderId: widget.orderId, isRefresh: true);
          },
          widgets: [
            ...?context.watch<MedicineBookingVM>().medicineBookingDetailModel?.product?.map(
                  (e) => Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 14),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        networkImageContainer(
                          borderRadius: BorderRadius.circular(3),
                          imageUrl: e.photo ?? "",
                          height: 78,
                          width: 78,
                        ),
                        w(8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  capitalizeEachWord((e.name ?? "")),
                                  maxLines: 2,
                                  style: style14600Secondary,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      Constant.formatCurrency(e.orderPrice?.toInt().toString() ?? ''),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: primaryGreenDarkColor,
                                      ),
                                    ),
                                  ),
                                  w(6),
                                  Text(
                                    "Qty : ${e.orderQuantity}",
                                    style: style12400Secondary,
                                  ),
                                  w(6),
                                ],
                              ),
                              h(8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            buildBody()
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    var data = context.watch<MedicineBookingVM>().medicineBookingDetailModel;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          constHeight20(),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Shipping Address : ",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
                ),
                TextSpan(
                  text: "${data?.order?.firstName} ${data?.order?.lastName}, ${data?.order?.address}, ${data?.order?.city}-${data?.order?.postalCode}",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
          ),
          h(8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Contact No. : ",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
                ),
                TextSpan(
                  text: "${data?.order?.mobile}",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
          ),
          h(8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Total Medicine Price : ",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
                ),
                TextSpan(
                  text: "${Constant.formatCurrency(data?.order?.totalMedicinePrice?.toInt().toString() ?? '')}",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
          ),
          h(8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Shipping Charge : ",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
                ),
                TextSpan(
                  text: Constant.formatCurrency(data?.order?.deliveryPrice?.toInt().toString() ?? ''),
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
          ),
          h(8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Total Price : ",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
                ),
                TextSpan(
                  text: Constant.formatCurrency(data?.order?.totalPrice?.toInt().toString() ?? ""),
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
