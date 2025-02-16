import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/home/models/about_model.dart';
import 'package:flutter/material.dart';

class AboutSkillsWidget extends StatelessWidget {
  const AboutSkillsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        skills.length,
        (int index) => Row(
          children: [
            Icon(
              Icons.arrow_forward,
              color: AppColors.primaryColor,
            ),
            Text(
              skills[index],
              style: AppTextStyle.nunitoSans16LightBlackBold,
            ),
          ],
        ),
      ),
    );
  }
}
