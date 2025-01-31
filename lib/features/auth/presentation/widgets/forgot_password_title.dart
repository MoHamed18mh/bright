import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ForgotPasswordTitle extends StatelessWidget {
  const ForgotPasswordTitle(
      {super.key, required this.text1, required this.text2});
  final String text1, text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: AppTextStyle.nunitoSans26LightBlackBold,
        ),
        SizedBox(height: AppSpace.smallSpace),
        Text(
          text2,
          style: AppTextStyle.nunitoSans13Grey700,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
