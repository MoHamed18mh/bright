import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CoursePriceWidget extends StatelessWidget {
  const CoursePriceWidget({
    super.key,
    required this.price,
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpace.padding),
          child: Text.rich(TextSpan(
            text: '${AppStrings.price}: ',
            style: AppTextStyle.nunitoSans22LightBlackBold,
            children: [
              TextSpan(
                text: '$price\$',
                style: AppTextStyle.notoSerif20PrimaryBold,
              ),
            ],
          ))),
    );
  }
}
