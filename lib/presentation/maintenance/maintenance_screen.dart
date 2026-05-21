import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:flutter/material.dart';

class MaintenanceScreen extends StatelessWidget {
  static final String routName = '/maintenance';

  const MaintenanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        color: Colors.white,
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
            heightFactor: 0.75,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      'The app is under maintenance.\nWe will be back shortly.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          height: 1.4,
                          fontWeight: Constant.fontMedium,
                          color: AppColors.darkGray)),
                  SizedBox(height: 28),
                  Image.asset(
                    'assets/icons/ic_maintenance.png',
                    fit: BoxFit.fill,
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            )),
      )),
    );
  }
}
