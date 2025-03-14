import 'package:bright/core/functions/validate_fields.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.text,
    this.prefixIcon,
    this.controller,
  });
  final String text;
  final Icon? prefixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyle.nunitoSans16LightBlackBold,
      controller: controller,
      validator: validatFields,
      cursorColor: AppColors.lightBlack,
      decoration: inputDecoration(),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      prefixIcon: prefixIcon,
      prefixIconColor: AppColors.primaryColor,
      label: Text(
        text,
        style: AppTextStyle.nunitoSans13Grey700,
      ),
      hintStyle: AppTextStyle.nunitoSans13Grey700,
      suffixIconColor: AppColors.primaryColor,
      border: outLineInputBorder(),
      enabledBorder: outLineInputBorder(),
      focusedBorder: outLineInputBorder(),
      errorBorder: outLineInputBorder(),
    );
  }

  OutlineInputBorder outLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }
}
