import 'package:ayursh/application/book_appointment/book_appointment_bloc.dart';
import 'package:ayursh/application/main/main_bloc.dart';
import 'package:ayursh/domain/model/response/internal_consultation_model.dart';
import 'package:ayursh/presentation/payment_success/payment_success_screen.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:ayursh/domain/model/business/session_selected_info.dart';
import 'package:ayursh/domain/model/response/doctor_model.dart';
import 'package:ayursh/presentation/book_appointment/widget/date_widget.dart';
import 'package:ayursh/presentation/book_appointment/widget/time_slot_widget.dart';
import 'package:ayursh/presentation/booking_user_consultation/booking_user_consultation_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BookAppointmentArguments {
  final DoctorModel? doctorInfo;
  final SessionSelectedInfo? sessionSelectedInfo;
  final InternalConsultationModel? bookedConsultation;

  const BookAppointmentArguments(
      {this.doctorInfo, this.sessionSelectedInfo, this.bookedConsultation});
}

class BookAppointmentScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/book_appointment';
  final BookAppointmentArguments arguments;

  const BookAppointmentScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  BookAppointmentScreenState createState() {
    return BookAppointmentScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<BookAppointmentBloc>()
        ..add(BookAppointmentEvent.initialize(arguments.doctorInfo,
            arguments.sessionSelectedInfo, arguments.bookedConsultation))
        ..add(BookAppointmentEvent.getSlots()),
      child: this,
    );
  }
}

class BookAppointmentScreenState extends State<BookAppointmentScreen> {
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
    return SafeArea(
      child: BlocConsumer<BookAppointmentBloc, BookAppointmentState>(
        listener: (ctx, state) {
          if (state.rescheduleConsultationResult != null) {
            state.rescheduleConsultationResult
                ?.fold((error) => Constant.showError(error), (r) {
              GetIt.I.get<MainBloc>().add(MainEvent.selectTab(0, null));
              GetIt.I
                  .get<MainBloc>()
                  .add(MainEvent.selectTab(1, BookFor.DoctorConsultation));
              Navigator.popUntil(context, ModalRoute.withName('/main'));
            });
          }
        },
        listenWhen: (state1, state2) {
          return state1.rescheduleConsultationResult !=
              state2.rescheduleConsultationResult;
        },
        builder: (ctx, state) {
          return Stack(
            children: [
              Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: Text('Book Appointment'),
                    leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back_rounded,
                            color: AppColors.darkGray)),
                  ),
                  body: state.daySlots.isNotEmpty
                      ? SingleChildScrollView(
                          child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, left: 8, right: 8, bottom: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: state.daySlots
                                        .map((daySlot) => DateWidget(
                                                daySlot,
                                                daySlot ==
                                                    state.selectedDaySlot, () {
                                              context
                                                  .read<BookAppointmentBloc>()
                                                  .add(BookAppointmentEvent
                                                      .selectDaySlot(daySlot));
                                            }))
                                        .toList()),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _partsOfDaySlotsWidget(
                                        'Morning',
                                        state.selectedDaySlot!.morningSlots,
                                        state.selectedSlot),
                                    _partsOfDaySlotsWidget(
                                        'Afternoon',
                                        state.selectedDaySlot!.afternoonSlots,
                                        state.selectedSlot),
                                    _partsOfDaySlotsWidget(
                                        'Evening',
                                        state.selectedDaySlot!.eveningSlots,
                                        state.selectedSlot)
                                  ],
                                ),
                              )
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

  Widget _partsOfDaySlotsWidget(String title, List<BookingSlotInfo> slots,
      BookingSlotInfo? selectedSlot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 26),
        TextWidget(
            text: title,
            fontSize: 16,
            height: 21,
            textColor: AppColors.darkGray,
            fontWeight: Constant.fontMedium),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 14),
          itemCount: slots.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
                alignment: Alignment.center,
                child: TimeSlotWidget(
                    slots[index], slots[index] == selectedSlot, (newSlot) {
                  context
                      .read<BookAppointmentBloc>()
                      .add(BookAppointmentEvent.selectSlot(newSlot));
                }));
          },
          padding: EdgeInsets.only(top: 16),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
        )
      ],
    );
  }

  Widget _bottomBottomWidget(BookAppointmentState state) {
    return Container(
      color: Colors.white,
      width: 200,
      padding: EdgeInsets.only(bottom: 22, left: 32, right: 32),
      child: PrimaryButtonWidget(
          title: 'Book',
          isEnable: state.selectedSlot != null,
          onTap: () {
            if (state.doctorInfo != null) {
              //Case consultation booking
              Navigator.of(context).pushNamed(
                  BookingUserConsultationScreen.routName,
                  arguments: BookingUserConsultationArguments(
                      doctorInfo: state.doctorInfo!,
                      bookingSlotInfo: state.selectedSlot!,
                      sessionSelectedInfo: state.sessionSelectedInfo));
            } else if (state.bookedConsultation != null) {
              //Case reschedule consultation
              context
                  .read<BookAppointmentBloc>()
                  .add(BookAppointmentEvent.rescheduleConsultation());
            }
          }),
    );
  }
}
