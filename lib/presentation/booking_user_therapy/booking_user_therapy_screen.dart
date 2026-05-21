import 'package:ayursh/application/booking_user_therapy/booking_user_therapy_bloc.dart';
import 'package:ayursh/domain/model/business/therapy_booking_info.dart';
import 'package:ayursh/domain/model/response/booking_user_model.dart';
import 'package:ayursh/presentation/book_therapy_time/book_therapy_time_screen.dart';
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

class BookingUserTherapyArguments {
  final TherapyBookingInfo therapyBookingInfo;

  const BookingUserTherapyArguments(this.therapyBookingInfo);
}

class BookingUserTherapyScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/booking_user_therapy';
  final BookingUserTherapyArguments arguments;

  const BookingUserTherapyScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  BookingUserTherapyScreenState createState() {
    return BookingUserTherapyScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<BookingUserTherapyBloc>()
        ..add(BookingUserTherapyEvent.initialize(arguments.therapyBookingInfo)),
      child: this,
    );
  }
}

class BookingUserTherapyScreenState extends State<BookingUserTherapyScreen> {
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
      child: BlocBuilder<BookingUserTherapyBloc, BookingUserTherapyState>(
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

  Widget _bookingUserListWidget(
      List<BookingUserModel?> bookingUsersList, BookingUserTherapyState state) {
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
            context
                .read<BookingUserTherapyBloc>()
                .add(BookingUserTherapyEvent.selectBookingUser(bookingUser));
            // Navigator.of(context).pushNamed(TermsAndConditionsScreen.routName,
            // arguments: TermsAndConditionsArguments(state.therapyBookingInfo!.copyWithBookingUser(bookingUser)));

            Navigator.of(context).pushNamed(BookTherapyTimeScreen.routName,
                arguments: BookTherapyTimeArguments(
                    therapyBookingInfo: state.therapyBookingInfo!
                        .copyWithBookingUser(bookingUser)));
          }
        });
      },
    );
  }

  void _showAddUserDialog(BuildContext context, BookingUserTherapyState state) {
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
                            context.read<BookingUserTherapyBloc>().add(
                                BookingUserTherapyEvent.addBookingUser(
                                    bookingUser));
                            // Navigator.of(context).popAndPushNamed(
                            //     TermsAndConditionsScreen.routName,
                            //     arguments: TermsAndConditionsArguments(state
                            //         .therapyBookingInfo!
                            //         .copyWithBookingUser(bookingUser)));
                            Navigator.of(context).popAndPushNamed(
                                BookTherapyTimeScreen.routName,
                                arguments: BookTherapyTimeArguments(
                                    therapyBookingInfo: state
                                        .therapyBookingInfo!
                                        .copyWithBookingUser(bookingUser)));
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
