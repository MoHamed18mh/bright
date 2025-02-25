import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/custom/custom_part_title.dart';
import 'package:bright/features/home/presentation/widgets/about_skills_widget.dart';
import 'package:flutter/material.dart';

class AboutUsInfoWidget extends StatelessWidget {
  const AboutUsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.padding),
      child: Column(
        children: [
          const CustomPartTitle(
            title: AppStrings.aboutUs,
            subTitle: AppStrings.wellcomTo,
          ),

          //  about information
          Text(
            AppStrings.temporErateAtClita,
            style: AppTextStyle.nunitoSans16LightBlackBold,
            softWrap: true,
          ),
          const SizedBox(height: AppSpace.main),
          Text(
            AppStrings.temporErate,
            style: AppTextStyle.nunitoSans16LightBlackBold,
            softWrap: true,
          ),
          const SizedBox(height: AppSpace.main),
          const SkillsAboutWidget()
        ],
      ),
    );
  }
}
