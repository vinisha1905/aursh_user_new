import 'package:ayursh/application/book_therapy_time/book_therapy_time_bloc.dart';
import 'package:ayursh/domain/model/business/address_info.dart';
import 'package:ayursh/domain/model/business/booked_therapy_info.dart';
import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:ayursh/domain/model/business/therapy_booking_info.dart';
import 'package:ayursh/presentation/book_therapy_time/widget/date_widget.dart';
import 'package:ayursh/presentation/book_therapy_time/widget/therapist_info_section.dart';
import 'package:ayursh/presentation/book_therapy_time/widget/time_slot_widget.dart';
import 'package:ayursh/presentation/main/main_screen.dart';
import 'package:ayursh/presentation/therapy_checkout/therapy_checkout_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/dialog_address_widget.dart';
import 'package:ayursh/presentation/widget/line_divider_widget.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../main.dart';

class BookTherapyTimeArguments {
  //case book new
  final TherapyBookingInfo? therapyBookingInfo;

  //case book next
  final BookedTherapyInfo? bookedTherapy;

  //reschedule booking
  final bool rescheduleBooking;

  const BookTherapyTimeArguments(
      {this.therapyBookingInfo,
      this.bookedTherapy,
      this.rescheduleBooking = false});
}

class BookTherapyTimeScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/book_therapy_time';
  final BookTherapyTimeArguments arguments;

  const BookTherapyTimeScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  BookTherapyTimeScreenState createState() {
    return BookTherapyTimeScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<BookTherapyTimeBloc>()
        ..add(BookTherapyTimeEvent.initialize(
            arguments.therapyBookingInfo, arguments.bookedTherapy))
        ..add(BookTherapyTimeEvent.getSlots()),
      child: this,
    );
  }
}

class BookTherapyTimeScreenState extends State<BookTherapyTimeScreen> {
  late TextEditingController _flatNoBuildingController;
  late TextEditingController _localityAreaController;
  late TextEditingController _landmarkController;
  late TextEditingController _cityController;
  var val;

  @override
  void initState() {
    super.initState();
    _flatNoBuildingController = TextEditingController();
    _localityAreaController = TextEditingController();
    _landmarkController = TextEditingController();
    _cityController = TextEditingController();
  }

