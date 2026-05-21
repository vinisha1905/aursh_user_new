import 'package:ayursh/domain/model/response/question_model.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/material.dart';

class AnswerOptionsWidget extends StatefulWidget {
  final QuestionModel question;
  final Function(int optionNumber) onSelectOption;
  final int? selectedOptionNumber;

  AnswerOptionsWidget(this.question, this.selectedOptionNumber, this.onSelectOption);

  @override
  AnswerOptionsWidgetState createState() {
    return AnswerOptionsWidgetState();
  }
}

class AnswerOptionsWidgetState extends State<AnswerOptionsWidget> {
  String _groupValue = '';

  @override
  void initState() {
    super.initState();
    if(widget.selectedOptionNumber != null) {
      _groupValue = widget.question.options[widget.selectedOptionNumber! - 1];
    } else {
      _groupValue = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _answerList(),
    );
  }

  List<Widget> _answerList() {
    List<Widget> answers = [];
    for(int i = 0 ; i< widget.question.options.length; i++) {
      String answer = widget.question.options[i];
      answers.add(Theme(
        data: ThemeData(
          //here change to your color
          unselectedWidgetColor: AppColors.grayLight,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              widget.onSelectOption(i+1);
              setState(() => _groupValue = answer);
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 8, 0, 8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightGreen),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Row(
                children: [
                  Expanded(
                    child: Text(answer,
                        style: TextStyle(
                            color: AppColors.darkGray,
                            fontSize: 12,
                            fontWeight: Constant.fontMedium)),
                  ),
                  Radio(
                    activeColor: AppColors.darkYellow,
                    materialTapTargetSize:
                    MaterialTapTargetSize.shrinkWrap,
                    value: answer,
                    groupValue: _groupValue,
                    onChanged: (newValue) {
                      widget.onSelectOption(i+1);
                      setState(() => _groupValue = newValue.toString());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
    }
    return answers;
  }
}
