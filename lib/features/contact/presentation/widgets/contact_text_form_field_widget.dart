import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ContactTextFormFieldWidget extends StatelessWidget {
  const ContactTextFormFieldWidget({
    super.key,
    required this.text,
    this.controller,
    this.maxLines,
  });
  final String text;
  final int? maxLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyle.nunitoSans16LightBlackBold,
      controller: controller,
      maxLines: maxLines ?? 1,
      cursorColor: AppColors.lightBlack,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: AppTextStyle.nunitoSans13Grey700,
        border: outLineInputBorder(),
        enabledBorder: outLineInputBorder(),
        focusedBorder: outLineFocuseBorder(),
        errorBorder: outLineInputBorder(),
      ),
    );
  }

  OutlineInputBorder outLineFocuseBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }

  OutlineInputBorder outLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.lightBlack, width: 1),
    );
  }
}
