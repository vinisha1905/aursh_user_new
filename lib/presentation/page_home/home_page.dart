import 'dart:developer';

import 'package:ayursh/application/address/address_bloc.dart';
import 'package:ayursh/application/home/home_bloc.dart';
import 'package:ayursh/application/main/main_bloc.dart';
import 'package:ayursh/application/notification/notification_bloc.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/main.dart';
import 'package:ayursh/presentation/doctor_list/doctor_list_screen.dart';
import 'package:ayursh/presentation/maintenance/maintenance_screen.dart';
import 'package:ayursh/presentation/page_home/widget/blog_widget.dart';
import 'package:ayursh/presentation/page_home/widget/category_widget.dart';
import 'package:ayursh/presentation/page_home/widget/review_widget.dart';
import 'package:ayursh/presentation/trending_blog_detail/trending_blog_detail_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/divider_widget.dart';
import 'package:ayursh/presentation/widget/dots_indicator_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/search_widget.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget with RouteWrapper {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() {
    return HomePageState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<HomeBloc>()
        ..add(HomeEvent.initialize())
        ..add(HomeEvent.getData()),
      child: this,
    );
  }
}

class HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  late bool _isRequestedLocationPermission;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    _isRequestedLocationPermission = false;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        getIt
            .get<NotificationBloc>()
            .add(NotificationEvent.fetchNotifications());
        _getCurrentLocation();
        print("app in resumed");
        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          SearchWidget().wrappedRoute(context),
          SizedBox(height: 8),
          Expanded(
              child: Container(
                  child: SingleChildScrollView(
            child: Column(children: [
              _doctorAdviseWidget(),
              _categoriesWidget(),
              _physioCategoriesWidget(),
              _blogsWidget(context),
              _userReviewsWidget(context)
            ]),
          )))
        ],
      )),
    );
  }

  Container _doctorAdviseWidget() {
    return Container(
        // color: AppColors.offWhite,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(DoctorListScreen.routName,
                    arguments: DoctorListArguments());
              },
              child: Container(
                height: 200,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(13), // Adjust the radius as needed
                  child: Image.asset(
                    'assets/icons/ayursh banner.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _categoriesWidget() {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (ctx, state) {
        if (state.categories.isEmpty) {
          return Container();
        }
        var isExpanded = false;
        if (state.therapyCategoryResponse != null &&
            state.therapyCategoryResponse!.categories != null) {
          isExpanded = state.categories.length ==
              state.therapyCategoryResponse!.categories!.length;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(
                      text: 'Ayurvedic Therapies @ Home',
                      fontSize: 18,
                      height: 24,
                      textColor: AppColors.darkGray,
                      fontWeight: Constant.fontMedium),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.9,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 10),
                    itemCount: state.categories.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return CategoryWidget(state.categories[index], "ayur");
                    },
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                  ),
                  // isExpanded
                  //     ? Container()
                  //     : Row(
                  //         mainAxisSize: MainAxisSize.max,
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           GestureDetector(
                  //             onTap: () {
                  //               context.read<HomeBloc>().add(HomeEvent.showAllCategories(true));
                  //             },
                  //             child: Container(
                  //               width: 32,
                  //               height: 32,
                  //               child: SvgPicture.asset('assets/icons/ic_expand.svg', width: 32, height: 32),
                  //               decoration: BoxDecoration(
                  //                 shape: BoxShape.circle,
                  //                 boxShadow: <BoxShadow>[BoxShadow(color: Colors.black12, blurRadius: 16.0, offset: Offset(0.0, 0.75))],
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       )
                ],
              ),
            ),
            SizedBox(height: 12),
            DividerWidget()
          ],
        );
      },
      buildWhen: (state1, state2) {
        return state1.categories.length != state2.categories.length;
      },
      listener: (ctx, state) {
        if (state.configModel != null && state.configModel!.maintenance) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              MaintenanceScreen.routName, (Route<dynamic> route) => false);
        }
        if (state.loadingState == LoadingState.isLoading) {
          context.read<MainBloc>().add(MainEvent.showLoading());
        } else if (state.loadingState == LoadingState.isCompleted) {
          context.read<MainBloc>().add(MainEvent.hideLoading());
        }
        if (!_isRequestedLocationPermission &&
            state.therapyCategoryResponse != null) {
          _isRequestedLocationPermission = true;
          _getCurrentLocation();
        }
      },
    );
  }

  Widget _physioCategoriesWidget() {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (ctx, state) {
        print("yielding $state");

        if (state.physioCategories.isEmpty) {
          return Container();
        }
        var isExpanded = false;
        if (state.physioTherapyCategoryResponse != null &&
            state.physioTherapyCategoryResponse!.categories != null) {
          isExpanded = state.physioCategories.length ==
              state.physioTherapyCategoryResponse!.categories!.length;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(
                      text: 'Physiotherapy @ Home',
                      fontSize: 18,
                      height: 24,
                      textColor: AppColors.darkGray,
                      fontWeight: Constant.fontMedium),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.92,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 10),
                    itemCount: state.physioCategories.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return CategoryWidget(
                          state.physioCategories[index], "physio");
                    },
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                  ),
                  // isExpanded
                  //     ? Container()
                  //     : Row(
                  //         mainAxisSize: MainAxisSize.max,
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           GestureDetector(
                  //             onTap: () {
                  //               print("yielding Ontap");
                  //               context.read<HomeBloc>().add(HomeEvent.showAllPhysioCategories(true));
                  //             },
                  //             child: Container(
                  //               width: 32,
                  //               height: 32,
                  //               child: SvgPicture.asset('assets/icons/ic_expand.svg', width: 32, height: 32),
                  //               decoration: BoxDecoration(
                  //                 shape: BoxShape.circle,
                  //                 boxShadow: <BoxShadow>[BoxShadow(color: Colors.black12, blurRadius: 16.0, offset: Offset(0.0, 0.75))],
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       )
                ],
              ),
            ),
            SizedBox(height: 12),
            DividerWidget()
          ],
        );
      },
      buildWhen: (state1, state2) {
        return state1.physioCategories.length != state2.physioCategories.length;
      },
      listener: (ctx, state) {
        if (state.configModel != null && state.configModel!.maintenance) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              MaintenanceScreen.routName, (Route<dynamic> route) => false);
        }
        if (state.loadingState == LoadingState.isLoading) {
          context.read<MainBloc>().add(MainEvent.showLoading());
        } else if (state.loadingState == LoadingState.isCompleted) {
          context.read<MainBloc>().add(MainEvent.hideLoading());
        }
        if (!_isRequestedLocationPermission &&
            state.physioTherapyCategoryResponse != null) {
          _isRequestedLocationPermission = true;
          log('~~~~~~~~~~~~~~~~~~~ LOCATION1 ~~~~~~~~~~~~~~~~~~~');

          _getCurrentLocation();
        }
      },
    );
  }

  Widget _blogsWidget(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (ctx, state) {
        if (state.blogs.isEmpty) {
          return Container();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 16, top: 12),
                child: TextWidget(
                  text: 'Trending Blogs',
                  fontSize: 18,
                  height: 24,
                  fontWeight: Constant.fontMedium,
                  textColor: AppColors.darkGray,
                )),
            SizedBox(height: 12),
            Container(
              width: screenWidth,
              height: 150,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: state.blogs.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                      padding: index == state.blogs.length - 1
                          ? const EdgeInsets.fromLTRB(16, 0, 10, 0)
                          : const EdgeInsets.only(left: 16),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                TrendingBlogDetailScreen.routName,
                                arguments: TrendingBlogDetailArguments(
                                    state.blogs, index));
                          },
                          child: BlogWidget(state.blogs[index])));
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 20),
            DividerWidget(screenWidth: screenWidth),
          ],
        );
      },
      buildWhen: (state1, state2) {
        return state1.blogs.length != state2.blogs.length;
      },
    );
  }

  Widget _userReviewsWidget(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (ctx, state) {
        if (state.reviews.isEmpty) {
          return Container();
        }
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 16, top: 12),
                  child: TextWidget(
                    text: 'Our Happy Customers',
                    fontSize: 18,
                    height: 24,
                    fontWeight: Constant.fontMedium,
                    textColor: AppColors.darkGray,
                  )),
              SizedBox(height: 12),
              Container(
                  width: screenWidth,
                  height: 170,
                  child: Stack(
                    children: [
                      PageView.builder(
                          onPageChanged: (index) {
                            context
                                .read<HomeBloc>()
                                .add(HomeEvent.selectUserReviewPage(index));
                          },
                          itemCount: state.reviews.length,
                          itemBuilder: (ctx, index) {
                            return ReviewWidget(state.reviews[index]);
                          }),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 12,
                        child: DotsIndicatorWidget(
                            state.reviews.length, state.selectedUserReview, 8),
                      )
                    ],
                  )),
              DividerWidget(screenWidth: screenWidth),
            ],
          ),
        );
      },
      buildWhen: (state1, state2) {
        return state1.reviews.length != state2.reviews.length ||
            state1.selectedUserReview != state2.selectedUserReview;
      },
    );
  }

  Future<void> _getCurrentLocation() async {
    try {
      final hasPermission = await _handlePermission();

      if (!hasPermission) {
        context.read<AddressBloc>().add(AddressEvent.updateAddress('', 0, 0));
        return;
      }
      final position = await _geolocatorPlatform.getCurrentPosition();
      print(
          'Latitude: ${position.latitude.toString()} - Longitude: ${position.longitude}');
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placeMarks.first;
      context.read<AddressBloc>().add(AddressEvent.updateAddress(
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}',
          position.latitude,
          position.longitude));
      context
          .read<HomeBloc>()
          .add(HomeEvent.updateLocation(placeMarks.first.toJson()));
    } catch (e) {
      print(e);
    }
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    log("~~~~~~~~~~~~~~~~> location 2 $serviceEnabled");

    permission = await _geolocatorPlatform.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("~~~~~~~~~~~~~~~~> location 5");

      return _showLocationDialog(context);
    }
    return true;
  }

  Future<bool> _showLocationDialog(BuildContext context) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return PopScope(
            canPop: false,
            child: Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)), //this right here
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/logo.svg',
                              width: 60, height: 60),
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                          width: 200,
                          child: PrimaryButtonWidget(
                              title: 'Access Location',
                              onTap: () async {
                                var permission = await _geolocatorPlatform
                                    .requestPermission();
                                print(permission.name);
                                if (permission == LocationPermission.always ||
                                    permission ==
                                        LocationPermission.whileInUse) {
                                  Navigator.of(context).pop();
                                } else if (permission ==
                                    LocationPermission.denied) {
                                  Navigator.of(context).pop();
                                } else if (permission ==
                                    LocationPermission.deniedForever) {
                                  openAppSettings();
                                  Navigator.of(context).pop();
                                }
                              })),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, bottom: 16),
                        child: Text(
                          'Ayursh will access your location only while using the app',
                          style: TextStyle(
                              color: AppColors.darkGray,
                              fontSize: 12,
                              height: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
