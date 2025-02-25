import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/boarding/models/boarding_model.dart';
import 'package:bright/features/boarding/prsentation/widgets/boarding_title_widget.dart';
import 'package:bright/features/boarding/prsentation/widgets/smooth_page_indicator_widget.dart';
import 'package:flutter/material.dart';

class BoardingItemWidget extends StatelessWidget {
  const BoardingItemWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          boardingData[index].imagePath,
          height: AppSpace.max5,
          fit: BoxFit.fill,
        ),
        const SmoothPageIndicatorWidget(),
        const SizedBox(height: AppSpace.main),
        BoardingTitleWidget(
          index: index,
          isLastPage: index == boardingData.length - 1,
        ),
        Text(
          boardingData[index].subTitle,
          textAlign: TextAlign.center,
          style: AppTextStyle.nunitoSans13Grey700,
        ),
      ],
    );
  }
}
