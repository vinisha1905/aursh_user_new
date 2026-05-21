import 'dart:developer';

import 'package:ayursh/application/address/address_bloc.dart';
import 'package:ayursh/application/tems_and_conditions/terms_and_conditions_bloc.dart';
import 'package:ayursh/application/therapy_detail/therapy_detail_bloc.dart';
import 'package:ayursh/domain/model/business/session_selected_info.dart';
import 'package:ayursh/domain/model/business/therapy_booking_info.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/booking_user_model.dart';
import 'package:ayursh/domain/model/response/therapy_detail_model.dart';
import 'package:ayursh/presentation/doctor_list/doctor_list_screen.dart';
import 'package:ayursh/presentation/frequently_added/frequently_added_screen.dart';
import 'package:ayursh/presentation/therapy_detail/google_map_apis.dart';
import 'package:ayursh/presentation/therapy_detail/widget/bullet_point_widget.dart';
import 'package:ayursh/presentation/therapy_detail/widget/product_widget.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/line_divider_widget.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

List<int> durations = [60, 75, 90];

class TherapyDetailArguments {
  final String categoryTitle;
  final String therapyTitle;
  final String? doctorBookingId;
  final String? consultationBookingId;
  final BookingUserModel? bookingUser;

  const TherapyDetailArguments(
      {required this.categoryTitle,
      required this.therapyTitle,
      this.doctorBookingId,
      this.consultationBookingId,
      this.bookingUser});
}

class TherapyDetailScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/therapy_detail';
  final TherapyDetailArguments arguments;

  const TherapyDetailScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  TherapyDetailScreenState createState() {
    return TherapyDetailScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<TherapyDetailBloc>()
        ..add(TherapyDetailEvent.initialize(
            arguments.categoryTitle, arguments.therapyTitle))
        ..add(TherapyDetailEvent.getTherapyDetail())
        ..add(TherapyDetailEvent.getLocation(setDefault: true))
        ..add(TherapyDetailEvent.getClinicDetails()),
      child: this,
    );
  }
}

