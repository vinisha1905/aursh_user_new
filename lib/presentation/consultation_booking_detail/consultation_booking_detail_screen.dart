import 'package:ayursh/application/consultation_booking_detail/consultation_booking_detail_bloc.dart';
import 'package:ayursh/domain/model/response/booking_user_model.dart';
import 'package:ayursh/domain/model/response/consultation_cancellation_info_model.dart';
import 'package:ayursh/domain/model/response/internal_consultation_model.dart';
import 'package:ayursh/presentation/audio_call/audio_call_screen.dart';
import 'package:ayursh/presentation/book_appointment/book_appointment_screen.dart';
import 'package:ayursh/presentation/cancel_consultation_success/cancel_consultation_success_screen.dart';
import 'package:ayursh/presentation/chat/chat_screen.dart';
import 'package:ayursh/presentation/pdf_view/pdf_view_screen.dart';
import 'package:ayursh/presentation/therapy_detail/therapy_detail_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/video_call/video_call_screen.dart';
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ConsultationBookingDetailArguments {
  final InternalConsultationModel consultation;

  const ConsultationBookingDetailArguments(this.consultation);
}

class ConsultationBookingDetailScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/consultation_booking_detail';
  final ConsultationBookingDetailArguments arguments;

  const ConsultationBookingDetailScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  ConsultationBookingDetailScreenState createState() {
    return ConsultationBookingDetailScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<ConsultationBookingDetailBloc>()
        ..add(
            ConsultationBookingDetailEvent.initialize(arguments.consultation)),
      child: this,
    );
  }
}

