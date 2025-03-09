import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_space.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomTextFiled extends StatelessWidget {
  String text;

  CustomTextFiled({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpace.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(text, style: AppTextStyle.notoSerif22LightBlackBold),
            TextFormField(
              cursorColor: Colors.black26,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primaryColor, width: 1.2),
                      borderRadius: BorderRadius.circular(16)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 1.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: text,
                  hintStyle: AppTextStyle.nunitoSans18LightBlackBold
                      .copyWith(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
