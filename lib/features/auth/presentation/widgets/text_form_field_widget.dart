import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      required this.text,
      required this.prefixIcon,
      this.suffixIcon,
      this.obscureText});
  final String text;
  final Icon prefixIcon;
  final Icon? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyle.nunitoSans16LightBlackBold,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.primaryColor,
        hintText: text,
        hintStyle: AppTextStyle.nunitoSans13grey,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.primaryColor,
        border: outLineInputBorder(),
        enabledBorder: outLineInputBorder(),
        focusedBorder: outLineInputBorder(),
        errorBorder: outLineInputBorder(),
      ),
    );
  }

  OutlineInputBorder outLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }
}
