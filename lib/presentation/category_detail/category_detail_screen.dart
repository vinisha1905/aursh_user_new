import 'package:ayursh/application/category_detail/category_detail_bloc.dart';
import 'package:ayursh/domain/model/response/therapy_short_model.dart';
import 'package:ayursh/presentation/category_detail/widget/category_widget.dart';
import 'package:ayursh/presentation/category_detail/widget/description_widget.dart';
import 'package:ayursh/presentation/category_detail/widget/faq_widget.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/therapy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CategoryDetailArguments {
  final String? title;
  final String? type;

  const CategoryDetailArguments({this.title, this.type});
}

class CategoryDetailScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/category_detail';
  final CategoryDetailArguments arguments;

  const CategoryDetailScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  CategoryDetailScreenState createState() {
    return CategoryDetailScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<CategoryDetailBloc>()
        ..add(CategoryDetailEvent.initialize(arguments.type))
        ..add(CategoryDetailEvent.getCategoryDetail(arguments.title)),
      child: this,
    );
  }
}

class CategoryDetailScreenState extends State<CategoryDetailScreen> {
  late ItemScrollController categoriesController;

  @override
  void initState() {
    super.initState();
    categoriesController = ItemScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    // categoriesController = null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<CategoryDetailBloc, CategoryDetailState>(
          listener: (ctx, state) async {
        if (state.title != null &&
            state.categories.isNotEmpty &&
            state.categoryDetailModel == null) {
          await Future.delayed(Duration(milliseconds: 300));
          var index = state.categories.indexOf(
              state.categories.firstWhere((cate) => cate.title == state.title));
          categoriesController.scrollTo(
              index: index > 0 ? index - 1 : index,
              duration: Duration(milliseconds: 200));
        }
      }, builder: (ctx, state) {
        var name = '';
        if (state.title != null && state.categories.isNotEmpty) {
          name = state.categories
              .firstWhere((category) => category.title == state.title)
              .name;
        }
        return Stack(
          children: [
            Scaffold(
                backgroundColor: AppColors.offWhite,
                appBar: AppBar(
                  title: Text(name),
                  leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back_rounded,
                          color: AppColors.darkGray)),
                ),
                body: SingleChildScrollView(
                  child: Column(children: [
                    _categoriesWidget(state),
                    DescriptionWidget(
                        state.categoryDetailModel?.descriptions ?? []),
                    _therapiesWidget(state.categoryDetailModel?.therapies ?? [],
                        state.title),
                    FaqWidget(state.categoryDetailModel?.faq ?? []),
                    SizedBox(height: 24)
                  ]),
                )),
            LoadingWidget(loadingState: state.loadingState)
          ],
        );
      }),
    );
  }

  Widget _categoriesWidget(CategoryDetailState state) {
    return (state.title != null && state.categories.isNotEmpty)
        ? Container(
            height: 60,
            child: ScrollablePositionedList.builder(
                itemScrollController: categoriesController,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (ctx, index) {
                  if (index == state.categories.length - 1) {
                    return CategoryWidget(state.categories[index],
                        state.categories[index].title == state.title, (title) {
                      context
                          .read<CategoryDetailBloc>()
                          .add(CategoryDetailEvent.getCategoryDetail(title));
                    });
                  } else {
                    return Row(
                      children: [
                        CategoryWidget(state.categories[index],
                            state.categories[index].title == state.title,
                            (title) {
                          context.read<CategoryDetailBloc>().add(
                              CategoryDetailEvent.getCategoryDetail(title));
                        }),
                        SizedBox(width: 12)
                      ],
                    );
                  }
                }),
          )
        : Container();
  }

  Widget _therapiesWidget(List<TherapyShortModel> therapies, String? title) {
    if (therapies.isEmpty) {
      return Container();
    }
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 16),
        itemCount: therapies.length,
        itemBuilder: (ctx, index) {
          var therapy = therapies.elementAt(index);
          return TherapyWidget(therapyModel: therapy, categoryTitle: title);
        });
  }
}
