import 'package:ayursh/application/my_bookings/my_bookings_bloc.dart';
import 'package:ayursh/presentation/booked_therapy_detail/booked_therapy_detail_screen.dart';
import 'package:ayursh/presentation/category_detail/category_detail_screen.dart';
import 'package:ayursh/presentation/page_my_bookings/therapy_booking_list/widget/therapy_booking_widget.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class TherapyBookingListPage extends StatefulWidget with RouteWrapper {
  @override
  TherapyBookingListPageState createState() {
    return TherapyBookingListPageState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<MyBookingsBloc>(),
      child: this,
    );
  }
}

class TherapyBookingListPageState extends State<TherapyBookingListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          BlocBuilder<MyBookingsBloc, MyBookingsState>(builder: (ctx, state) {
        if (state.bookedTherapies == null) {
          return Container();
        }
        if (state.bookedTherapies!.isEmpty) {
          return Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                SvgPicture.asset('assets/icons/ic_prakruti.svg',
                    width: 46, height: 60),
                SizedBox(height: 24),
                Text(
                  'You have not booked any\ntherapy yet',
                  style: TextStyle(color: AppColors.darkGray, height: 1.4),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: 160,
                  child: PrimaryButtonWidget(
                      title: 'Therapy List',
                      height: 34,
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            CategoryDetailScreen.routName,
                            arguments: CategoryDetailArguments());
                      }),
                )
              ],
            ),
          );
        }
        return RefreshIndicator(
          color: AppColors.darkBlue,
          onRefresh: () async {
            // await Future.delayed(Duration(seconds: 3));
            context
                .read<MyBookingsBloc>()
                .add(MyBookingsEvent.getBookedTherapies());
          },
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 16),
            itemCount: state.bookedTherapies!.length,
            itemBuilder: (ctx, index) {
              return TherapyBookingWidget(
                  bookedTherapy: state.bookedTherapies![index],
                  onTap: (bookedTherapy) async {
                    await Navigator.of(context)
                        .pushNamed(BookedTherapyDetailScreen.routName,
                            arguments:
                                BookedTherapyDetailArguments(bookedTherapy))
                        .then((value) => context
                            .read<MyBookingsBloc>()
                            .add(MyBookingsEvent.getBookedTherapies()));
                  },
                  onRefresh: () {
                    context
                        .read<MyBookingsBloc>()
                        .add(MyBookingsEvent.getBookedTherapies());
                  });
            },
          ),
        );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
