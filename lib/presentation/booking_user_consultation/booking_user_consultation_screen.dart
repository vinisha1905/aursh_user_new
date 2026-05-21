import 'package:ayursh/application/booking_user_consultation/booking_user_consultation_bloc.dart';
import 'package:ayursh/domain/model/business/booking_slot_info.dart';
import 'package:ayursh/domain/model/business/session_selected_info.dart';
import 'package:ayursh/domain/model/response/booking_user_model.dart';
import 'package:ayursh/domain/model/response/doctor_model.dart';
import 'package:ayursh/presentation/consultation_checkout/consultation_checkout_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/booking_user_widget.dart';
import 'package:ayursh/presentation/widget/dialog_gender_widget.dart';
import 'package:ayursh/presentation/widget/dialog_textfield_widget.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class BookingUserConsultationArguments {
  final DoctorModel doctorInfo;
  final BookingSlotInfo bookingSlotInfo;
  final SessionSelectedInfo? sessionSelectedInfo;

  const BookingUserConsultationArguments(
      {required this.doctorInfo,
      required this.bookingSlotInfo,
      this.sessionSelectedInfo});
}

class BookingUserConsultationScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/booking_user_consultation';
  final BookingUserConsultationArguments arguments;

  const BookingUserConsultationScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  BookingUserConsultationScreenState createState() {
    return BookingUserConsultationScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<BookingUserConsultationBloc>()
        ..add(BookingUserConsultationEvent.initialize(arguments.doctorInfo,
            arguments.bookingSlotInfo, arguments.sessionSelectedInfo)),
      child: this,
    );
  }
}

class BookingUserConsultationScreenState
    extends State<BookingUserConsultationScreen> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  String _gender = '';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<BookingUserConsultationBloc,
          BookingUserConsultationState>(
        builder: (ctx, state) {
          var bookingUsers = state.bookingUsers;
          return Stack(
            children: [
              Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: Text('Booking For'),
                    leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back_rounded,
                            color: AppColors.darkGray)),
                  ),
                  body: _bookingUserListWidget(bookingUsers, state)),
              LoadingWidget(loadingState: state.loadingState)
            ],
          );
        },
      ),
    );
  }

  Widget _bookingUserListWidget(List<BookingUserModel?> bookingUsersList,
      BookingUserConsultationState state) {
    List<BookingUserModel?> bookingUsers = [null, ...bookingUsersList];
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.6,
          crossAxisSpacing: 10,
          mainAxisSpacing: 0),
      itemCount: bookingUsers.length,
      itemBuilder: (BuildContext ctx, index) {
        var bookingUser = bookingUsers[index];
        return BookingUserWidget(bookingUsers[index], () {
          if (bookingUser == null) {
            //Add User
            _showAddUserDialog(context, state);
          } else {
            //Go next
            context.read<BookingUserConsultationBloc>().add(
                BookingUserConsultationEvent.selectBookingUser(bookingUser));
            Navigator.of(context).pushNamed(ConsultationCheckoutScreen.routName,
                arguments: ConsultationCheckoutArguments(
                    state.doctorInfo!,
                    state.bookingSlotInfo!,
                    bookingUser,
                    state.sessionSelectedInfo));
          }
        });
      },
    );
  }

  void _showAddUserDialog(
      BuildContext context, BookingUserConsultationState state) {
    _gender = 'Female';
    _nameController.clear();
    _ageController.clear();
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
                      SizedBox(height: 20),
                      DialogTextFieldWidget(
                          controller: _nameController, title: 'Name'),
                      SizedBox(height: 20),
                      DialogGenderWidget((gender) {
                        _gender = gender;
                      }),
                      SizedBox(height: 20),
                      DialogTextFieldWidget(
                          controller: _ageController,
                          title: 'Age',
                          textInputType: TextInputType.number),
                      SizedBox(height: 48),
                      PrimaryButtonWidget(
                          title: 'Confirm',
                          height: 40,
                          onTap: () {
                            if (_nameController.text.trim().isEmpty) {
                              _showError('Please enter name');
                              return;
                            }
                            if (_ageController.text.trim().isEmpty) {
                              _showError('Please enter age');
                              return;
                            }
                            var bookingUser = BookingUserModel(
                                _nameController.text.trim(),
                                _gender,
                                _ageController.text.trim());
                            context.read<BookingUserConsultationBloc>().add(
                                BookingUserConsultationEvent.addBookingUser(
                                    bookingUser));
                            Navigator.of(context).popAndPushNamed(
                                ConsultationCheckoutScreen.routName,
                                arguments: ConsultationCheckoutArguments(
                                    state.doctorInfo!,
                                    state.bookingSlotInfo!,
                                    bookingUser,
                                    state.sessionSelectedInfo));
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
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
}
