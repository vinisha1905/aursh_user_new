import 'package:ayursh/application/quiz/quiz_bloc.dart';
import 'package:ayursh/domain/model/response/question_model.dart';
import 'package:ayursh/presentation/quiz/widget/answer_options_widget.dart';
import 'package:ayursh/presentation/quiz_result/quiz_result_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class QuizScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/quiz';

  @override
  QuizScreenState createState() {
    return QuizScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<QuizBloc>()..add(QuizEvent.initialize()),
      child: this,
    );
  }
}

class QuizScreenState extends State<QuizScreen> {
  String _groupValue = 'Female';
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: BlocConsumer<QuizBloc, QuizState>(listener: (ctx, state) {
          if (state.selectedIndex != null) {
            _pageController.jumpToPage(state.selectedIndex!);
          }
          if (state.answerResult != null) {
            state.answerResult!.fold((error) => Constant.showError(error), (r) {
              Navigator.of(context).pushNamed(QuizResultScreen.routName,
                  arguments: QuizResultArguments(r.resultModel!));
            });
            context.read<QuizBloc>().add(QuizEvent.cleanResult());
          }
        }, listenWhen: (state1, state2) {
          return true;
        }, builder: (ctx, state) {
          var message = state.questionGetModel?.headline ?? '';
          return Stack(
            children: [
              Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: Text('Know Your Prakruti'),
                    leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back_rounded,
                            color: AppColors.darkGray)),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset('assets/icons/bg_quiz.svg'),
                        Text('$message',
                            style: TextStyle(
                                color: AppColors.darkGray,
                                height: 1.4,
                                fontSize: 16,
                                fontWeight: Constant.fontMedium),
                            textAlign: TextAlign.center),
                        PrimaryButtonWidget(
                            title: 'Take Quiz',
                            onTap: () {
                              context
                                  .read<QuizBloc>()
                                  .add(QuizEvent.nextQuestion());
                            },
                            isEnable: state.questionGetModel != null)
                      ],
                    ),
                  )),
              state.questionGetModel != null
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        color: Colors.black26,
                        height: state.selectedIndex == null ? 0 : height,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: GestureDetector(
                                    onTap: () {
                                      context
                                          .read<QuizBloc>()
                                          .add(QuizEvent.reset());
                                    },
                                    child:
                                        Container(color: Colors.transparent))),
                            Expanded(
                                flex: 8,
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    child: Container(
                                        color: Colors.white,
                                        child: PageView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          controller: _pageController,
                                          children: _questionPages(
                                              state,
                                              state
                                                  .questionGetModel!.questions),
                                        )),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )
                  : Container(),
              LoadingWidget(loadingState: state.loadingState)
            ],
          );
        }),
      ),
    );
  }

  Widget _questionPage(
      int questionNumber, QuizState state, QuestionModel questionModel) {
    if (state.selectedIndex == null) {
      return Container();
    }
    bool isEnable = state.answers![state.selectedIndex] != null;
    var questionIndexText =
        'Question $questionNumber/${state.answers!.length - 1}';
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(26, 32, 26, 24),
          child: Column(
            children: [
              Text('$questionIndexText'),
              SizedBox(height: 18),
              Text('${questionModel.question}',
                  style: TextStyle(
                      color: AppColors.darkGray,
                      fontWeight: Constant.fontMedium,
                      fontSize: 16)),
              SizedBox(height: 26),
              AnswerOptionsWidget(
                  questionModel, state.answers![state.selectedIndex],
                  (optionNumber) {
                context
                    .read<QuizBloc>()
                    .add(QuizEvent.setAnswerId(optionNumber));
              }),
              Expanded(child: Container()),
              PrimaryButtonWidget(
                  title: 'Next',
                  onTap: () {
                    context.read<QuizBloc>().add(QuizEvent.nextQuestion());
                  },
                  isEnable: isEnable)
            ],
          ),
        ),
        (state.selectedIndex ?? 0) > 0
            ? Positioned(
                top: 16,
                left: 16,
                child: InkWell(
                  onTap: () {
                    context.read<QuizBloc>().add(QuizEvent.previousQuestion());
                  },
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new_rounded,
                          color: AppColors.darkBlue, size: 16),
                      SizedBox(width: 8),
                      Text('Previous',
                          style: TextStyle(
                              color: AppColors.darkBlue,
                              fontWeight: Constant.fontMedium))
                    ],
                  ),
                ),
              )
            : Container()
      ],
    );
  }

  List<Widget> _questionPages(QuizState state, List<QuestionModel> questions) {
    List<Widget> pages = [];
    for (int i = 0; i < questions.length; i++) {
      QuestionModel question = questions[i];
      pages.add(_questionPage(i + 1, state, question));
    }
    return pages;
  }
}
