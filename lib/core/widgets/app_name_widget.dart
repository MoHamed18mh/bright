import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({super.key, this.fontSize, this.alignment});

  final double? fontSize;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment?? Alignment.center,
      child: Text(
        AppStrings.appName,
        style: AppTextStyle.notoSerif38PrimaryBold.copyWith(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
