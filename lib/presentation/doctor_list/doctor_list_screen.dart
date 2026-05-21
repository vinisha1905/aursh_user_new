import 'package:ayursh/application/doctor/doctor_bloc.dart';
import 'package:ayursh/domain/model/business/session_selected_info.dart';
import 'package:ayursh/presentation/search_doctor/search_doctor_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/doctor_widget.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DoctorListArguments {
  final SessionSelectedInfo? sessionSelectedInfo;

  const DoctorListArguments({this.sessionSelectedInfo});
}

class DoctorListScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/doctor_list';
  final DoctorListArguments arguments;

  const DoctorListScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  DoctorListScreenState createState() {
    return DoctorListScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<DoctorBloc>()
        ..add(DoctorEvent.initialize(arguments.sessionSelectedInfo))
        ..add(DoctorEvent.getDoctors()),
      child: this,
    );
  }
}

class DoctorListScreenState extends State<DoctorListScreen> {
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
      child: Scaffold(
          appBar: AppBar(
            title: Text('Doctor Consultation',
                style: TextStyle(
                    color: AppColors.darkGray,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon:
                    Icon(Icons.arrow_back_rounded, color: AppColors.darkGray)),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(SearchDoctorScreen.routName);
                  },
                  icon: Icon(Icons.search, color: AppColors.darkGray))
            ],
          ),
          body: BlocBuilder<DoctorBloc, DoctorState>(
            builder: (ctx, state) {
              return Stack(
                children: [
                  Container(
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 16),
                      itemCount: state.doctors.length,
                      itemBuilder: (ctx, index) {
                        return DoctorWidget(
                            doctorModel: state.doctors.elementAt(index),
                            sessionSelectedInfo: state.sessionSelectedInfo);
                      },
                    ),
                  ),
                  LoadingWidget(loadingState: state.loadingState)
                ],
              );
            },
          )),
    );
  }
}
