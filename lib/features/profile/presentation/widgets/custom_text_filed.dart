import 'package:bright/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomTextFiled extends StatelessWidget {
  late String text;

  CustomTextFiled({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
          cursorColor: Colors.black26,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.primaryColor, width: 1.2),
                borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.2),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.2),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.2),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: text,
            hintStyle: AppTextStyle.notoSerif20PrimaryBold.copyWith(
              color: Colors.grey[500],
            ),
          ),
        ),
      ),
    );
  }
}
