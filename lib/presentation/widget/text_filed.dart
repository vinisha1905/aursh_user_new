import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

hideKeyboard() {
  return FocusManager.instance.primaryFocus?.unfocus();
}

get getPrefixTextBoxContains => const BoxConstraints(minWidth: 0, minHeight: 0);

TextInputType get getNumberKeyBoardType => const TextInputType.numberWithOptions(decimal: true);

List<TextInputFormatter> get getDoubleInputFormatter => <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,3}')),
    ];

List<TextInputFormatter> get getIntegerInputFormatter => <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    ];

List<TextInputFormatter> get getNumberInputFormatterWithLength10 => <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,3}')),
      LengthLimitingTextInputFormatter(10),
    ];

Widget customTextFiled({
  String? label,
  String? hintText,
  TextStyle? textStyle,
  String? initialValue,
  FormFieldValidator? validator,
  TextInputType? keyboardType,
  TextEditingController? controller,
  bool? hasError,
  bool? obscureText,
  Widget? suffixIcon,
  Widget? prefixIcon,
  bool? isDisable,
  bool? isSelected,
  bool autofocus = false,
  Color? fillColor,
  int? maxLength,
  int? minLines,
  int? maxLines,
  ValueChanged<String>? onChanged,
  VoidCallback? onTap,
  bool? readOnly,
  EdgeInsetsGeometry? contentPadding,
  BorderRadius? borderRadius,
  Color? hintTextColor,
  Color? borderColor,
  String? prefixText,
  BoxConstraints? prefixIconConstraints,
  BoxConstraints? suffixIconConstraints,
  List<TextInputFormatter>? inputFormatters,
  TextCapitalization textCapitalization = TextCapitalization.none,
  TextInputAction? textInputAction,
  Function(String)? onFieldSubmitted,
  FocusNode? focusNode,
  TextAlign textAlign = TextAlign.start,
}) {
  return TextFormField(
    initialValue: initialValue,
    autofocus: autofocus,
    textAlign: textAlign,
    focusNode: focusNode,
    onFieldSubmitted: onFieldSubmitted,
    textInputAction: textInputAction,
    textCapitalization: textCapitalization,
    controller: controller,
    keyboardType: keyboardType ?? TextInputType.text,
    style: isDisable == true ? disableTextFiledTextStyle : (textStyle ?? textFiledTextStyle),
    validator: validator,
    onChanged: onChanged,
    onTap: onTap,
    readOnly: readOnly ?? false,
    minLines: minLines,
    maxLines: maxLines,
    maxLength: maxLength,
    obscureText: obscureText ?? false,
    inputFormatters: inputFormatters,
    decoration: getTextFiledDecoration(
      suffixIcon: suffixIcon,
      hintText: hintText,
      label: label,
      prefixIcon: prefixIcon,
      hasError: hasError,
      isDisable: isDisable,
      isSelected: isSelected,
      contentPadding: contentPadding,
      borderRadius: borderRadius,
      fillColor: fillColor,
      hintTextColor: hintTextColor,
      borderColor: borderColor,
      prefixText: prefixText,
      prefixIconConstraints: prefixIconConstraints,
      suffixIconConstraints: suffixIconConstraints,
    ),
  );
}

getTextFiledDecoration({
  String? label,
  Widget? suffixIcon,
  Widget? prefixIcon,
  String? hintText,
  String? prefixText,
  bool? hasError,
  bool? isDisable,
  bool? isSelected,
  EdgeInsetsGeometry? contentPadding,
  BorderRadius? borderRadius,
  Color? hintTextColor,
  Color? fillColor,
  Color? borderColor,
  BoxConstraints? prefixIconConstraints,
  BoxConstraints? suffixIconConstraints,
}) {
  return InputDecoration(
    errorMaxLines: 2,
    enabled: !(isDisable ?? false),
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    prefixText: prefixText,
    prefixIcon: prefixIcon,
    prefixIconConstraints: prefixIconConstraints,
    suffixIconConstraints: suffixIconConstraints,
    suffixIcon: suffixIcon,
    labelStyle: labelTextFiledTextStyle,
    // labelText: label,
    label: label != null
        ? RichText(
            text: TextSpan(
              style: labelTextFiledTextStyle,
              children: <TextSpan>[
                TextSpan(
                  text: (label).replaceAll("*", ""),
                ),
                if ((label).contains("*"))
                  const TextSpan(
                    text: '*',
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          )
        : null,
    hintText: hintText,
    hintStyle: hintTextFiledTextStyle,
    errorStyle: TextStyle(
      color: errorColor,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    filled: fillColor != null ? true : isSelected,
    fillColor: fillColor ?? secondaryColor,
    contentPadding: contentPadding,

    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryGreenColor, width: 1.5),
      borderRadius: borderRadius ?? BorderRadius.circular(6),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? (isSelected == true ? primaryGreenColor : cardColor), width: 1.5),
      borderRadius: borderRadius ?? BorderRadius.circular(6),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: errorColor, width: 1.5),
      borderRadius: borderRadius ?? BorderRadius.circular(6),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: errorColor, width: 1.5),
      borderRadius: borderRadius ?? BorderRadius.circular(6),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? cardColor, width: 1.5),
      borderRadius: borderRadius ?? BorderRadius.circular(6),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? (isSelected == true ? primaryGreenColor : cardColor), width: 1.5),
      borderRadius: borderRadius ?? BorderRadius.circular(6),
    ),
    counterStyle: const TextStyle(fontSize: 0),
    counterText: "",
  );
}

FormFieldValidator emailValidator(BuildContext context, {bool? isOptional}) {
  return (value) {
    if (isOptional == true) {
      if (value.toString().trim() == "") {
        return null;
      }
    }

    if (value!.isEmpty) {
      // context.read<AuthVM>().setEmailError(true);
      return "Please enter email address";
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      // context.read<AuthVM>().setEmailError(true);
      return "Please enter a valid email address";
    }
    // context.read<AuthVM>().setEmailError(false);

    return null;
  };
}

FormFieldValidator commonValidator({required String title, bool? isForDropDown}) {
  return (value) {
    String valueN = (value ?? "").toString().trim();
    if (valueN != "") {
      return null;
    }
    return "Please ${isForDropDown == true ? "Select" : "Enter"} $title";
  };
}

FormFieldValidator pinCodeValidator() {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter pin code';
    } else if (value.length < 6) {
      return 'Pin code must be 6 digits';
    }
    return null;
  };
}
