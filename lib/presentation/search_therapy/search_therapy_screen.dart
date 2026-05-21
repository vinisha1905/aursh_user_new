import 'package:ayursh/application/search_therapy/search_therapy_bloc.dart';
import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/search_input_widget.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/presentation/widget/therapy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SearchTherapyScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/search_therapy';

  const SearchTherapyScreen({Key? key}) : super(key: key);

  @override
  SearchTherapyScreenState createState() {
    return SearchTherapyScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<SearchTherapyBloc>()
        ..add(SearchTherapyEvent.initialize()),
      child: this,
    );
  }
}

class SearchTherapyScreenState extends State<SearchTherapyScreen> {
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
          // SearchInputWidget('Search therapy...', (keyword) {
          //   context
          //       .read<SearchTherapyBloc>()
          //       .add(SearchTherapyEvent.search(keyword));
          // }),
          SearchInputWidget(
              'Search for knee pain, stroke care, postnatal, etc...',
              (keyword) {
            context
                .read<SearchTherapyBloc>()
                .add(SearchTherapyEvent.search(keyword));
          }),
          Expanded(child: Container(
              child: BlocBuilder<SearchTherapyBloc, SearchTherapyState>(
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
                return state.result?.fold((l) {
                      return Container();
                    }, (searchResponse) {
                      return ListView.builder(
                          padding: EdgeInsets.only(bottom: 16),
                          itemCount: searchResponse.therapies?.length ?? 0,
                          itemBuilder: (ctx, index) {
                            var therapy =
                                searchResponse.therapies?.elementAt(index);
                            return therapy != null
                                ? TherapyWidget(
                                    therapyModel: therapy,
                                    categoryTitle: therapy.categoryTitle)
                                : Container();
                          });
                    }) ??
                    Container();
              }
              return Container();
            },
          )))
        ],
      )),
    );
  }
}
