import 'package:ayursh/application/address/address_bloc.dart';
import 'package:ayursh/application/notification/notification_bloc.dart';
import 'package:ayursh/presentation/notification/notification_screen.dart';
import 'package:ayursh/presentation/search_therapy/search_therapy_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SearchWidget extends StatefulWidget with RouteWrapper{

  SearchWidget();

  @override
  SearchWidgetState createState() {
    return SearchWidgetState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<AddressBloc>()..add(AddressEvent.initialize()),
      child: this,
    );
  }
}

class SearchWidgetState extends State<SearchWidget> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (ctx, state) {
        return Container(
          width: double.infinity,
          height: 46,
          margin: EdgeInsets.only(top: 15),
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(width: 16),
              Icon(Icons.location_on, color: Colors.black54, size: 20),
              SizedBox(width: 8),
              Expanded(child: Text(state.city ?? 'Finding', style: TextStyle(color: Colors.black54, fontSize: 14),maxLines: 1)),
              Stack(
                children: [
                  Positioned(
                    top: 24,
                    right: 4,
                    child: BlocBuilder<NotificationBloc, NotificationState>(
                      bloc: GetIt.I.get<NotificationBloc>(),
                      builder: (ctx, state) {
                        var realNotifications = state.notifications
                            .where((noti) =>
                        !noti.title.toLowerCase().contains('audio call') &&
                            !noti.title.toLowerCase().contains('video call'))
                            .toList();
                        var unreadNotifications = realNotifications.where((notification) => notification.isRead == 0).length;
                        if(unreadNotifications == 0) {
                          return Container();
                        } else {
                          return Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.darkYellow,
                            ),
                            child: Center(child: Text('$unreadNotifications', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: Constant.fontMedium))),
                          );
                        }
                      },
                    ),
                  ),
                  IconButton(onPressed: () {
                    Navigator.of(context).pushNamed(NotificationScreen.routName);
                  }, icon: Icon(Icons.notifications, color: Colors.black54, size: 20)),
                ],
              ),
              IconButton(onPressed: () {
                Navigator.of(context).pushNamed(SearchTherapyScreen.routName);
              }, icon: Icon(Icons.search, color: Colors.black54, size: 20))
            ],
          ),
        );
      }
    );
  }
}