class ConsultationBookingDetailScreenState
    extends State<ConsultationBookingDetailScreen> {
  late RefreshController _refreshController;
  late TextEditingController _cancellationReasonController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
    _cancellationReasonController = TextEditingController();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _cancellationReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ConsultationBookingDetailBloc,
          ConsultationBookingDetailState>(listener: (ctx, state) {
        if (state.cancelConsultationResult != null) {
          Navigator.of(context).pushNamed(
              CancelConsultationSuccessScreen.routName,
              arguments: state.consultation?.displayName ?? '');
        }
        if (state.errorMessage != null) {
          Constant.showError(state.errorMessage ?? '');
          context
              .read<ConsultationBookingDetailBloc>()
              .add(ConsultationBookingDetailEvent.resetErrorMessage());
        }
        if (state.rtcToken != null) {
          context
              .read<ConsultationBookingDetailBloc>()
              .add(ConsultationBookingDetailEvent.cleanRtcToken());
          var rtcToken = state.rtcToken ?? '';
          var consultationId = state.consultation?.id ?? '';
          var userId = state.userId ?? '';
          var displayImage = state.consultation?.displayImage ?? '';
          var doctorName = state.consultation?.displayName ?? '';
          if (state.callType == 'Audio Call') {
            Navigator.of(context).pushNamed(AudioCallScreen.routName,
                arguments: AudioCallArguments(rtcToken, consultationId, userId,
                    displayImage, doctorName));
          }
          if (state.callType == 'Video Call') {
            Navigator.of(context).pushNamed(VideoCallScreen.routName,
                arguments: VideoCallArguments(rtcToken, consultationId, userId,
                    displayImage, doctorName));
          }
        }
      }, builder: (ctx, state) {
        var consultation = state.consultation;
        var cancellationInfo = state.cancellationInfo;
        Widget statusWidget = Container();
        if (consultation != null) {
          if (consultation.status.toLowerCase() == 'completed') {
            statusWidget = _completedStatusWidget(consultation);
          } else if (consultation.status.toLowerCase() == 'cancelled') {
            statusWidget = _cancelledStatusWidget(consultation);
          } else {
            statusWidget = _upComingStatusWidget(consultation);
          }
        }

        return Stack(
          children: [
            Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text('Doctor Consultation'),
                  leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back_rounded,
                          color: AppColors.darkGray)),
                ),
                body: consultation != null
                    ? SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _avatarAndNameWidget(consultation),
                                    _freeFollowUpWidget(consultation),
                                  ],
                                ),
                              ),
                              LineDividerWidget(),
                              statusWidget,
                              LineDividerWidget(),
                              _prescriptionWidget(consultation),
                              _therapyAssignedWidget(consultation),
                              _bookingPatientAndTimeWidget(consultation),
                              LineDividerWidget(),
                              _paymentSummaryWidget(
                                  consultation, cancellationInfo),
                              LineDividerWidget(),
                              _rescheduleWidget(consultation),
                              _invoiceWidget(consultation),
                              _helpWidget(consultation),
                              _cancelWidget(context, state),
                            ]),
                      )
                    : Container()),
            LoadingWidget(loadingState: state.loadingState)
          ],
        );
      }),
    );
  }

  Row _avatarAndNameWidget(InternalConsultationModel consultation) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
            child: Container(
          width: 60,
          height: 60,
          child: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: consultation.displayImage,
                width: 60,
                height: 60,
                fit: BoxFit.fill,
                errorWidget: (ctx, a, b) {
                  return Container(
                    color: AppColors.grayLight,
                  );
                },
              )),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 12),
              TextWidget(
                  text: consultation.displayName,
                  fontSize: 16,
                  height: 21,
                  textColor: AppColors.darkGray,
                  fontWeight: Constant.fontMedium),
              SizedBox(height: 4),
              TextWidget(
                  text: consultation.qualification,
                  fontSize: 14,
                  height: 19,
                  textColor: AppColors.darkGray),
            ],
          ),
        ))
      ],
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

  Widget _freeFollowUpWidget(InternalConsultationModel consultation) {
    if (consultation.status.toLowerCase() == 'cancelled') {
      return Container();
    } else {
      return Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text('*${consultation.followUpText}',
              style: TextStyle(fontSize: 12, color: AppColors.darkGray)));
    }
  }

  Widget _cancelledStatusWidget(InternalConsultationModel consultation) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
              text: consultation.status,
              fontSize: 12,
              height: 16,
              textColor: AppColors.error,
              fontWeight: Constant.fontMedium),
          SizedBox(height: 8),
          TextWidget(
              text: consultation.cancelledAt ?? '',
              fontSize: 14,
              height: 16,
              textColor: AppColors.darkGray),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/ic_session_completed.png',
                  width: 18, height: 18),
              SizedBox(width: 10),
              TextWidget(
                  text: 'Refund Processed',
                  fontSize: 12,
                  height: 16,
                  textColor: AppColors.darkBlue,
                  fontWeight: Constant.fontMedium)
            ],
          )
        ],
      ),
    );
  }

  Widget _upComingStatusWidget(InternalConsultationModel consultation) {
    Color textColor = AppColors.darkYellow;
    if (consultation.status.toLowerCase() == 'upcoming') {
      textColor = AppColors.darkBlue;
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
              text: consultation.status,
              fontSize: 12,
              height: 16,
              textColor: textColor,
              fontWeight: Constant.fontMedium),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/ic_session_ongoing.png',
                  width: 18, height: 18),
              SizedBox(width: 10),
              TextWidget(
                  text:
                      '${consultation.scheduleAt}   ●   Amound Paid  ${Constant.formatCurrency(consultation.totalAmount.toInt().toString())}',
                  fontSize: 14,
                  height: 19,
                  textColor: AppColors.darkGray)
            ],
          ),
          SizedBox(height: 12),
          Row(children: [
            Expanded(
                flex: 5,
                child: _communicateButton(
                    'Video',
                    SvgPicture.asset('assets/icons/ic_video_call.svg',
                        width: 18, height: 10), () {
                  context.read<ConsultationBookingDetailBloc>().add(
                      ConsultationBookingDetailEvent.getRtcToken('Video Call'));
                })),
            SizedBox(width: 16),
            Expanded(
                flex: 5,
                child: _communicateButton(
                    'Audio',
                    SvgPicture.asset('assets/icons/ic_call.svg',
                        width: 12.2, height: 12.2), () {
                  context.read<ConsultationBookingDetailBloc>().add(
                      ConsultationBookingDetailEvent.getRtcToken('Audio Call'));
                })),
            SizedBox(width: 16),
            Expanded(
                flex: 6,
                child: _communicateButton(
                    'Message',
                    SvgPicture.asset('assets/icons/ic_chat.svg',
                        width: 13.5, height: 13.5), () {
                  Navigator.of(context).pushNamed(ChatScreen.routName,
                      arguments: ChatArguments(consultation: consultation));
                })),
          ])
        ],
      ),
    );
  }

  Widget _completedStatusWidget(InternalConsultationModel consultation) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
              text: consultation.status,
              fontSize: 12,
              height: 16,
              textColor: AppColors.successColor,
              fontWeight: Constant.fontMedium),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/ic_session_ongoing.png',
                  width: 18, height: 18),
              SizedBox(width: 10),
              TextWidget(
                  text:
                      '${consultation.scheduleAt}   ●   Amound Paid  ${Constant.formatCurrency(consultation.totalAmount.toInt().toString())}',
                  fontSize: 14,
                  height: 19,
                  textColor: AppColors.darkGray)
            ],
          ),
          SizedBox(height: 12),
          Row(children: [
            SizedBox(width: 16),
            Expanded(
                flex: 4,
                child: _communicateButton(
                    'Message',
                    SvgPicture.asset('assets/icons/ic_chat.svg',
                        width: 13.5, height: 13.5), () {
                  Navigator.of(context).pushNamed(ChatScreen.routName,
                      arguments: ChatArguments(consultation: consultation));
                }, fontSize: 14)),
            SizedBox(width: 24),
            Expanded(
                flex: 5,
                child: PrimaryButtonWidget(
                    title: 'Follow Up', height: 34, onTap: () {})),
            SizedBox(width: 16),
          ])
        ],
      ),
    );
  }

  Widget _communicateButton(String title, Widget icon, Function() onTap,
      {double fontSize = 12}) {
    return Container(
      height: 34,
      child: ElevatedButton(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith(
                (states) {
                  return states.contains(MaterialState.pressed)
                      ? Colors.grey.shade100
                      : null;
                },
              ),
              elevation: MaterialStateProperty.all<double>(0.0),
              shadowColor: MaterialStateProperty.all<Color>(Colors.black12),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.darkYellow),
                      borderRadius: BorderRadius.circular(8)))),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                icon,
                Text(title,
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkYellow))
              ],
            ),
          ),
          onPressed: onTap),
    );
  }

  Widget _bookingPatientAndTimeWidget(InternalConsultationModel consultation) {
    var patientName = consultation.patientName ?? consultation.bookingForName;
    var patientGender =
        (consultation.patientGender ?? consultation.bookingForGender)
            .substring(0, 1)
            .toUpperCase();
    var patientAge = consultation.patientAge ?? consultation.bookingForAge;
    var patient = '$patientName, $patientGender, $patientAge';
    double width = MediaQuery.of(context).size.width - 32;
    double smallerWidget = width * 0.31;
    double largerWidget = width * 0.38;
    var titleStyle = TextStyle(color: AppColors.darkGray);
    var valueStyle =
        TextStyle(color: AppColors.darkGray, fontWeight: Constant.fontMedium);
    if (consultation.status.toLowerCase() == 'completed') {
      return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Booked On', style: titleStyle),
                  SizedBox(height: 8),
                  Text('${consultation.bookedOn}', style: valueStyle),
                ],
              ),
            ),
            Container(
              width: width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Booking For', style: titleStyle),
                  SizedBox(height: 8),
                  Text('$patient', style: valueStyle),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: smallerWidget,
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Booked On', style: titleStyle),
                  SizedBox(height: 8),
                  Text('${consultation.bookedOn}', style: valueStyle),
                ],
              ),
            ),
            Container(
              width: smallerWidget,
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Booking For', style: titleStyle),
                  SizedBox(height: 8),
                  Text('$patient', style: valueStyle),
                ],
              ),
            ),
            Container(
              width: largerWidget,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Appointment Date', style: titleStyle),
                  SizedBox(height: 8),
                  Text('${consultation.appointmentDate}', style: valueStyle),
                ],
              ),
            )
          ],
        ),
      );
    }
  }

  Widget _paymentSummaryWidget(InternalConsultationModel consultation,
      ConsultationCancellationInfoModel? cancellationInfo) {
    var textStyle = TextStyle(color: AppColors.darkGray);

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment Summary',
              style: TextStyle(
                  color: AppColors.darkGray, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Amount Paid', style: textStyle),
              Text(
                  '${Constant.formatCurrency(consultation.totalAmount.toInt().toString())}',
                  style: textStyle),
            ],
          ),
          consultation.status.toLowerCase() == 'cancelled' &&
                  cancellationInfo != null
              ? Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Amount Refunded', style: textStyle),
                      Text(
                          '${Constant.formatCurrency(cancellationInfo.refundAmount.display())}',
                          style: textStyle),
                    ],
                  ))
              : Container()
        ],
      ),
    );
  }

  Widget _rescheduleWidget(InternalConsultationModel consultation) {
    var status = consultation.status.toLowerCase();
    if (status == 'completed' || status == 'cancelled' || status == 'ongoing') {
      return Container();
    }
    return TextIconRowWidget(
        icon: SvgPicture.asset('assets/icons/ic_schedule.svg',
            width: 19, height: 19, color: AppColors.darkGray),
        title: 'Reschedule',
        onTap: () {
          _rescheduleConsultation(consultation);
        });
  }

  Widget _invoiceWidget(InternalConsultationModel consultation) {
    return TextIconRowWidget(
        icon: SvgPicture.asset('assets/icons/ic_invoice.svg',
            width: 18, height: 16, color: AppColors.darkGray),
        title: 'Invoice',
        onTap: () {
          _showInvoice(consultation);
        });
  }

  Widget _helpWidget(InternalConsultationModel consultation) {
    return TextIconRowWidget(
        icon: SvgPicture.asset('assets/icons/ic_about_us.svg',
            width: 18, height: 18, color: AppColors.darkGray),
        title: 'Help',
        onTap: () {
          _handleHelp();
        });
  }

  Widget _cancelWidget(
      BuildContext context, ConsultationBookingDetailState state) {
    if ((state.consultation?.canBeCancelled ?? false) != true) {
      return Container();
    }
    return TextIconRowWidget(
        icon: SvgPicture.asset('assets/icons/ic_cancel.svg',
            width: 18, height: 18, color: AppColors.darkGray),
        title: 'Cancel',
        onTap: () {
          _showConfirmCancel(context, state);
        });
  }

  Widget _prescriptionWidget(InternalConsultationModel consultation) {
    if (consultation.status.toLowerCase() != 'completed') {
      return Container();
    }
    return InkWell(
      onTap: () {
        _showPrescription(consultation);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              children: [
                Container(
                    width: 36,
                    height: 36,
                    child: Center(
                      child: SvgPicture.asset(
                          'assets/icons/ic_prescription.svg',
                          width: 14,
                          height: 18.5,
                          color: AppColors.darkGray),
                    )),
                SizedBox(width: 4),
                Expanded(
                  child: TextWidget(
                      text: 'Prescription',
                      fontSize: 16,
                      height: 21,
                      textColor: AppColors.darkGray),
                ),
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.darkBlue),
                  child: Center(
                    child: SvgPicture.asset('assets/icons/ic_file.svg',
                        width: 16, height: 19),
                  ),
                ),
                SizedBox(width: 6)
              ],
            ),
          ),
          LineDividerWidget(),
        ],
      ),
    );
  }

  Widget _therapyAssignedWidget(InternalConsultationModel consultation) {
    if (consultation.status.toLowerCase() != 'completed' ||
        consultation.assignedTherapyTotalSessions == null ||
        consultation.assignedTherapyTitle == null ||
        consultation.assignedTherapyTitle!.isEmpty) {
      return Container();
    }
    var totalSession = consultation.assignedTherapyTotalSessions ?? 0;
    var totalSessionText;
    if (totalSession <= 1) {
      totalSessionText = '1 Session';
    } else {
      totalSessionText = '$totalSession Sessions';
    }
    return InkWell(
      onTap: () {
        _showAssignedTherapy(consultation);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 36,
                    height: 36,
                    child: Center(
                      child: SvgPicture.asset('assets/icons/ic_people.svg',
                          width: 19, height: 19, color: AppColors.darkGray),
                    )),
                SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: TextWidget(
                      text: 'Therapy Assigned',
                      fontSize: 16,
                      height: 21,
                      textColor: AppColors.darkGray),
                ),
                SizedBox(width: 24),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6),
                    Text('${consultation.assignedTherapyHeadline}',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.darkYellow,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text('$totalSessionText',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            color: AppColors.darkYellow))
                  ],
                )),
                SizedBox(width: 6)
              ],
            ),
          ),
          LineDividerWidget(),
        ],
      ),
    );
  }

  void _showInvoice(InternalConsultationModel consultation) {
    var url = Constant.baseUrl +
        'onboarding/api/v1/consultation/booking/${consultation.id}/booked-on/${consultation.bookedOnTs}/invoice';
    Navigator.of(context).pushNamed(PdfViewScreen.routName,
        arguments: PdfViewArguments(url, 'invoice.pdf'));
  }

  void _showPrescription(InternalConsultationModel consultation) {
    var url = Constant.baseUrl +
        'onboarding/api/v1/consultation/booking/${consultation.doctorBookingId}/prescription';
    Navigator.of(context).pushNamed(PdfViewScreen.routName,
        arguments: PdfViewArguments(url, 'prescription.pdf'));
  }

  void _showAssignedTherapy(InternalConsultationModel consultation) {
    if (consultation.status == 'Under Process' ||
        consultation.assignedTherapyTitle == null ||
        consultation.assignedTherapyHeadline == null) {
      return;
    }
    var assignedCategoryTitle = consultation.assignedTherapyCategory ?? '';
    var assignedTherapyTitle = consultation.assignedTherapyTitle ?? '';
    var doctorBookingId = consultation.doctorBookingId;
    var consultationBookingId = consultation.id;
    var patientName = consultation.patientName ?? consultation.bookingForName;
    var patientGender =
        consultation.patientGender ?? consultation.bookingForGender;
    var patientAge = consultation.patientAge ?? consultation.bookingForAge;
    var bookingUser = BookingUserModel(patientName, patientGender, patientAge);
    Navigator.of(context).pushNamed(TherapyDetailScreen.routName,
        arguments: TherapyDetailArguments(
            categoryTitle: assignedCategoryTitle,
            therapyTitle: assignedTherapyTitle,
            doctorBookingId: doctorBookingId,
            consultationBookingId: consultationBookingId,
            bookingUser: bookingUser));
  }

  void _rescheduleConsultation(InternalConsultationModel consultation) {
    Navigator.of(context).pushNamed(BookAppointmentScreen.routName,
        arguments: BookAppointmentArguments(bookedConsultation: consultation));
  }

  void _showConfirmCancel(
      BuildContext context, ConsultationBookingDetailState state) {
    if (state.cancellationInfo == null) {
      return;
    }
    var valueStyle = TextStyle(fontSize: 14, color: AppColors.darkGray);
    _cancellationReasonController.clear();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Are you sure you want to cancel the consultation?',
                        style: TextStyle(
                            fontSize: 16,
                            height: 1.4,
                            color: AppColors.darkGray)),
                    SizedBox(height: 16),
                    Text(
                        'Cancellation fee  ${Constant.formatCurrency(state.cancellationInfo!.cancellationFee.display())}',
                        style: valueStyle),
                    SizedBox(height: 16),
                    Text(
                        'Refund amount  ${Constant.formatCurrency(state.cancellationInfo!.refundAmount.display())}',
                        style: valueStyle),
                    SizedBox(height: 18),
                    TextField(
                      controller: _cancellationReasonController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: AppColors.darkGray, fontSize: 16),
                      decoration: InputDecoration(
                          labelText: 'Cancel Reason',
                          labelStyle: TextStyle(
                              color: AppColors.grayLight, fontSize: 16),
                          border: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder()),
                    ),
                    SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButtonWidget(
                              title: 'No, Forget it',
                              height: 36,
                              onTap: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: PrimaryButtonWidget(
                              title: 'Yes, Cancel',
                              height: 36,
                              onTap: () {
                                var reason =
                                    _cancellationReasonController.text.trim();
                                if (reason.isEmpty) {
                                  Constant.showError(
                                      'Please enter cancel reason');
                                  return;
                                }
                                Navigator.of(context).pop();
                                context
                                    .read<ConsultationBookingDetailBloc>()
                                    .add(ConsultationBookingDetailEvent
                                        .cancelConsultation(reason));
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

  void _handleHelp() {
    Freshchat.showConversations();
  }
}
