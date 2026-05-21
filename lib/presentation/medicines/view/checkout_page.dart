import 'package:alice/alice.dart';
import 'package:ayursh/application/book_appointment/book_appointment_bloc.dart';
import 'package:ayursh/application/main/main_bloc.dart';
import 'package:ayursh/application/my_bookings/my_bookings_bloc.dart';
import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:ayursh/domain/util/size_utils.dart';
import 'package:ayursh/main.dart';
import 'package:ayursh/presentation/main/main_screen.dart';
import 'package:ayursh/presentation/medicines/view_model/cart_vm.dart';
import 'package:ayursh/presentation/payment_success/payment_success_screen.dart';
import 'package:ayursh/presentation/widget/custom_button.dart';
import 'package:ayursh/presentation/widget/image_container.dart';
import 'package:ayursh/presentation/widget/text_filed.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage();

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        context.read<CartVM>().onInitCheckOutPage();
        // final profileState = BlocProvider.of<ProfileBloc>(context).state;
        // customPrint("H1");
        // final profile = profileState.profile;
        // customPrint("H2");
        // if (profile != null) {
        //   customPrint("H3");
        //   firstNameController.text = profile.name ?? "";
        //   emailController.text = profile.email ?? "";
        //   customPrint("H3 > profile.name: ${profile.name ?? ""}, profile.email : ${profile.email ?? ""}");
        // }
        //2
        // final profileState = context.read<ProfileBloc>().state;
        // context.read<ProfileBloc>().add(ProfileEvent.getProfile());
        //
        // ProfileModel? profile = profileState.profile;
        // customPrint("==>> ${profile?.toJson()}");
      },
    );
  }

  final onboardingRepo = getIt<OnboardingRepository>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Provider<MyBookingsBloc>(
        create: (_) => MyBookingsBloc(onboardingRepo: onboardingRepo),
        builder: (context, child) {
          return Scaffold(
            backgroundColor: grey50Color,
            appBar: AppBar(
              backgroundColor: primaryGreenColor,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Checkout",
                style: TextStyle(color: white),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            body: ListView(
              children: [
                h(16),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                  child: Material(
                    color: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    child: Ink(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Form(
                        key: key,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your delivery address",
                              style: style16500PrimaryDark,
                            ),
                            h(16),
                            customTextFiled(
                              controller: firstNameController,
                              hintText: "Firstname",
                              label: "Firstname*",
                              validator: commonValidator(title: "Firstname"),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                            ),
                            h(16),
                            customTextFiled(
                              controller: lastnameController,
                              hintText: "Lastname",
                              label: "Lastname*",
                              validator: commonValidator(title: "Lastname"),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                            ),
                            h(16),
                            customTextFiled(
                              controller: emailController,
                              hintText: "Email",
                              label: "Email*",
                              validator: emailValidator(context),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                            ),
                            h(16),
                            customTextFiled(
                              controller: addressController,
                              hintText: "Address",
                              label: "Address*",
                              validator: commonValidator(title: "Address"),
                              textInputAction: TextInputAction.next,
                            ),
                            h(16),
                            customTextFiled(
                              controller: cityController,
                              hintText: "City",
                              label: "City*",
                              validator: commonValidator(title: "City"),
                              textInputAction: TextInputAction.next,
                            ),
                            h(16),
                            customTextFiled(
                              controller: postalCodeController,
                              hintText: "Postal Code",
                              label: "Postal Code*",
                              validator: pinCodeValidator(),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(6),
                              ],
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                            ),
                            h(16),
                            Divider(
                              height: 1,
                              color: grey500Color,
                            ),
                            h(16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Sub total", style: style14400Grey600),
                                Text("₹ ${context.watch<CartVM>().getTotal}",
                                    style: style14400Grey600),
                              ],
                            ),
                            h(6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Shipping", style: style14400Grey600),
                                Text("₹ 75", style: style14400Grey600),
                              ],
                            ),
                            h(12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total", style: style15600Secondary),
                                Text(
                                    "₹ ${int.parse(context.watch<CartVM>().getTotal) + 75}",
                                    style: style16600Secondary),
                              ],
                            ),
                            h(16),
                            customButton(
                              height: 40,
                              isLoading:
                                  context.watch<CartVM>().isLoadingPlaceOrder,
                              onTap: () {
                                if (key.currentState!.validate()) {
                                  context.read<CartVM>().onTapGetOrderId(
                                      firstName: firstNameController.text,
                                      lastName: lastnameController.text,
                                      email: emailController.text,
                                      address: addressController.text,
                                      pinCode: postalCodeController.text,
                                      city: cityController.text);
                                }
                              },
                              name: "Place Order",
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                h(16),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      h(12),
                      Padding(
                        padding: paddingH,
                        child: Text(
                          "Items",
                          style: style14600Secondary.copyWith(fontSize: 15),
                        ),
                      ),
                      h(2),
                      ...context.watch<CartVM>().cartItems.map(
                        (e) {
                          bool isLast =
                              context.watch<CartVM>().cartItems.last == e;
                          return Column(
                            children: [
                              Container(
                                height: 100,
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    networkImageContainer(
                                      borderRadius: BorderRadius.circular(3),
                                      imageUrl: e.photo ?? "",
                                      height: 76,
                                      width: 76,
                                    ),
                                    w(8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              capitalizeEachWord(
                                                  (e.name ?? "")),
                                              maxLines: 2,
                                              style: style14600Secondary,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "₹ ${e.price ?? ""}",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        primaryGreenDarkColor,
                                                  ),
                                                ),
                                              ),
                                              w(6),
                                              Text(
                                                "Qty : ${e.qty}",
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
                              if (!isLast)
                                Divider(
                                  height: 1,
                                  endIndent: 16,
                                  indent: 16,
                                  color: grey300Color,
                                ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                h(16),
              ],
            ),
          ); // Now CheckoutPage can access MyBookingsBloc
        },
      ),
    );
  }
}
