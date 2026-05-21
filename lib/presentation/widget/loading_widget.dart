import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final LoadingState loadingState;
  final Color? color;

  LoadingWidget({required this.loadingState, this.color = Colors.black26});

  @override
  Widget build(BuildContext context) {
    return loadingState == LoadingState.isLoading
        ? Container(
            color: color,
            width: double.infinity,
            height: double.infinity,
            child: Material(
                type: MaterialType.transparency,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                            color: AppColors.darkYellow),
                        SizedBox(width: 16),
                        TextWidget(
                            text: 'Please wait...',
                            fontSize: 12,
                            height: 16,
                            fontWeight: Constant.fontMedium,
                            textColor: AppColors.darkYellow)
                      ],
                    ),
                  ),
                )))
        : Container();
  }
}
