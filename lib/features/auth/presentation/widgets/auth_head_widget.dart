import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class AuthHeadWidget extends StatelessWidget {
  const AuthHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        AppStrings.appName,
        style: AppTextStyle.notoSerif38PrimaryBold,
      ),
    );
  }
}
