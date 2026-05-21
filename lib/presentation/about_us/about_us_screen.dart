import 'package:ayursh/application/about_us/about_us_bloc.dart';
import 'package:ayursh/domain/model/response/about_us_model.dart';
import 'package:ayursh/presentation/about_us_detail/about_us_detail_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/line_divider_widget.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AboutUsScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/about_us';

  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  AboutUsScreenState createState() {
    return AboutUsScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<AboutUsBloc>()..add(AboutUsEvent.initialize()),
      child: this,
    );
  }
}

class AboutUsScreenState extends State<AboutUsScreen> {
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
    return BlocBuilder<AboutUsBloc, AboutUsState>(
      builder: (ctx, state) {
        return SafeArea(
          child: Stack(
            children: [
              Scaffold(
                  appBar: AppBar(
                    title: Text('About Ayursh'),
                    leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back_rounded,
                            color: AppColors.darkGray)),
                  ),
                  body: state.aboutUsModels.isNotEmpty
                      ? ListView.builder(
                          itemCount: state.aboutUsModels.length,
                          itemBuilder: (ctx, index) {
                            return _aboutUsItem(state.aboutUsModels[index]);
                          })
                      : Container()),
              LoadingWidget(loadingState: state.loadingState)
            ],
          ),
        );
      },
    );
  }

  Widget _aboutUsItem(AboutUsModel model) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AboutUsDetailScreen.routName,
            arguments: AboutUsDetailArguments(model));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: model.thumbnail,
                      progressIndicatorBuilder: (ctx, url, downloadProgess) {
                        return Center(
                            child: CircularProgressIndicator(
                                color: AppColors.darkYellow));
                      },
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: 58,
                        height: 58,
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black26),
                        child: Center(
                            child: Icon(Icons.play_arrow,
                                color: Colors.white70, size: 50))),
                  )
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Text('${model.title}',
                  style: TextStyle(
                      fontSize: 16,
                      height: 1.3,
                      color: AppColors.darkGray,
                      fontWeight: Constant.fontMedium))),
          Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: LineDividerWidget())
        ],
      ),
    );
  }
}
