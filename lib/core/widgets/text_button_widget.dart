import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({super.key, required this.alignment, required this.onPressed});
  final Alignment alignment;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          AppStrings.skip,
          style: AppTextStyle.nunitoSans20LightBlackBold,
        ),
      ),
    );
  }
}
