import 'package:ayursh/application/search_doctor/search_doctor_bloc.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/doctor_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/search_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SearchDoctorScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/search_doctor';

  const SearchDoctorScreen({Key? key}) : super(key: key);

  @override
  SearchDoctorScreenState createState() {
    return SearchDoctorScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetIt.I.get<SearchDoctorBloc>()..add(SearchDoctorEvent.initialize()),
      child: this,
    );
  }
}

class SearchDoctorScreenState extends State<SearchDoctorScreen> {
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
          body: Column(
        children: [
          SizedBox(height: 30),
          SearchInputWidget('Search doctor...', (keyword) {
            context
                .read<SearchDoctorBloc>()
                .add(SearchDoctorEvent.search(keyword));
          }),
          Expanded(child:
              Container(child: BlocBuilder<SearchDoctorBloc, SearchDoctorState>(
            builder: (ctx, state) {
              if (state.loadingState == LoadingState.isLoading) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CircularProgressIndicator(
                          color: AppColors.darkYellow),
                    ),
                    Expanded(child: Container())
                  ],
                );
              }
              if (state.loadingState == LoadingState.isCompleted) {
                return state.doctors.isNotEmpty
                    ? ListView.builder(
                        padding: EdgeInsets.only(bottom: 16),
                        itemCount: state.doctors.length,
                        itemBuilder: (ctx, index) {
                          var doctor = state.doctors.elementAt(index);
                          return DoctorWidget(doctorModel: doctor);
                        })
                    : Container();
              }
              return Container();
            },
          )))
        ],
      )),
    );
  }
}
