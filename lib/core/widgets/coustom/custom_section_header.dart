import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/left_decoration_lines_widget.dart';
import 'package:bright/core/widgets/rigth_decoration_lines_widget.dart';
import 'package:flutter/material.dart';

class CustomSectionHeader extends StatelessWidget {
  const CustomSectionHeader(
      {super.key, required this.title, required this.subTitle});
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LeftDecorationLinesWidget(),
            const SizedBox(width: 5),
            Text(
              title,
              style: AppTextStyle.notoSerif25PrimaryBold,
            ),
            const SizedBox(width: 5),
            RightDecorationLinesWidget(),
          ],
        ),
        Text(
          subTitle,
          style: AppTextStyle.nunitoSans22LightBlackBold,
        ),
      ],
    );
  }
}