class TherapyDetailScreenState extends State<TherapyDetailScreen> {
  late ScrollController scrollController;
  late AddressBloc addressBloFc;
  dynamic selectedRadioValue = 1;
  int index = 0;
  bool isIncluded = true;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    context
        .read<TherapyDetailBloc>()
        .add(TherapyDetailEvent.setTherapyPlace("home-visit"));
    context.read<TherapyDetailBloc>().add(
        TherapyDetailEvent.getLocation(setDefault: true, setCurrent: false));
    context
        .read<TherapyDetailBloc>()
        .add(TherapyDetailEvent.getClinicDetails());
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
    // categoriesController = null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<TherapyDetailBloc, TherapyDetailState>(
          listener: (ctx, state) {},
          builder: (ctx, state) {
            print("service part ::${state.servicePart}");
            var therapyDetail = state.therapyDetailModel;
            if (state.loadingState == LoadingState.isInitial) {
              // faceokAppEvents.logViewContent(
              //   id: therapyDetail?.headline,
              //   type: 'product',
              // );
              // setDefaultValue();
            }
            return Stack(
              children: [
                GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: Scaffold(
                      backgroundColor: AppColors.offWhite,
                      // appBar: AppBar(
                      //   title: Text(therapyDetail?.headline ?? ''),
                      // title: GetLocationWidget(),
                      // leadingWidth: 22,
                      // leading:
                      //     IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back_rounded, color: AppColors.darkGray)),
                      // ),
                      body: therapyDetail != null
                          ? SafeArea(
                              child: Stack(
                                children: [
                                  SingleChildScrollView(
                                    controller: scrollController,
                                    child: Column(children: [
                                      SizedBox(height: 25),
                                      _photoWidget(therapyDetail),
                                      _widgetNameAndPriceWidget(
                                          therapyDetail, state),
                                      LineDividerWidget(),
                                      // if (state.isBookingAvailable)
                                      Container(
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            _serviceTypeInfoWidget(
                                                therapyDetail, state),
                                            _sessionSelectionWidget(
                                                therapyDetail, state),
                                          ],
                                        ),
                                      ),

                                      state.isRequireConsultation
                                          ? Container()
                                          : LineDividerWidget(),
                                      // LineDividerWidget(),
                                      // _selectTherapyWidget(therapyDetail, state),
                                      LineDividerWidget(),
                                      if ((therapyDetail.pricingOptions[index]
                                              .offers?.isNotEmpty ??
                                          false)) ...[
                                        Container(
                                          color: Colors.white,
                                          child: ListView.builder(
                                            primary: false,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: therapyDetail
                                                .pricingOptions[index]
                                                .offers
                                                ?.length,
                                            itemBuilder: (context, i) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 2.0),
                                                child: BulletPoint(
                                                    text: therapyDetail
                                                            .pricingOptions[
                                                                index]
                                                            .offers?[i] ??
                                                        ""),
                                              );
                                            },
                                          ),
                                        )
                                      ],

                                      LineDividerWidget(),
                                      _durationSelectionWidget(
                                          therapyDetail, state),
                                      LineDividerWidget(),
                                      _serviceTypeSelectionWidget(
                                          therapyDetail, state),
                                      LineDividerWidget(),
                                      _descriptionWidget(therapyDetail),
                                      LineDividerWidget(),
                                      _howIsItDoneWidget(therapyDetail),
                                      LineDividerWidget(),
                                      _benefitsWidget(therapyDetail),
                                      LineDividerWidget(),
                                      _contraindicationsWidget(therapyDetail),
                                      LineDividerWidget(),
                                      _productUsed(therapyDetail),
                                      Container(
                                          color: Colors.white, height: 100)
                                    ]),
                                  ),
                                  Container(
                                    color: AppColors.offWhite,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          onChanged: (val) async {
                                            final result = await apiService
                                                .getPlaceAutocomplete(val);
                                            if (result != null &&
                                                result['predictions'] != null) {
                                              setState(() {
                                                suggestions = List<
                                                    String>.from(result[
                                                        'predictions']
                                                    .map((prediction) =>
                                                        prediction[
                                                            'description']));
                                              });
                                            }
                                          },
                                          onTap: () =>
                                              state.addressController.clear(),
                                          onTapOutside: (event) => state
                                                  .addressController
                                                  .text
                                                  .isEmpty
                                              ? state.addressController.text =
                                                  state.homeAddress ?? ''
                                              : null,
                                          controller: state.addressController,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.only(top: 15),
                                              hintText:
                                                  'Enter the Address for service',
                                              suffixIcon: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  IconButton(
                                                      padding: EdgeInsets.only(
                                                          right: 20, left: 10),
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                TherapyDetailBloc>()
                                                            .add(TherapyDetailEvent
                                                                .getLocation(
                                                                    setCurrent:
                                                                        true,
                                                                    setDefault:
                                                                        true));
                                                        context
                                                            .read<
                                                                TherapyDetailBloc>()
                                                            .add(TherapyDetailEvent
                                                                .getClinicDetails());
                                                      },
                                                      icon: Icon(
                                                        Icons.my_location,
                                                        color: Colors.black,
                                                      ))
                                                ],
                                              ),
                                              prefixIcon: IconButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  icon: Icon(
                                                      Icons.arrow_back_rounded,
                                                      color:
                                                          AppColors.darkGray))),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        if (suggestions.isNotEmpty)
                                          Container(
                                            height: 180,
                                            width: double.infinity,
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: AppColors.offWhite,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 4,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: suggestions
                                                    .map(
                                                        (suggestion) => InkWell(
                                                              onTap: () async {
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                                state.addressController
                                                                        .text =
                                                                    suggestion;
                                                                List<Location>
                                                                    locations =
                                                                    await locationFromAddress(state
                                                                        .addressController
                                                                        .text);
                                                                context.read<TherapyDetailBloc>().add(TherapyDetailEvent.setLatLong(
                                                                    locations
                                                                        .first
                                                                        .latitude,
                                                                    locations
                                                                        .first
                                                                        .longitude,
                                                                    suggestion));
                                                                GetIt.I.get<AddressBloc>().add(AddressEvent.updateAddress(
                                                                    suggestion,
                                                                    locations
                                                                        .first
                                                                        .latitude,
                                                                    locations
                                                                        .first
                                                                        .longitude));
                                                                context
                                                                    .read<
                                                                        TherapyDetailBloc>()
                                                                    .add(TherapyDetailEvent
                                                                        .getClinicDetails());
                                                                setState(() {
                                                                  suggestions
                                                                      .clear();
                                                                });
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Text(
                                                                  suggestion,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                              ),
                                                            ))
                                                    .toList(),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container()),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: _bottomConsultationButtonWidget(state),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: _bottomBookingButtonWidget(state),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 12,
                  child: _continueWidget(state),
                ),
                LoadingWidget(loadingState: state.loadingState)
              ],
            );
          }),
    );
  }

  final apiService = ApiService();
  List<String> suggestions = [];

  CachedNetworkImage _photoWidget(TherapyDetailModel therapyDetail) {
    return CachedNetworkImage(
      imageUrl: therapyDetail.imageUrl,
      progressIndicatorBuilder: (ctx, url, downloadProgess) {
        return Center(
            child: CircularProgressIndicator(color: AppColors.darkYellow));
      },
      width: double.infinity,
      fit: BoxFit.fill,
      height: 250,
    );
  }

  Widget _widgetNameAndPriceWidget(
      TherapyDetailModel therapyDetail, TherapyDetailState state) {
    var pricingOption = state.selectedPricingOption ?? state.initPricingOption;
    if (pricingOption == null) return Container();
    double oldPrice = state.serviceType == ServiceType.Full
        ? pricingOption.oldPrice
        : pricingOption.oldPriceHalfBody;
    if (widget.arguments.therapyTitle.contains("jeevottama-ayurvedic")) {
      final updatedValues = _getJevottamaOptionsPrice(state);

      oldPrice = updatedValues.first;
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12, 18, 12, 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${therapyDetail.name}',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.darkGray,
                        fontWeight: FontWeight.bold,
                        height: 1.2)),
                SizedBox(height: 14),
                Text(therapyDetail.englishName ?? '',
                    style: TextStyle(
                        fontSize: 12, color: AppColors.darkGray, height: 1.3))
              ],
            ),
          ),
          SizedBox(width: 6),
        ],
      ),
    );
  }

  Widget _serviceTypeInfoWidget(
      TherapyDetailModel therapyDetail, TherapyDetailState state) {
    // var pricingOption = state.initPricingOption!;
    // var pricingOption = state.selectedPricingOption ?? state.initPricingOption!;
    // var durationOptions = state.selectedDurationIndex;
    // print("------->>> ${state.serviceType}");
    // double oldPrice = state.serviceType == ServiceType.Full ? pricingOption.oldPrice : pricingOption.oldPriceHalfBody;
    // if (widget.arguments.therapyTitle.contains("jeevottama-ayurvedic")) {
    //   final updatedValues = _getJevottamaOptionsPrice(state);
    //
    //   oldPrice = updatedValues.first;
    // }

    String
        priceString = /*state.categoryTitle == "panchakarma-therapies"
        ? (state.serviceTypeText == 'Detox Medicine Kit'
            ? "${state.therapyDetailModel?.pricePerSessionDetoxMassageExclusive?.toInt()}"
            : "${state.therapyDetailModel?.pricePerSessionDetoxMassageInclusive?.toInt()}")
        :*/
        "${state.totalPrice?.toInt()}";
    log("total price ::${state.totalPrice}");
    // Widget normalSessionInfo = state.servicePart != ServicePart.None
    //     ? Container()
    //     :
    Widget normalSessionInfo = Text(
        '${Constant.formatCurrency(priceString.toString())}',
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.darkYellow));
    // TextWidget(text: '₹$priceString', fontSize: 22, height: 30, fontWeight: Constant.fontMedium, textColor: AppColors.darkYellow);
    String partService = '';
    String fullService = '';
    int? partSessionDuration;
    int? fullSessionDuration;
    if (state.servicePart == ServicePart.Body) {
      partService = 'Half Body';
      fullService = 'Full Body';
      partSessionDuration = therapyDetail.sessionDurationInMinHalfBody;
      fullSessionDuration = therapyDetail.sessionDurationInMinFullBody;
    } else if (state.servicePart == ServicePart.Knee) {
      partService = 'One Knee';
      fullService = 'Two Knees';
      partSessionDuration = therapyDetail.sessionDurationInMin;
      fullSessionDuration = therapyDetail.sessionDurationInMin;
    }

    log("NORMAL SESSION INFO $normalSessionInfo");
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12, 18, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          normalSessionInfo /*serviceSessionInfo*/
        ],
      ),
    );
  }

  Widget _sessionSelectionWidget(
      TherapyDetailModel therapyDetail, TherapyDetailState state) {
    bool isFirst = therapyDetail.sessionOptions[index] ==
        therapyDetail.sessionOptions.first;
    bool isLast = therapyDetail.sessionOptions[index] ==
        therapyDetail.sessionOptions.last;
    if (state.isRequireConsultation) {
      return Container();
    }

    return FittedBox(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(0, 18, 16, 18),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Container(
            height: 35,
            width: 35,
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: isFirst ? AppColors.grayLight : AppColors.darkBlue,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              shape: BoxShape.rectangle,
            ),
            child: IconButton(
                onPressed: () {
                  if (therapyDetail.sessionOptions[index] >
                      therapyDetail.sessionOptions.first) {
                    index--;
                    context
                        .read<TherapyDetailBloc>()
                        .add(TherapyDetailEvent.selectOption(index));
                    context
                        .read<TherapyDetailBloc>()
                        .add(TherapyDetailEvent.getClinicDetails());
                  }
                },
                icon: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 20,
                )),
          ),
          Container(
            height: 35,
            width: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                shape: BoxShape.rectangle,
                border: Border.all(color: AppColors.darkBlue, width: 2),
                color: Colors.white),
            child: TextWidget(
                text: therapyDetail.sessionOptions[index].toString(),
                fontSize: 18,
                height: 22,
                fontWeight: FontWeight.bold,
                textColor: AppColors.darkBlue),
          ),
          Container(
            height: 35,
            width: 35,
            margin: EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              color: isLast ? AppColors.grayLight : AppColors.darkBlue,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              shape: BoxShape.rectangle,
            ),
            child: IconButton(
                onPressed: isLast
                    ? () {}
                    : () async {
                        if (therapyDetail.sessionOptions[index] !=
                            therapyDetail.sessionOptions.last) index++;
                        context
                            .read<TherapyDetailBloc>()
                            .add(TherapyDetailEvent.selectOption(index));
                        context
                            .read<TherapyDetailBloc>()
                            .add(TherapyDetailEvent.getClinicDetails());
                      },
                icon: Icon(Icons.add, color: Colors.white, size: 20)),
          )
        ]),
      ),
    );
  }

  Widget _selectTherapyWidget(
      TherapyDetailModel therapyDetail, TherapyDetailState state) {
    if (state.isRequireConsultation) {
      return Container();
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 18, 0, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/ic_select_session.svg',
                    width: 48, height: 48),
                SizedBox(width: 12),
                TextWidget(
                    text: 'Where do you want to take this therapy?',
                    fontSize: 14,
                    height: 19,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.darkBlue),
                Spacer(),
              ],
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 12, right: 12),
              itemCount: ["Ayursh Centre", "Home Visit"].length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  dense: true,
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Theme(
                          data: ThemeData(
                              unselectedWidgetColor: AppColors.darkGray),
                          child: Radio(
                            activeColor: AppColors.darkBlue,
                            value: index,
                            groupValue: selectedRadioValue,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              String type =
                                  value == 0 ? "home-visit" : "home-visit";
                              selectedRadioValue = value;
                              print('------->>> ${value}');
                              print(
                                  '------->>> ${therapyDetail.sessionOptions[state.selectedOptionIndex ?? 0]}');
                              context.read<TherapyDetailBloc>().add(
                                  TherapyDetailEvent.setTherapyPlace(value == 0
                                      ? "home-visit"
                                      : "home-visit"));
                              context
                                  .read<TherapyDetailBloc>()
                                  .add(TherapyDetailEvent.getClinicDetails());
                            },
                          ),
                        ),
                      ),
                      RichText(
                          text: TextSpan(
                              text: '${["Ayursh Centre", "Home Visit"][index]}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkBlue),
                              children: [
                            TextSpan(
                              text: '${[
                                "\nYou will visit nearest Centre (${state.finderResponse?.data?.locations?[0].distance?.toStringAsFixed(1)} Km)",
                                "\nTherapist will visit your home"
                              ][index]}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.darkGray),
                            )
                          ])),
                      // Wrap(
                      //   crossAxisAlignment: WrapCrossAlignment.start,
                      //   runAlignment: WrapAlignment.start,
                      //   alignment: WrapAlignment.start,
                      //   children: [
                      //     TextWidget(
                      //         text: '${["Ayursh Centre :", "Home Visit :"][index]}',
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.bold,
                      //         textColor: AppColors.darkBlue),
                      //     TextWidget(
                      //       text: '${[
                      //         "\nYou will visit nearest Centre (${state.finderResponse?.data?.locations?[0].distance} Km)",
                      //         " Therapist will visit your home"
                      //       ][index]}',
                      //       fontSize: 14,
                      //       textColor: AppColors.darkGray,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _durationSelectionWidget(
      TherapyDetailModel therapyDetail, TherapyDetailState state) {
    if (state.isRequireConsultation) {
      return Container();
    }

    if (!widget.arguments.therapyTitle.contains("jeevottama-ayurvedic")) {
      return Container();
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/ic_select_therapy.svg',
                    width: 48, height: 48),
                SizedBox(width: 12),
                TextWidget(
                    text: 'Select Duration',
                    fontSize: 14,
                    height: 19,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.darkBlue)
              ],
            ),
          ),
          SizedBox(height: 14),
          Container(
            height: 36,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 12, right: 12),
              scrollDirection: Axis.horizontal,
              itemCount: durations.length,
              itemBuilder: (ctx, index) {
                return _durationWidget(
                    therapyDetail,
                    index,
                    index == state.selectedDurationIndex,
                    index == durations.length - 1,
                    state);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _sessionWidget(TherapyDetailModel therapyDetail, int index,
      bool isSelected, bool isLast) {
    int quantity = therapyDetail.sessionOptions[index];

    var sessionText = quantity == 1 ? '1 Session' : '$quantity Sessions';

    return InkWell(
      onTap: () {
        context
            .read<TherapyDetailBloc>()
            .add(TherapyDetailEvent.selectOption(index));
      },
      child: Padding(
        padding: EdgeInsets.only(right: isLast == false ? 12 : 0),
        child: Container(
          width: 100,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              shape: BoxShape.rectangle,
              border: Border.all(color: AppColors.darkBlue),
              color: isSelected ? AppColors.darkBlue : Colors.white),
          child: Center(
            child: TextWidget(
              text: sessionText,
              fontSize: 12,
              height: 16,
              textColor: isSelected ? Colors.white : AppColors.darkBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _durationWidget(TherapyDetailModel therapyDetail, int index,
      bool isSelected, bool isLast, TherapyDetailState state) {
    int duration = durations[index];

    // var durationText = duration == 60 ? '1 Session' : '$quantity Sessions';

    return InkWell(
      onTap: () {
        context
            .read<TherapyDetailBloc>()
            .add(TherapyDetailEvent.selectDuration(index));
        print('------->>> ${durations[index]}-minutes');
        context
            .read<TherapyDetailBloc>()
            .add(TherapyDetailEvent.getClinicDetails());
      },
      child: Padding(
        padding: EdgeInsets.only(right: isLast == false ? 12 : 0),
        child: Container(
          width: 100,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              shape: BoxShape.rectangle,
              border: Border.all(color: AppColors.darkBlue),
              color: isSelected ? AppColors.darkBlue : Colors.white),
          child: Center(
            child: TextWidget(
              text: "$duration minutes",
              fontSize: 12,
              height: 16,
              textColor: isSelected ? Colors.white : AppColors.darkBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _serviceTypeSelectionWidget(
      TherapyDetailModel therapyDetail, TherapyDetailState state) {
    if (state.servicePart == ServicePart.None) {
      return Container();
    }
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/ic_select_therapy.svg',
                    width: 48, height: 48),
                SizedBox(width: 12),
                TextWidget(
                    text: 'Select Required Therapy',
                    fontSize: 14,
                    height: 19,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.darkBlue)
              ],
            ),
          ),
          SizedBox(height: 14),
          Container(
            height: 36,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 12, right: 12),
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (ctx, index) {
                return _serviceTypeWidget(state, index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _serviceTypeWidget(TherapyDetailState state, int index) {
    bool isSelected = false;
    var serviceTypeText = '';
    if (index == 0 && state.serviceType == ServiceType.Part) {
      isSelected = true;
    }
    if (index == 1 && state.serviceType == ServiceType.Full) {
      isSelected = true;
    }
    if (index == 0 && state.serviceType == ServiceType.Baby) {
      isSelected = true;
    }

    if (index == 0 && state.serviceType == ServiceType.Massage) {
      isSelected = true;
      // print("IS SELECTED ::$isSelected");
    }
    if (state.servicePart == ServicePart.Body) {
      if (index == 0) {
        serviceTypeText = 'Half Body';
      } else {
        serviceTypeText = 'Full Body';
      }
    } else if (state.servicePart == ServicePart.Baby) {
      if (index == 0) {
        serviceTypeText = 'Excluding Baby';
      } else {
        serviceTypeText = 'Including Baby';
      }
    } else if (state.servicePart == ServicePart.Massage) {
      if (index == 0) {
        serviceTypeText = 'Detox Medicine Kit';
      } else {
        serviceTypeText = 'Detox Kit With 3 Abhyanga Massages';
      }
    } else {
      if (index == 0) {
        serviceTypeText = 'One Knee';
      } else {
        serviceTypeText = 'Two Knees';
      }
    }
    return InkWell(
      onTap: () {
        if (isSelected) {
          return;
        }
        context
            .read<TherapyDetailBloc>()
            .add(TherapyDetailEvent.selectServiceType(
                serviceType: index == 0
                    ? ServiceType.Part
                    : index == 1
                        ? ServiceType.Full
                        : ServiceType.Baby,
                selectedServiceTypeText: serviceTypeText));
        context
            .read<TherapyDetailBloc>()
            .add(TherapyDetailEvent.getClinicDetails());
      },
      child: Padding(
        padding: EdgeInsets.only(right: 12),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              shape: BoxShape.rectangle,
              border: Border.all(color: AppColors.darkBlue),
              color: isSelected ? AppColors.darkBlue : Colors.white),
          child: Center(
            child: TextWidget(
              text: serviceTypeText == "Excluding Baby"
                  ? "Mother massage Only"
                  : serviceTypeText == "Including Baby"
                      ? "Mother & Baby Massage and Bath"
                      : serviceTypeText,
              fontSize: 12,
              height: 16,
              textColor: isSelected ? Colors.white : AppColors.darkBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _descriptionWidget(TherapyDetailModel detailModel) {
    if (detailModel.therapyDescription == null ||
        detailModel.therapyDescription!.descriptions.isEmpty) {
      return Container();
    }
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12, 4, 12, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: detailModel.therapyDescription!.descriptions
            .map((description) => Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(description.replaceAll("<br/>", ''),
                      style: TextStyle(color: AppColors.darkGray, height: 1.4)),
                ))
            .toList(),
      ),
    );
  }

  Widget _howIsItDoneWidget(TherapyDetailModel therapyDetail) {
    if (therapyDetail.howItIsDone == null ||
        therapyDetail.howItIsDone!.isEmpty) {
      return Container();
    }
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/ic_how_it_done.svg',
                    width: 48, height: 48),
                SizedBox(width: 12),
                TextWidget(
                    text: 'How is it done?',
                    fontSize: 14,
                    height: 19,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.darkBlue)
              ],
            ),
          ),
          SizedBox(height: 4),
          Container(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 12, right: 12),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: therapyDetail.howItIsDone!.length,
              itemBuilder: (ctx, index) {
                return _benefitWidget(therapyDetail.howItIsDone![index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _benefitsWidget(TherapyDetailModel therapyDetail) {
    if (therapyDetail.benefits == null || therapyDetail.benefits!.isEmpty) {
      return Container();
    }
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/ic_benefits.svg',
                    width: 48, height: 48),
                SizedBox(width: 12),
                TextWidget(
                    text: 'Benefits',
                    fontSize: 14,
                    height: 19,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.darkBlue)
              ],
            ),
          ),
          SizedBox(height: 4),
          Container(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 12, right: 12),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: therapyDetail.benefits!.length,
              itemBuilder: (ctx, index) {
                return _benefitWidget(therapyDetail.benefits![index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _benefitWidget(String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(Icons.arrow_forward_ios_rounded,
                size: 12, color: AppColors.darkYellow),
          ),
          SizedBox(width: 8),
          Expanded(
              child: Text(content,
                  style: TextStyle(color: AppColors.darkBlue, height: 1.3)))
        ],
      ),
    );
  }

  Widget _contraindicationsWidget(TherapyDetailModel therapyDetail) {
    if (therapyDetail.contraindications == null ||
        therapyDetail.contraindications!.isEmpty) {
      return Container();
    }
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12, 18, 12, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/ic_contraindications.svg',
                  width: 48, height: 48),
              SizedBox(width: 12),
              TextWidget(
                  text: 'Contraindications',
                  fontSize: 14,
                  height: 19,
                  fontWeight: FontWeight.bold,
                  textColor: AppColors.darkBlue)
            ],
          ),
          SizedBox(height: 15),
          Container(
              child: Wrap(
                  spacing: 12, // gap between adjacent chips
                  runSpacing: 12, // gap between lines
                  children: therapyDetail.contraindications!
                      .map((content) => _contraindicationWidget(content))
                      .toList()))
        ],
      ),
    );
  }

  Widget _contraindicationWidget(String content) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          shape: BoxShape.rectangle,
          color: AppColors.dividerColor.withOpacity(0.7)),
      child: Text(
        content,
        style: TextStyle(
            fontSize: 14,
            height: 1.3,
            color: AppColors.darkGray,
            fontWeight: Constant.fontMedium),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _productUsed(TherapyDetailModel therapyDetail) {
    if (therapyDetail.products == null || therapyDetail.products!.isEmpty) {
      return Container();
    }
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12, 18, 12, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidget(
              text: 'Products Used',
              fontSize: 14,
              height: 19,
              fontWeight: FontWeight.bold,
              textColor: AppColors.darkBlue),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.6,
                mainAxisSpacing: 0,
                crossAxisSpacing: 12),
            itemCount: therapyDetail.products!.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                  alignment: Alignment.center,
                  child: ProductWidget(therapyDetail.products![index]));
            },
            padding: EdgeInsets.only(top: 16),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
          )
        ],
      ),
    );
  }

  Widget _bottomConsultationButtonWidget(TherapyDetailState state) {
    if (!state.isRequireConsultation) {
      return Container();
    }
    return Container(
      width: 200,
      padding: EdgeInsets.only(bottom: 22, left: 32, right: 32, top: 24),
      child: PrimaryButtonWidget(
          title: 'Consult Doctor',
          onTap: () {
            var pricingOption = state.initPricingOption;
            if (pricingOption == null) return;
            double offerPrice = state.serviceType == ServiceType.Full
                ? pricingOption.offerPrice
                : pricingOption.offerPriceHalfBody;
            int? sessionDurationInMin;
            if (state.servicePart == ServicePart.Body) {
              if (state.serviceType == ServiceType.Part) {
                sessionDurationInMin =
                    state.therapyDetailModel?.sessionDurationInMinHalfBody;
              } else {
                sessionDurationInMin =
                    state.therapyDetailModel?.sessionDurationInMinFullBody;
              }
            } else {
              sessionDurationInMin =
                  state.therapyDetailModel?.sessionDurationInMin;
            }

            if (widget.arguments.therapyTitle
                .contains("jeevottama-ayurvedic")) {
              sessionDurationInMin =
                  durations[state.selectedDurationIndex ?? 0];
            }

            Navigator.of(context).pushNamed(DoctorListScreen.routName,
                arguments: DoctorListArguments(
                    sessionSelectedInfo: SessionSelectedInfo(
                        pricingOption.count.toString(),
                        (offerPrice / pricingOption.count).toString(),
                        sessionDurationInMin)));
          }),
    );
  }

  Widget _bottomBookingButtonWidget(TherapyDetailState state) {
    if (state.isRequireConsultation) {
      return Container();
    }
    return state.isBooking == false
        ? Material(
            child: Container(
              width: 200,
              padding:
                  EdgeInsets.only(bottom: 22, left: 32, right: 32, top: 18),
              child: Column(
                children: [
                  if (!state.isBookingAvailable)
                    Text(
                      "Our service is not available at your location. Please change the location in the search bar",
                      style: TextStyle(color: Colors.red),
                    ),
                  SizedBox(height: 10),
                  PrimaryButtonWidget(
                      title: 'Book',
                      isEnable: state.isBookingAvailable,
                      onTap: () {
                        // facebookAppEvents.logAddToCart(
                        //   id: '1',
                        //   type: 'Session',
                        //   price: state.initPricingOption!.offerPrice.toDouble(),
                        //   currency: 'INR',
                        // );
                        if (state.canBeBooked) {
                          context
                              .read<TherapyDetailBloc>()
                              .add(TherapyDetailEvent.startBooking());
                        } else {
                          _showCanNotBookDialog(context);
                        }
                      }),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("By Continuing, I Agree to "),
                      InkWell(
                        onTap: () {
                          context.read<TermsAndConditionsBloc>().add(
                              TermsAndConditionsEvent.initialize(
                                  therapyType:
                                      state.therapyDetailModel!.category));
                          _showTnCsPopup();
                        },
                        child: Text("Terms and Conditions",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.darkYellow,
                                    )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        : Container();
  }

  _showTnCsPopup() {
    // var valueStyle = TextStyle(fontSize: 14, color: AppColors.darkGray);
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return BlocBuilder<TermsAndConditionsBloc, TermsAndConditionsState>(
            builder: (context, state) {
              return Dialog(
                insetPadding: EdgeInsets.symmetric(horizontal: 24),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)), //this right here
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: Column(
                    children: [
                      Container(
                        color: AppColors.darkYellow,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Row(
                          children: [
                            Text("Terms & Conditions",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.cancel_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: state.loadingState != LoadingState.isCompleted
                              ? Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.darkYellow),
                                )
                              : SingleChildScrollView(
                                  padding: EdgeInsets.only(top: 4, bottom: 40),
                                  child: Column(
                                    children: state.contents!
                                        .map((content) =>
                                            _contentWidget(content))
                                        .toList(),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  Widget _contentWidget(String content) {
    return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.darkBlue,
                  )),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(content,
                  style: TextStyle(color: AppColors.darkGray, height: 1.3)),
            )
          ],
        ));
  }

  Widget _continueWidget(TherapyDetailState state) {
    if (state.isRequireConsultation || !state.isBooking) {
      return Container();
    }

    var pricingOption = state.selectedPricingOption ?? state.initPricingOption;
    if (pricingOption == null) return Container();

    double oldPrice = state.serviceType == ServiceType.Full
        ? pricingOption.oldPrice
        : pricingOption.oldPriceHalfBody;
    if (widget.arguments.therapyTitle.contains("jeevottama-ayurvedic")) {
      final updatedValues = _getJevottamaOptionsPrice(state);

      oldPrice = updatedValues.first;
    }

    String priceString = '${state.totalPrice?.toInt()}';

    String sessionText = '0 Session';
    double offerPrice;
    double totalAmount;
    double totalAmountOfSessions;
    double serviceCharge;
    if (state.serviceType == ServiceType.Full) {
      offerPrice = pricingOption.oldPrice;
      totalAmount = pricingOption.total;
      totalAmountOfSessions = pricingOption.offerPrice;
      serviceCharge = pricingOption.serviceCharge;
    } else {
      offerPrice = pricingOption.oldPriceHalfBody;
      totalAmount = pricingOption.totalHalfBody;
      totalAmountOfSessions = pricingOption.offerPriceHalfBody;
      serviceCharge = pricingOption.serviceChargeHalfBody;
    }

    if (widget.arguments.therapyTitle.contains("jeevottama-ayurvedic")) {
      final updatedValues = _getJevottamaOptionsPrice(state);
      offerPrice = updatedValues[1];

      /// FIX HERE FOR TOTAL PRICE, NOT COMING IN API
      totalAmount = updatedValues[1];
      totalAmountOfSessions = updatedValues[1];
    }

    double travelExpense = pricingOption.travelExpense;
    var doctorBookingId = widget.arguments.doctorBookingId;
    var consultationBookingId = widget.arguments.consultationBookingId;
    var bookingUser = widget.arguments.bookingUser;
    var checkoutDescription = state.therapyDetailModel!.checkoutDescription;
    var therapyHeadline = state.therapyDetailModel!.headline;
    String therapyTitle = state.therapyDetailModel!.title;
    String therapyImage = state.therapyDetailModel!.imageUrl;
    String categoryTitle = state.categoryTitle ?? '';

    sessionText =
        '${state.therapyDetailModel?.sessionOptions[state.selectedOptionIndex ?? 0]} ${state.therapyDetailModel?.sessionOptions[state.selectedOptionIndex ?? 0] == 1 ? 'Session' : 'Sessions'}';

    return GestureDetector(
      onTap: () {
        if (!state.isBookingAvailable) {
          return;
        }
        var therapyBookingInfo = TherapyBookingInfo(
            SessionSelectedInfo(
              (state.therapyDetailModel
                      ?.sessionOptions[state.selectedOptionIndex ?? 0])
                  .toString(),
              pricePerSession(state).toString(),
              sessionDurationInMin(state),
            ),
            totalAmount,
            (state.finderResponse?.data?.locations?[0].therapyDetails?[0]
                        .totalAmount ??
                    0)
                .toDouble(),
            serviceCharge,
            travelExpense,
            therapyHeadline,
            therapyTitle,
            therapyImage,
            categoryTitle,
            state.therapyPlace,
            doctorBookingId,
            consultationBookingId,
            bookingUser,
            checkoutDescription,
            state.therapyPlace == 'home-visit'
                ? state.homeAddress
                : state.clinicAddress,
            [],
            state.finderResponse,
            state.serviceTypeText,
            state.therapyDuration,
            state.serviceType,
            state.servicePart);
        print(therapyBookingInfo.toJson());
        //TODO: Check if we need to add isRequireConsultation condition here
        if (consultationBookingId == null || consultationBookingId.isEmpty) {
          print("duration selected -  ${therapyBookingInfo.totalAmount}");
          // Navigator.of(context).pushNamed(BookingUserTherapyScreen.routName,
          // arguments: BookingUserTherapyArguments(therapyBookingInfo));

          Navigator.of(context).pushNamed(FrequentlyAddedScreen.routName,
              arguments: FrequentlyAddedArgs(
                  therapyBookingInfo: therapyBookingInfo,
                  therapyDetails: state.therapyDetailModel!,
                  therapyDetailState: state));
        } else {
          // Navigator.of(context).pushNamed(TermsAndConditionsScreen.routName,
          //     arguments: TermsAndConditionsArguments(therapyBookingInfo));
        }
      },
      child: Material(
        child: Column(
          children: [
            if (!state.isBookingAvailable)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                    .copyWith(top: 12),
                child: Text(
                  "Our service is not available at your location. Please change the location in the search bar",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 5),
            Container(
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.only(left: 12, right: 12),
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: state.isBookingAvailable
                    ? AppColors.darkYellow
                    : AppColors.grayLight,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(sessionText,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: Constant.fontMedium)),
                      SizedBox(height: 6),
                      if (state.isBookingAvailable)
                        Text(Constant.formatCurrency(priceString.toString()),
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: Constant.fontMedium))
                    ],
                  ),
                  Expanded(child: Container()),
                  Text('Continue',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ],
        ),
      ),
    );
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

  int sessionDurationInMin(TherapyDetailState state) {
    int sessionDurationInMin = 0;
    if (state.servicePart == ServicePart.Body) {
      if (state.serviceType == ServiceType.Part) {
        sessionDurationInMin =
            state.therapyDetailModel?.sessionDurationInMinHalfBody ?? 0;
      } else {
        sessionDurationInMin =
            state.therapyDetailModel?.sessionDurationInMinFullBody ?? 0;
      }
    } else {
      sessionDurationInMin =
          state.therapyDetailModel?.sessionDurationInMin ?? 0;
    }

    if (widget.arguments.therapyTitle.contains("jeevottama-ayurvedic")) {
      sessionDurationInMin = durations[state.selectedDurationIndex ?? 0];
    }

    return sessionDurationInMin;
  }

  double pricePerSession(TherapyDetailState state) {
    // double pricePerSession = state.serviceType == ServiceType.Full
    //     ? state.selectedPricingOption!.oldPrice / state.selectedPricingOption!.count
    //     : state.selectedPricingOption!.oldPriceHalfBody / state.selectedPricingOption!.count;
    return 0;
  }

  void _showCanNotBookDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    Text(
                        'This facility is not available as of now. Please visit us later.',
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.darkGray,
                            height: 1.4),
                        textAlign: TextAlign.center),
                    SizedBox(height: 32),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: PrimaryButtonWidget(
                          title: 'Close',
                          height: 38,
                          onTap: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                    SizedBox(height: 12)
                  ],
                ),
              ),
            ),
          );
        });
  }

  List<double> _getJevottamaOptionsPrice(
    TherapyDetailState state,
  ) {
    // ONLY CALL THIS METHOD WHEN THERAPY IS  -- jeevottama-ayurvedic

    final pricingOption =
        state.selectedPricingOption ?? state.initPricingOption;
    if (pricingOption == null) return [0.0, 0.0, 0.0];
    late double oldPrice = 0;
    late double youSave = 0;
    late double offerPrice = 0;

    final _d = state.selectedDurationIndex ?? 0;

    switch (_d) {
      case 0:
        oldPrice = pricingOption.oldPriceOption1;
        offerPrice = pricingOption.offerPriceOption1;
        youSave = pricingOption.youSaveOption1;
        break;
      case 1:
        oldPrice = pricingOption.oldPriceOption2;
        offerPrice = pricingOption.offerPriceOption2;
        youSave = pricingOption.youSaveOption2;
        break;
      case 2:
        oldPrice = pricingOption.oldPriceOption3;
        offerPrice = pricingOption.offerPriceOption3;
        youSave = pricingOption.youSaveOption2;
        break;
    }

    return [oldPrice, offerPrice, youSave];
  }

// double _getJevottamaTotal(
//   TherapyDetailState state,
// ) {
//   // ONLY CALL THIS METHOD WHEN THERAPY IS  -- jeevottama-ayurvedic

//   final pricingOption =
//       state.selectedPricingOption ?? state.initPricingOption!;
//   late double totalPrice = 0;

//   final _d = state.selectedDurationIndex ?? 2;

//   switch (_d) {
//     case 0:
//       totalPrice = pricingOption.offerPriceOption1;
//       break;
//     case 1:
//       totalPrice = pricingOption.offerPriceOption2;
//       break;
//     case 2:
//       totalPrice = pricingOption.offerPriceOption3;
//       break;
//   }

//   return totalPrice;
// }
}
