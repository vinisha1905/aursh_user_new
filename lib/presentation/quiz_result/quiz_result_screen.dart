import 'package:ayursh/domain/model/response/content_model.dart';
import 'package:ayursh/domain/model/response/result_model.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizResultArguments {
  final ResultModel resultModel;

  const QuizResultArguments(this.resultModel);
}

class QuizResultScreen extends StatelessWidget {
  static final String routName = '/quiz_result';
  final QuizResultArguments arguments;

  const QuizResultScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(''),
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon:
                    Icon(Icons.arrow_back_rounded, color: AppColors.darkGray)),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: AppColors.offWhite,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Container(
                      height: 110,
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              child: SvgPicture.asset(
                                  'assets/icons/bg_quiz_result.svg',
                                  height: 110,
                                  fit: BoxFit.fill)),
                          Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 16),
                                  TextWidget(
                                      text: 'Your predominant Dosha is',
                                      fontSize: 16,
                                      height: 21,
                                      fontWeight: Constant.fontMedium),
                                  SizedBox(height: 12),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Text('${arguments.resultModel.type}',
                                        style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: Constant.fontMedium,
                                            color: Colors.white)),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ]..addAll(arguments.resultModel.contents
                  .map((content) => _contentWidget(content))
                  .toList()),
            ),
          )),
    );
  }

  Widget _contentWidget(ContentModel content) {
    String icon = '';
    if (content.title == 'Characteristics') {
      icon = 'assets/icons/ic_characteristics.svg';
    } else if (content.title == 'Disorders') {
      icon = 'assets/icons/ic_disorders.svg';
    } else {
      icon = 'assets/icons/ic_treatment.svg';
    }

    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        SvgPicture.asset(icon, width: 50, height: 50),
                        SizedBox(width: 8),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: '${content.title}',
                                fontSize: 16,
                                height: 21,
                                textColor: AppColors.darkGray,
                                fontWeight: Constant.fontMedium),
                            Text('${content.subTitle}',
                                style: TextStyle(
                                    fontSize: 12,
                                    height: 1.3,
                                    color: AppColors.darkGray,
                                    fontWeight: Constant.fontLight)),
                          ],
                        ))
                      ],
                    ),
                  ),
                ]..addAll(
                    content.values.map((e) => _messageWidget(e)).toList()))),
        Container(
          height: 12,
          color: AppColors.offWhite,
        )
      ],
    );
  }

  Widget _messageWidget(String message) {
    return Padding(
        padding: EdgeInsets.only(top: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.darkBlue,
                  )),
            ),
            SizedBox(width: 6),
            Expanded(
                child: Text('$message',
                    style: TextStyle(color: AppColors.darkGray, height: 1.3)))
          ],
        ));
  }
}
