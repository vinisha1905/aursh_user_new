import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/domain/util/size_utils.dart';
import 'package:ayursh/presentation/widget/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'api_state_widgets.dart';

Widget customButton({
  required VoidCallback? onTap,
  required String name,
  bool? isLoading,
  bool? isDisable,
  double? width,
  double? loadingWidgetSize,
  double? height,
  double? fontSize,
  double? imageSize,
  FontWeight? fontWeight,
  EdgeInsets? margin,
  EdgeInsets? padding,
  Color? buttonColor,
  Color? fontColor,
  bool? isOutLine,
  double? borderRadius,
  String? image,
  Color? imageColor,
  Color? borderColor,
  Color? imageContainerColor,
}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Padding(
        padding: margin ?? paddingH,
        child: Material(
          borderRadius: BorderRadius.circular(borderRadius ?? 6),
          // elevation: 5,
          color: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          // shadowColor: grey.shade100,
          child: InkWell(
            onTap: isLoading == true
                ? null
                : isDisable == true
                    ? null
                    : () {
                        hideKeyboard();
                        onTap!();
                      },
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
            child: Ink(
              height: height,
              width: width,
              padding: padding ?? const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color:
                    // isLoading == true
                    //     ? null
                    //     :
                    buttonColor ?? (isOutLine == true ? white : (isDisable == true ? grey200Color : primaryGreenColor)),
                borderRadius: BorderRadius.circular(borderRadius ?? 6),
                // border: Border.all(
                //   color: isLoading == true
                //       ? Colors.transparent
                //       : isOutLine == true
                //           ? primaryColor
                //           : Colors.transparent,
                // ),
                border: Border.all(color: borderColor ?? primaryGreenColor),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (image != null)
                      Container(
                        height: imageSize ?? 15,
                        width: imageSize ?? 15,
                        decoration: BoxDecoration(
                          color: imageContainerColor ?? (isOutLine == true ? primaryGreenColor.withOpacity(0.2) : white.withOpacity(0.2)),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            image,
                            height: 5.63,
                            colorFilter: imageColor != null || isOutLine == true ? ColorFilter.mode(imageColor ?? primaryGreenColor, BlendMode.srcIn) : null,
                            // color: imageColor ?? (isOutLine == true ? primaryColor : null),
                          ),
                        ),
                      ),
                    if (image != null) w(7.5),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: fontSize ?? 16,
                        fontWeight: fontWeight ?? FontWeight.w500,
                        color:
                            // isLoading == true
                            //     ? Colors.transparent
                            //     :
                            isOutLine == true ? fontColor ?? primaryGreenColor : fontColor ?? white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      if (isLoading == true)
        Padding(
          padding: margin ?? paddingH,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              loadingWidget(size: loadingWidgetSize ?? 18, color: isOutLine != true ? white : null),
              w(4),
            ],
          ),
        ),
    ],
  );
  // }
}
