import 'dart:async';
import 'dart:io';

import 'package:ayursh/application/address/address_bloc.dart';
import 'package:ayursh/application/auth_bloc/auth_bloc.dart';
import 'package:ayursh/application/main/main_bloc.dart';
import 'package:ayursh/application/my_bookings/my_bookings_bloc.dart';
import 'package:ayursh/application/notification/notification_bloc.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/util/custom_print.dart';
import 'package:ayursh/presentation/login/login_screen.dart';
import 'package:ayursh/presentation/medicines/view/medicines_home.dart';
import 'package:ayursh/presentation/page_home/home_page.dart';
import 'package:ayursh/presentation/page_my_bookings/my_bookings_page.dart';
import 'package:ayursh/presentation/page_profile/profile_page.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:store_redirect/store_redirect.dart';

class MainScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() {
    return MainScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(
          create: (_) => GetIt.I.get<MainBloc>()..add(MainEvent.initialize()),
        ),
        BlocProvider<AuthBloc>.value(
          value: GetIt.I.get<AuthBloc>()..add(AuthEvent.initialize()),
        ),
        BlocProvider<AddressBloc>.value(
          value: GetIt.I.get<AddressBloc>()..add(AddressEvent.initialize()),
        ),
        BlocProvider<NotificationBloc>.value(
          value: GetIt.I.get<NotificationBloc>()
            ..add(NotificationEvent.initialize()),
        ),
      ],
      child: this,
    );
  }
}

class MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  TextEditingController editingController = TextEditingController();
  PageController? pageController;
  late TabController tabController;
  Timer? timer;
  int? startTimeMilliseconds;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    _fetchRemoteConfig();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MainBloc>().add(
          MainEvent.selectTab(pageIndex ?? 0, MainState.initialize().bookFor));
    });
  }

  int? pageIndex;
  int? tabIndex;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    ArgModelMain? argModelMain =
        ModalRoute.of(context)?.settings.arguments as ArgModelMain?;
    if (argModelMain != null) {
      pageIndex = argModelMain.pageIndex;
      tabIndex = argModelMain.tabIndex;
      if (pageIndex == 2) {
        context.read<MainBloc>().add(MainEvent.hideLoading());
      }
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    pageController?.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (startTimeMilliseconds == null) {
          startTimeMilliseconds = DateTime.now().millisecondsSinceEpoch;
          timer = Timer(Duration(seconds: 2), () {
            startTimeMilliseconds = null;
          });
          Constant.showError('Please press back again to exit', isShort: true);
          return false;
        } else {
          if (DateTime.now().millisecondsSinceEpoch - startTimeMilliseconds! >
              100) {
            return true;
          }
          return false;
        }
      },
      child: Scaffold(
          body: Stack(
        children: [
          SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Expanded(
                      child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      HomePage().wrappedRoute(context),
                      MedicinesHome(),
                      MyBookingsPage(initPage: tabIndex ?? 0)
                          .wrappedRoute(context),
                      ProfilePage().wrappedRoute(context),
                    ],
                  )),
                ],
              ),
              bottomNavigationBar: SizedBox(
                height: 54,
                child: BlocListener<AuthBloc, AuthState>(
                  listener: (ctx, state) {
                    if (state.isLoggedIn == false) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginScreen.routName, (Route<dynamic> route) => false,
                          arguments: LoginArguments(state.message));
                      GetIt.I.resetLazySingleton<MainBloc>();
                    }
                  },
                  child: BlocConsumer<MainBloc, MainState>(
                    builder: (ctx, state) {
                      return TabBar(
                        controller: tabController,
                        tabs: [
                          Tab(
                            text: 'Treatments',
                            icon: Image.asset(
                                state.selectedTab == 0
                                    ? 'assets/icons/ic_tab_home_selected.png'
                                    : 'assets/icons/ic_tab_home_unselected.png',
                                height: 18,
                                fit: BoxFit.fitHeight),
                            iconMargin: EdgeInsets.only(bottom: 6),
                          ),
                          Tab(
                              text: 'Medicines',
                              icon: Image.asset(
                                  state.selectedTab == 1
                                      ? 'assets/icons/medicine_fill.png'
                                      : 'assets/icons/medicine.png',
                                  height: 25,
                                  fit: BoxFit.fitHeight),
                              iconMargin: EdgeInsets.only(bottom: 2)),
                          Tab(
                            text: 'My Bookings',
                            icon: SvgPicture.asset(
                                state.selectedTab == 2
                                    ? 'assets/icons/ic_tab_booking_selected.svg'
                                    : 'assets/icons/ic_tab_booking_unselected.svg',
                                height: 19,
                                fit: BoxFit.fitHeight),
                            iconMargin: EdgeInsets.only(bottom: 5),
                          ),
                          Tab(
                              text: 'My Profile',
                              icon: SvgPicture.asset(
                                  state.selectedTab == 4
                                      ? 'assets/icons/ic_tab_profile_selected.svg'
                                      : 'assets/icons/ic_tab_profile_unselected.svg',
                                  height: 20,
                                  fit: BoxFit.fitHeight),
                              iconMargin: EdgeInsets.only(bottom: 4)),
                        ],
                        onTap: (index) {
                          context
                              .read<MainBloc>()
                              .add(MainEvent.selectTab(index, state.bookFor));
                        },
                        labelColor: AppColors.darkBlue,
                        unselectedLabelColor: Colors.black38,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: state.selectedTab == 2 ? 10.2 : 12),
                        unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 10),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                      );
                    },
                    listener: (ctx, state) {
                      pageController?.jumpToPage(state.selectedTab ?? 0);
                      // if (state.selectedTab == 1) {
                      //   GetIt.I.get<MyBookingsBloc>().add(MyBookingsEvent.setForcedRefresh());
                      //   GetIt.I.get<MyBookingsBloc>().add(MyBookingsEvent.selectPage(0));
                      //   // if (state.bookFor == BookFor.Therapy) {
                      //   //   GetIt.I.get<MyBookingsBloc>().add(MyBookingsEvent.selectPage(0));
                      //   // } else {
                      //   //   GetIt.I.get<MyBookingsBloc>().add(MyBookingsEvent.selectPage(1));
                      //   // }
                      // } else
                      if (state.selectedTab == 2) {
                        GetIt.I
                            .get<MyBookingsBloc>()
                            .add(MyBookingsEvent.setForcedRefresh());
                        GetIt.I
                            .get<MyBookingsBloc>()
                            .add(MyBookingsEvent.selectPage(2));
                      }
                    },
                    listenWhen: (state1, state2) {
                      return state1.selectedTab != state2.selectedTab;
                    },
                  ),
                ),
              ),
              backgroundColor: Colors.white,
            ),
          ),
          BlocBuilder<MainBloc, MainState>(
            builder: (ctx, state) {
              customPrint("state.loadingState ${state.loadingState}");
              return LoadingWidget(loadingState: state.loadingState);
            },
          )
        ],
      )),
    );
  }

  double _getVersionFromString(String versionName) {
    List<String> versionParts = versionName.split('.');
    double currentVersion = 0.0;
    for (int i = 0; i < versionParts.length; i++) {
      switch (i) {
        case 0:
          {
            currentVersion += int.parse(versionParts[i]);
            break;
          }
        case 1:
          {
            currentVersion += int.parse(versionParts[i]) * 0.1;
            break;
          }
        case 2:
          {
            currentVersion += int.parse(versionParts[i]) * 0.01;
            break;
          }
        case 3:
          {
            currentVersion += int.parse(versionParts[i]) * 0.001;
            break;
          }
        default:
          break;
      }
    }
    return currentVersion;
  }

  Future<void> _fetchRemoteConfig() async {
    try {
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 60),
        minimumFetchInterval: const Duration(hours: 3),
      ));
      await remoteConfig.fetchAndActivate();
      bool isForceUpdateAndroid = remoteConfig.getBool("isForceUpdateAndroid");
      String minVersionAndroid = remoteConfig.getString("minAndroidVersion");
      bool isForceUpdateIOS = remoteConfig.getBool("isForceUpdateIOS");
      String minVersionIOS = remoteConfig.getString("minIOSVersion");
      PackageInfo info = await PackageInfo.fromPlatform();

      print("yielding minVersionAndroid - ${minVersionAndroid}");
      print("yielding current Version - ${_getVersionFromString(info.version)}");
      if ((Platform.isAndroid &&
              isForceUpdateAndroid &&
              _getVersionFromString(info.version) <
                  _getVersionFromString(minVersionAndroid)) ||
          (Platform.isIOS &&
              isForceUpdateIOS &&
              _getVersionFromString(info.version) <
                  _getVersionFromString(minVersionIOS))) {
        _showConfirmUpdate(context);
      }
    } catch (e) {
      debugPrint('RemoteConfig fetch failed: $e');
    }
  }

  void _showConfirmUpdate(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Dialog(
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
                          text: 'New version available',
                          fontSize: 18,
                          height: 22,
                          textColor: Colors.black),
                      SizedBox(height: 20),
                      Text(
                          'Please update app to new version to continue using app',
                          style: TextStyle(
                              fontSize: 16, color: AppColors.darkGray)),
                      SizedBox(height: 48),
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryButtonWidget(
                                title: 'No, close app',
                                height: 36,
                                onTap: () {
                                  if (Platform.isAndroid) {
                                    SystemNavigator.pop();
                                  } else if (Platform.isIOS) {
                                    exit(0);
                                  }
                                }),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: PrimaryButtonWidget(
                                title: 'Update',
                                height: 36,
                                onTap: () {
                                  StoreRedirect.redirect(
                                      androidAppId: 'com.ayursh',
                                      iOSAppId: '1596043263');
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
