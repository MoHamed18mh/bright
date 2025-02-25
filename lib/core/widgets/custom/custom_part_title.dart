import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/left_decoration_lines_widget.dart';
import 'package:bright/core/widgets/rigth_decoration_lines_widget.dart';
import 'package:flutter/material.dart';

class CustomPartTitle extends StatelessWidget {
  const CustomPartTitle({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LeftDecorationLinesWidget(),
            const SizedBox(width: 5),
            Text(
              title,
              style: AppTextStyle.notoSerif25PrimaryBold,
            ),
            const SizedBox(width: 5),
            const RightDecorationLinesWidget(),
          ],
        ),
        Text(
          subTitle,
          style: AppTextStyle.nunitoSans22LightBlackBold,
        ),
        const SizedBox(height: AppSpace.meduim2),
      ],
    );
  }
}