  @override
  void dispose() {
    _flatNoBuildingController.dispose();
    _localityAreaController.dispose();
    _landmarkController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<BookTherapyTimeBloc, BookTherapyTimeState>(
        listener: (ctx, state) {
          if (state.error != null) {
            Constant.showError(state.error ?? '');
            context
                .read<BookTherapyTimeBloc>()
                .add(BookTherapyTimeEvent.resetError());
          }
          if (state.isBookNextSuccess == true) {
            Navigator.pop(context, true);
          }
          //Check and navigate back until My Bookings Tab Page on successful rescheduling
          if (state.rescheduledBookingSuccess == true) {
            Navigator.popUntil(
                context,
                ModalRoute.withName(
                  MainScreen.routName,
                ));
          }
        },
        builder: (ctx, state) {
          var sessionNo = '1st Session';
          if (state.bookedTherapyInfo != null) {
            var recentSession =
                state.bookedTherapyInfo!.bookedTherapyModel.recentSession;
            switch (recentSession) {
              case 1:
                {
                  sessionNo = '2nd Session';
                  break;
                }
              case 2:
                {
                  sessionNo = '3rd Session';
                  break;
                }
              default:
                {
                  sessionNo = '${recentSession + 1}th Session';
                }
            }
          }
          return Stack(
            children: [
              Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: Text('Select Date & Time'),
                    leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back_rounded,
                            color: AppColors.darkGray)),
                  ),
                  body: state.dateSlots.isNotEmpty
                      ? SingleChildScrollView(
                          child: Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (widget.arguments.therapyBookingInfo
                                      ?.servicesOffered !=
                                  'in-clinic') ...[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16, top: 16, right: 16),
                                  child: GestureDetector(
                                    onTap: state.isBookNext == false
                                        ? () {
                                            _showAddAddressDialog(
                                                context, state);
                                          }
                                        : null,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: TextWidget(
                                              text: 'Address For Service',
                                              fontSize: 14,
                                              height: 19,
                                              textColor: AppColors.darkGray,
                                              fontWeight: Constant.fontMedium,
                                            )),
                                            state.isBookNext == false
                                                ? TextWidget(
                                                    text: 'Edit',
                                                    fontSize: 14,
                                                    height: 19,
                                                    textColor:
                                                        AppColors.darkYellow,
                                                    fontWeight:
                                                        Constant.fontMedium)
                                                : SizedBox.shrink()
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        state.isBookNext == true
                                            ? RichText(
                                                text: TextSpan(
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  height: 1.3,
                                                  color: AppColors.darkGray,
                                                ),
                                                text: '${widget.arguments.bookedTherapy!.bookedTherapyModel.addressFlatNoBuilding}'
                                                        .isNotEmpty
                                                    ? '${widget.arguments.bookedTherapy!.bookedTherapyModel.addressFlatNoBuilding}, '
                                                    : '',
                                                children: [
                                                  if ('${widget.arguments.bookedTherapy!.bookedTherapyModel.addressAreaLocality}'
                                                      .isNotEmpty)
                                                    TextSpan(
                                                        text:
                                                            '${widget.arguments.bookedTherapy!.bookedTherapyModel.addressAreaLocality}'),
                                                  if ('${widget.arguments.bookedTherapy!.bookedTherapyModel.addressLandmark}'
                                                      .isNotEmpty)
                                                    TextSpan(
                                                        text:
                                                            ', ${widget.arguments.bookedTherapy!.bookedTherapyModel.addressLandmark}'),
                                                  if ('${widget.arguments.bookedTherapy!.bookedTherapyModel.addressCity}'
                                                      .isNotEmpty)
                                                    TextSpan(
                                                        text:
                                                            ', ${widget.arguments.bookedTherapy!.bookedTherapyModel.addressCity}'),
                                                ],
                                              ))
                                            : Text(
                                                state.addressInfo != null &&
                                                        state
                                                            .addressInfo!
                                                            .localityArea
                                                            .isNotEmpty
                                                    ? '${state.addressInfo!.localityArea}'
                                                    : 'Select Location',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    height: 1.3,
                                                    color: AppColors.darkGray),
                                              ),
                                        SizedBox(height: 12),
                                        if (state.addressInfo!.flatNoBuilding
                                            .isNotEmpty)
                                          Text(
                                            'Flat No : ${state.addressInfo!.flatNoBuilding}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                height: 1.3,
                                                color: AppColors.darkGray),
                                          ),
                                        if (state.addressInfo!.flatNoBuilding
                                            .isNotEmpty)
                                          SizedBox(height: 4),
                                        if (state
                                            .addressInfo!.landMark.isNotEmpty)
                                          Text(
                                            'Landmark : ${state.addressInfo!.landMark}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                height: 1.3,
                                                color: AppColors.darkGray),
                                          ),
                                        SizedBox(height: 12),
                                      ],
                                    ),
                                  ),
                                ),
                                LineDividerWidget(height: 1)
                              ] else ...[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16, top: 12, right: 16, bottom: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  '${"\nYou will visit nearest Centre (${widget.arguments.therapyBookingInfo?.finderResponse?.data?.locations?[0].distance ?? 0} Km)"}',
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: AppColors.darkGray),
                                            )
                                          ])),
                                      // Row(
                                      //   crossAxisAlignment: CrossAxisAlignment.center,
                                      //   children: [
                                      //     TextWidget(
                                      //         text: 'Ayursh Centre :',
                                      //         fontSize: 14,
                                      //         height: 19,
                                      //         fontWeight: FontWeight.bold,
                                      //         textColor: AppColors.darkBlue),
                                      //     TextWidget(
                                      //         text:
                                      //             ' You will visit your nearest Centre (${widget.arguments.therapyBookingInfo?.finderResponse?.data?.locations?[0].distance ?? 0} KM)',
                                      //         fontSize: 14,
                                      //         height: 19,
                                      //         textColor: AppColors.darkGray),
                                      //   ],
                                      // ),
                                      SizedBox(height: 12),
                                      Text(
                                        'You will receive full address of Ayursh Centre post booking confirmation.',
                                        style: TextStyle(
                                            color: AppColors.darkGray,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                LineDividerWidget(height: 1)
                              ],
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 16, top: 5, right: 16, bottom: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: 'Select Date',
                                      fontSize: 14,
                                      height: 19,
                                      textColor: AppColors.darkGray,
                                      fontWeight: Constant.fontMedium,
                                    ),
                                    SizedBox(height: 16),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: [
                                  SizedBox(width: 16),
                                ]
                                      ..addAll(state.dateSlots
                                          .map((dateSlot) => DateWidget(
                                                  dateSlot,
                                                  dateSlot ==
                                                      state.selectedDateSlot,
                                                  dateSlot ==
                                                      state.dateSlots.last, () {
                                                context
                                                    .read<BookTherapyTimeBloc>()
                                                    .add(BookTherapyTimeEvent
                                                        .selectDateSlot(
                                                            dateSlot));
                                              }))
                                          .toList())
                                      ..add(SizedBox(width: 16))),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 16, top: 18, bottom: 18, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextWidget(
                                            text: state.selectedDateSlot != null
                                                ? '$sessionNo   ${state.selectedDateSlot!.date}'
                                                : 'Selected date shows here..',
                                            fontSize: 14,
                                            height: 19,
                                            textColor:
                                                state.selectedDateSlot != null
                                                    ? AppColors.darkGray
                                                    : Colors.grey.shade400)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              LineDividerWidget(height: 1),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 16, top: 12, right: 16, bottom: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: 'Select Time',
                                      fontSize: 14,
                                      height: 19,
                                      textColor: AppColors.darkGray,
                                      fontWeight: Constant.fontMedium,
                                    ),
                                    // SizedBox(height: 16),
                                    // Text('For multi-session bookings, our team will coordinate with you to schedule each subsequent sessions',
                                    //     style: TextStyle(fontSize: 12, height: 1.2, color: AppColors.darkGray)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 0, right: 16, bottom: 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _daySlotsWidget(
                                        state.selectedDateSlot?.slots ??
                                            state.initDateSlot?.slots ??
                                            [],
                                        state.selectedSlot),
                                  ],
                                ),
                              ),
                              Builder(
                                builder: (_) {
                                  final totalSession = widget
                                      .arguments
                                      .therapyBookingInfo
                                      ?.sessionSelectedInfo
                                      .totalSession;

                                  final terms = totalSession == '1'
                                      ? state.singleSessionTerms
                                      : state.multiSessionTerms;

                                  return Container(
                                    margin: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF3F3F3),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: TherapyInfoSection(
                                      items: terms,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ))
                      : Container()),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _bottomBottomWidget(state),
              ),
              LoadingWidget(loadingState: state.loadingState)
            ],
          );
        },
      ),
    );
  }

  Widget _daySlotsWidget(
      List<BookingSlotInfo>? slots, BookingSlotInfo? selectedSlot) {
    if (slots == null) {
      return Container();
    }
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = 40;
    final double itemWidth = (size.width - 32) / 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: itemWidth / itemHeight,
              crossAxisSpacing: 32,
              mainAxisSpacing: 18),
          itemCount: slots.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
                alignment: Alignment.center,
                child: TimeSlotWidget(
                    slots[index], slots[index] == selectedSlot, (newSlot) {
                  context
                      .read<BookTherapyTimeBloc>()
                      .add(BookTherapyTimeEvent.selectSlot(newSlot));
                }));
          },
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
        )
      ],
    );
  }

  Widget _bottomBottomWidget(BookTherapyTimeState state) {
    return Container(
      color: Colors.white,
      width: 200,
      padding: EdgeInsets.only(bottom: 22, left: 32, right: 32),
      child: PrimaryButtonWidget(
          title: state.isBookNext == true ? "Reschedule " : 'Checkout',
          onTap: () {
            if (state.therapyBookingInfo?.servicesOffered != 'in-clinic' &&
                (state.addressInfo == null ||
                    state.addressInfo?.flatNoBuilding == null ||
                    state.addressInfo!.flatNoBuilding.isEmpty ||
                    state.addressInfo?.landMark == null ||
                    state.addressInfo!.landMark.isEmpty ||
                    state.addressInfo?.localityArea == null ||
                    state.addressInfo!.localityArea.isEmpty)) {
              _showAddAddressDialog(context, state);
              Constant.showError(
                  'Please fill the complete address, landmark, locality');
              return;
            } else if (state.selectedDateSlot == null &&
                state.selectedSlot == null) {
              Constant.showError('Please select date and time');
              return;
            } else if (state.selectedDateSlot == null) {
              Constant.showError('Please select date');
              return;
            } else if (state.selectedSlot == null) {
              Constant.showError('Please select time');
              return;
            }
            if (state.isBookNext) {
              // facebookAppEvents.logInitiatedCheckout();
              if (widget.arguments.rescheduleBooking) {
                //Reschedule booking session
                context
                    .read<BookTherapyTimeBloc>()
                    .add(BookTherapyTimeEvent.rescheduleBooking());
              } else {
                //Case book next
                context
                    .read<BookTherapyTimeBloc>()
                    .add(BookTherapyTimeEvent.bookNextSession());
              }
            } else {
              // facebookAppEvents.logInitiatedCheckout();
              //Case book new
              Navigator.of(context).pushNamed(TherapyCheckoutScreen.routName,
                  arguments: TherapyCheckoutArguments(
                    therapyBookingInfo: state.therapyBookingInfo!,
                    bookingSlotInfo: state.selectedSlot!,
                    addressInfo:
                        widget.arguments.therapyBookingInfo?.servicesOffered ==
                                'in-clinic'
                            ? AddressInfo(
                                '',
                                widget
                                        .arguments
                                        .therapyBookingInfo
                                        ?.finderResponse
                                        ?.data
                                        ?.locations?[0]
                                        .clinicFullAddress ??
                                    '',
                                '',
                                '')
                            : state.addressInfo!,
                  ));
            }
          }),
    );
  }

  void _showAddAddressDialog(BuildContext context, BookTherapyTimeState state) {
    _flatNoBuildingController.clear();
    _localityAreaController.clear();
    _landmarkController.clear();
    _cityController.text = 'Bengaluru, Karnataka, India';
    if (state.addressInfo != null) {
      _flatNoBuildingController.text = state.addressInfo!.flatNoBuilding;
      _localityAreaController.text = state.addressInfo!.localityArea;
      _landmarkController.text = state.addressInfo!.landMark;
      _cityController.text =
          state.addressInfo?.city ?? 'Bengaluru, Karnataka, India';
    }
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 16),
                      TextWidget(
                          text: 'Address For Service',
                          fontSize: 14,
                          height: 19,
                          fontWeight: Constant.fontMedium,
                          textColor: AppColors.darkBlue),
                      SizedBox(height: 20),
                      DialogAddressWidget(
                          _localityAreaController, 'Locality/Area'),
                      SizedBox(height: 16),
                      DialogAddressWidget(
                          _flatNoBuildingController, 'Flat No/Building/Street'),
                      SizedBox(height: 16),
                      DialogAddressWidget(_landmarkController, 'Landmark',
                          action: TextInputAction.done),
                      SizedBox(height: 16),
                      // Stack(
                      //   children: [
                      //     StatefulBuilder(builder: (BuildContext context, StateSetter dropDownState) {
                      //       return Container(
                      //         padding: EdgeInsets.only(top: 5),
                      //         width: double.infinity,
                      //         child: DropdownButton<String>(
                      //           elevation: 0,
                      //           value: _cityController.text,
                      //           style: TextStyle(color: AppColors.darkGray, fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
                      //           underline: Container(height: 1, color: AppColors.darkGray, width: double.infinity),
                      //           items: <String>[
                      //             'Bengaluru, Karnataka, India',
                      //             // 'Pune, Maharashtra, India',
                      //             // 'Hyderabad, Telangana, India'
                      //           ].map((String value) {
                      //             return new DropdownMenuItem<String>(
                      //               value: value,
                      //               child: new Text(value, style: TextStyle(color: AppColors.darkGray, fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Roboto')),
                      //             );
                      //           }).toList(),
                      //           onChanged: (value) {
                      //             dropDownState(() {
                      //               _cityController.text = value ?? '';
                      //             });
                      //           },
                      //         ),
                      //       );
                      //     }),
                      //     Text('City', style: TextStyle(color: AppColors.darkGray, fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Roboto')),
                      //   ],
                      // ),
                      // SizedBox(height: 48),
                      PrimaryButtonWidget(
                          title: 'Save & Proceed',
                          height: 40,
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (_flatNoBuildingController.text.trim().isEmpty) {
                              Constant.showError('Please enter flat no.');
                              return;
                            }
                            if (_localityAreaController.text.trim().isEmpty) {
                              Constant.showError('Please enter locality');
                              return;
                            }
                            if (_landmarkController.text.trim().isEmpty) {
                              Constant.showError('Please enter landmark');
                              return;
                            }
                            // if (_cityController.text.trim().isEmpty) {
                            //   Constant.showError('Please select city');
                            //   return;
                            // }
                            context.read<BookTherapyTimeBloc>().add(
                                BookTherapyTimeEvent.setAddress(AddressInfo(
                                    _flatNoBuildingController.text.trim(),
                                    _localityAreaController.text.trim(),
                                    _landmarkController.text.trim(),
                                    _cityController.text.trim())));
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
