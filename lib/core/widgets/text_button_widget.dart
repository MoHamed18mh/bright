import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget(
      {super.key,
      required this.alignment,
      required this.onPressed,
      required this.text1,
      this.fontSize,
      this.text2});
  final Alignment alignment;
  final Function() onPressed;
  final String text1;
  final String? text2;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton(
        onPressed: onPressed,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: text1,
                style: AppTextStyle.nunitoSans20LightBlackBold.copyWith(
                  fontSize: fontSize,
                ),
              ),
              if (text2 != null)
                TextSpan(
                  text: text2,
                  style: AppTextStyle.notoSerif22PrimaryBold.copyWith(
                    fontSize: fontSize,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
