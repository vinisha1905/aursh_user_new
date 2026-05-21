import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';

class DialogGenderWidget extends StatefulWidget {
  final Function(String gender) onSelectGender;

  DialogGenderWidget(this.onSelectGender);

  @override
  State<StatefulWidget> createState() {
    return DialogGenderWidgetState();
  }
}

class DialogGenderWidgetState extends State<DialogGenderWidget> {
  String _groupValue = 'Female';

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: TextWidget(
                  text: 'Gender',
                  fontSize: 14,
                  height: 14,
                  fontWeight: Constant.fontMedium,
                  textColor: AppColors.darkGray),
            )),
        Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Theme(
                  data: ThemeData(
                    //here change to your color
                    unselectedWidgetColor: AppColors.darkYellow,
                  ),
                  child: Row(
                    children: [
                      Radio(
                        activeColor: AppColors.darkYellow,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: 'Male',
                        groupValue: _groupValue,
                        onChanged: (newValue) {
                          widget.onSelectGender('Male');
                          setState(() => _groupValue = newValue.toString());
                        },
                      ),
                      GestureDetector(
                          onTap: () {
                            widget.onSelectGender('Male');
                            setState(() => _groupValue = 'Male');
                          },
                          child: Text('Male',
                              style: TextStyle(color: AppColors.darkGray)))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: AppColors.darkYellow,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: 'Female',
                      groupValue: _groupValue,
                      onChanged: (newValue) {
                        widget.onSelectGender('Female');
                        setState(() => _groupValue = newValue.toString());
                      }
                    ),
                    GestureDetector(
                        onTap: () {
                          widget.onSelectGender('Female');
                          setState(() => _groupValue = 'Female');
                        },
                        child: Text('Female',
                            style: TextStyle(color: AppColors.darkGray)))
                  ],
                )
              ],
            ))
      ],
    );
  }
}
