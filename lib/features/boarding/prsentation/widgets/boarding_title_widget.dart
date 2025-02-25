import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/boarding/models/boarding_model.dart';
import 'package:flutter/material.dart';

class BoardingTitleWidget extends StatelessWidget {
  const BoardingTitleWidget(
      {super.key, required this.index, required this.isLastPage});

  final int index;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: boardingData[index].title,
            style: AppTextStyle.nunitoSans22LightBlackBold,
          ),
          if (!isLastPage)
            TextSpan(
              text: AppStrings.appName,
              style: AppTextStyle.notoSerif25PrimaryBold,
            ),
        ],
      ),
    );
  }
}
