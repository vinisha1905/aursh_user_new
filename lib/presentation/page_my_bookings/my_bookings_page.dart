import 'package:ayursh/application/main/main_bloc.dart';
import 'package:ayursh/application/my_bookings/my_bookings_bloc.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/util/custom_print.dart';
import 'package:ayursh/presentation/page_my_bookings/doctor_consultation_list/doctor_consultation_list_page.dart';
import 'package:ayursh/presentation/page_my_bookings/medicine_booking_list/medicine_booking_page.dart';
import 'package:ayursh/presentation/page_my_bookings/therapy_booking_list/therapy_booking_list_page.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/search_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MyBookingsPage extends StatefulWidget with RouteWrapper {
  final int initPage;

  const MyBookingsPage({Key? key, required this.initPage}) : super(key: key);

  @override
  MyBookingsPageState createState() {
    return MyBookingsPageState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<MyBookingsBloc>(),
      child: this,
    );
  }
}

class MyBookingsPageState extends State<MyBookingsPage>
    with TickerProviderStateMixin {
  TextEditingController editingController = TextEditingController();

  // PageController? pageController;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    // pageController = PageController();
    tabController =
        TabController(initialIndex: widget.initPage, length: 3, vsync: this);
    print("widget.initPage ${widget.initPage}");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<MyBookingsBloc>()
          .add(MyBookingsEvent.selectPage(widget.initPage));
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    // pageController?.dispose();
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
                child: BlocConsumer<MyBookingsBloc, MyBookingsState>(
                  listener: (ctx, state) {
                    customPrint("state.loadingState ${state.loadingState}");
                    context.read<MainBloc>().add(
                        state.loadingState == LoadingState.isLoading
                            ? MainEvent.showLoading()
                            : MainEvent.hideLoading());
                    // tabController.index = state.selectedPage;
                    // print("widget.initPage == ${tabController.index}");
                  },
                  builder: (ctx, state) {
                    return Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          onTap: (index) {
                            if (index == 2) {
                              context
                                  .read<MyBookingsBloc>()
                                  .add(MyBookingsEvent.selectPage(2));
                            } else if (index == 0 &&
                                state.bookedTherapies == null) {
                              context
                                  .read<MyBookingsBloc>()
                                  .add(MyBookingsEvent.selectPage(0));
                            } else if (index == 1 &&
                                state.doctorBookingModel == null) {
                              context
                                  .read<MyBookingsBloc>()
                                  .add(MyBookingsEvent.selectPage(1));
                            }
                          },
                          labelStyle: TextStyle(
                              color: AppColors.darkGray,
                              fontSize: 14,
                              fontWeight: Constant.fontMedium),
                          indicatorColor: AppColors.darkBlue,
                          indicatorPadding:
                              EdgeInsets.only(left: 16, right: 16),
                          controller: tabController,
                          tabs: [
                            Tab(text: 'Therapy Bookings'),
                            Tab(text: 'Doctor Consultation'),
                            Tab(text: 'Medicine Bookings')
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              TherapyBookingListPage().wrappedRoute(context),
                              DoctorConsultationListPage(
                                  state.doctorBookingModel),
                              MedicineBookingPage(),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
