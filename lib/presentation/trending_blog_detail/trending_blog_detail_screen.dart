import 'package:ayursh/domain/model/response/blog_model.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/dots_indicator_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TrendingBlogDetailArguments {
  final List<BlogModel> blogs;
  final int selectedIndex;

  const TrendingBlogDetailArguments(this.blogs, this.selectedIndex);
}

class TrendingBlogDetailScreen extends StatefulWidget {
  static final String routName = '/blog_detail';
  final TrendingBlogDetailArguments arguments;

  TrendingBlogDetailScreen({required this.arguments});

  @override
  _TrendingBlocDetailScreenState createState() {
    return _TrendingBlocDetailScreenState();
  }
}

class _TrendingBlocDetailScreenState extends State<TrendingBlogDetailScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        initialIndex: widget.arguments.selectedIndex,
        length: widget.arguments.blogs.length,
        vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(
              controller: tabController,
              children: widget.arguments.blogs
                  .map((e) => Container(
                      padding: EdgeInsets.only(top: 24),
                      child: CachedNetworkImage(
                        imageUrl: e.bigPhoto,
                        fit: BoxFit.fill,
                        progressIndicatorBuilder: (ctx, url, downloadProgess) {
                          return Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.darkYellow));
                        },
                      )))
                  .toList(),
            ),
            Positioned(
              top: 24,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 56,
                color: Colors.black12,
              ),
            ),
            Positioned(
              top: 24,
              left: 0,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  )),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 32,
              child: DotsIndicatorWidget(
                  widget.arguments.blogs.length, tabController.index, 10),
            )
          ],
        ),
      ),
    );
  }
}
