import 'package:ayursh/application/auth_bloc/auth_bloc.dart';
import 'package:ayursh/application/main/main_bloc.dart';
import 'package:ayursh/application/profile/profile_bloc.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/presentation/about_us/about_us_screen.dart';
import 'package:ayursh/presentation/page_profile/widget/profile_session_widget.dart';
import 'package:ayursh/presentation/payment_history/payment_history_screen.dart';
import 'package:ayursh/presentation/quiz/quiz_screen.dart';
import 'package:ayursh/presentation/refer_and_earn/refer_and_earn.dart';
import 'package:ayursh/presentation/support/support_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/dialog_textfield_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfilePage extends StatefulWidget with RouteWrapper {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() {
    return ProfilePageState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<ProfileBloc>()..add(ProfileEvent.getProfile()),
      child: this,
    );
  }
}

class ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController _emailController;
  late TextEditingController _nameController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (ctx, state) {
        if (state.loadingState == LoadingState.isLoading) {
          context.read<MainBloc>().add(MainEvent.showLoading());
        } else {
          context.read<MainBloc>().add(MainEvent.hideLoading());
        }
      },
      builder: (ctx, state) {
        return SafeArea(
          child: Scaffold(
              body: Column(
            children: [
              _titleWidget(),
              SizedBox(height: 8),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _userInfoWidget(state),
                    SizedBox(height: 22),
                    ProfileSessionWidget(
                        icon: SvgPicture.asset(
                            'assets/icons/ic_payment_history.svg',
                            width: 14,
                            height: 19,
                            color: AppColors.darkGray),
                        title: 'Refer & Earn',
                        isFirst: true,
                        onTap: () {
                          Navigator.pushNamed(context, ReferAndEarn.routName);
                          // Share.share('Hey! check out Home Therapy app at: https://play.google.com/store/apps/details?id=com.ayursh',);
                        }),
                    ProfileSessionWidget(
                        icon: SvgPicture.asset(
                            'assets/icons/ic_payment_history.svg',
                            width: 14,
                            height: 19,
                            color: AppColors.darkGray),
                        title: 'Payment History',
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(PaymentHistoryScreen.routName);
                        }),
                    ProfileSessionWidget(
                        icon: SvgPicture.asset('assets/icons/ic_about_us.svg',
                            width: 17, height: 17, color: AppColors.darkGray),
                        title: 'About Us',
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AboutUsScreen.routName);
                        }),
                    ProfileSessionWidget(
                        icon: SvgPicture.asset('assets/icons/ic_prakruti.svg',
                            width: 16, height: 18, color: AppColors.darkGray),
                        title: 'Know Your prakruti',
                        onTap: () {
                          Navigator.of(context).pushNamed(QuizScreen.routName);
                        }),
                    ProfileSessionWidget(
                        icon: SvgPicture.asset('assets/icons/ic_support.svg',
                            width: 19, height: 17, color: AppColors.darkGray),
                        title: 'Support',
                        onTap: () async {
                          var isSuccess = await Navigator.of(context).pushNamed(
                              SupportScreen.routName,
                              arguments: SupportArguments(state.profile!));
                          if (isSuccess == true) {
                            Constant.showError('Message saved');
                          }
                        }),
                    ProfileSessionWidget(
                        icon: SvgPicture.asset('assets/icons/ic_logout.svg',
                            width: 17, height: 19, color: AppColors.darkGray),
                        title: 'Log Out',
                        onTap: () {
                          _showConfirmLogout(context);
                        }),
                    SizedBox(height: 24),
                    FutureBuilder(
                      future: PackageInfo.fromPlatform(),
                      builder: (ctx, snapshot) {
                        if (snapshot.hasData) {
                          PackageInfo packageInfo =
                              snapshot.data as PackageInfo;
                          return Center(
                              child: Text('Version ${packageInfo.version}'));
                        }
                        return SizedBox.shrink();
                      },
                    ),
                    SizedBox(height: 32)
                  ],
                ),
              ))
            ],
          )),
        );
      },
    );
  }

  Widget _userInfoWidget(ProfileState state) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 24),
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.greyMedium),
                child: Center(
                    child: SvgPicture.asset(
                  'assets/icons/ic_tab_profile_selected.svg',
                  fit: BoxFit.fill,
                  width: 44,
                  height: 50,
                  color: Colors.white,
                )),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 26),
                  Text(state.profile?.name ?? '',
                      style: TextStyle(
                          color: AppColors.darkBlue,
                          fontWeight: Constant.fontMedium,
                          height: 1.3,
                          fontSize: 16)),
                  SizedBox(height: 8),
                  Text(state.profile?.email ?? '',
                      style: TextStyle(color: AppColors.darkBlue, height: 1.3)),
                  SizedBox(height: 4),
                  TextWidget(
                      text: '${state.profile?.phoneNumber ?? ''}',
                      textColor: AppColors.darkBlue,
                      fontSize: 14,
                      height: 16),
                ],
              ),
            ))
          ],
        ),
        Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => _showUpdateProfileDialog(context,
                  state.profile?.name ?? '', state.profile?.email ?? ''),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Icon(
                  Icons.edit,
                  color: AppColors.darkBlue,
                  size: 22,
                ),
              ),
            ))
      ],
    );
  }

  Widget _titleWidget() {
    return Container(
      width: double.infinity,
      height: 40,
      color: Colors.white,
      child: Center(
        child: Text('My Profile',
            style: TextStyle(color: Colors.black54, fontSize: 18)),
      ),
    );
  }

  void _showUpdateProfileDialog(
      BuildContext context, String name, String email) {
    _nameController.text = name;
    _emailController.text = email;
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
                    SizedBox(height: 20),
                    DialogTextFieldWidget(
                        controller: _nameController, title: 'Name'),
                    SizedBox(height: 20),
                    DialogTextFieldWidget(
                        controller: _emailController,
                        title: 'Email',
                        textInputType: TextInputType.emailAddress),
                    SizedBox(height: 48),
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButtonWidget(
                              title: 'Cancel',
                              height: 36,
                              onTap: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: PrimaryButtonWidget(
                              title: 'Save',
                              height: 36,
                              onTap: () {
                                if (_nameController.text.trim().isEmpty) {
                                  _showError('Please enter name');
                                } else if (_emailController.text
                                    .trim()
                                    .isEmpty) {
                                  _showError('Please enter email');
                                } else if (!_isEmail(_emailController.text)) {
                                  _showError('Please enter valid email');
                                } else {
                                  Navigator.of(context).pop();
                                  context.read<ProfileBloc>().add(
                                      ProfileEvent.updateProfile(
                                          _nameController.text.trim(),
                                          _emailController.text.trim()));
                                }
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

  bool _isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }

  void _showConfirmLogout(BuildContext context) {
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
                    SizedBox(height: 20),
                    TextWidget(
                        text: 'Do you want to log out?',
                        fontSize: 16,
                        height: 19,
                        textColor: AppColors.darkGray),
                    SizedBox(height: 48),
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButtonWidget(
                              title: 'Cancel',
                              height: 36,
                              onTap: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: PrimaryButtonWidget(
                              title: 'Log Out',
                              height: 36,
                              onTap: () {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthEvent.logOut('Log out success'));
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
}
