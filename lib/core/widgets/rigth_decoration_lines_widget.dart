import 'package:bright/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RightDecorationLinesWidget extends StatelessWidget {
  const RightDecorationLinesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 3,
          width: size.width / 6,
          color: AppColors.primaryColor,
        ),
        const SizedBox(height: 5),
        Container(
          height: 3,
          width: size.width / 4.5,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
