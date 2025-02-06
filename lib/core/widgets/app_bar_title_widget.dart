import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.appName,
      style: AppTextStyle.notoSerif25PrimaryBold,
    );
  }
}