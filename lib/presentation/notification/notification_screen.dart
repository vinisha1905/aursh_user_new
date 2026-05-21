import 'package:ayursh/application/notification/notification_bloc.dart';
import 'package:ayursh/domain/model/response/notification_model.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/line_divider_widget.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class NotificationScreen extends StatefulWidget {
  static final String routName = '/notification';

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  NotificationScreenState createState() {
    return NotificationScreenState();
  }
}

class NotificationScreenState extends State<NotificationScreen> {
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
      child: BlocBuilder<NotificationBloc, NotificationState>(
        bloc: GetIt.I.get<NotificationBloc>(),
        builder: (ctx, state) {
          var realNotifications = state.notifications
              .where((noti) =>
                  !noti.title.toLowerCase().contains('audio call') &&
                  !noti.title.toLowerCase().contains('video call'))
              .toList();
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text('Notifications'),
                  leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back_rounded,
                          color: AppColors.darkGray)),
                ),
                body: realNotifications.isNotEmpty
                    ? ListView.builder(
                        itemCount: realNotifications.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return _notificationWidget(realNotifications[index]);
                        })
                    : Container(),
              ),
              LoadingWidget(loadingState: state.loadingState)
            ],
          );
        },
      ),
    );
  }

  Widget _notificationWidget(NotificationModel notification) {
    var color;
    if (notification.title.toLowerCase().contains('payment')) {
      color = AppColors.yellowColor;
    } else if (notification.title.toLowerCase().contains('therapy')) {
      color = AppColors.darkBlue;
    } else {
      color = Colors.brown;
    }
    return GestureDetector(
      onTap: () {
        GetIt.I
            .get<NotificationBloc>()
            .add(NotificationEvent.setIsRead(notification));
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: notification.isRead == 1
                            ? Colors.transparent
                            : AppColors.darkYellow,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                      child: Text(notification.body,
                          style: TextStyle(color: AppColors.darkGray))),
                  SizedBox(width: 12),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    color: color,
                    child: Text(notification.title,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: Constant.fontMedium)),
                  )
                ],
              ),
              SizedBox(height: 6),
              Text(notification.timestamp,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: Constant.fontMedium,
                      color: AppColors.darkGray)),
              SizedBox(height: 12),
              LineDividerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
