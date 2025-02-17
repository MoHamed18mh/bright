import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/coustom/custom_section_header.dart';
import 'package:bright/features/home/presentation/widgets/about_skills_widget.dart';
import 'package:flutter/material.dart';

class AboutUsInfoWidget extends StatelessWidget {
  const AboutUsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
      child: Column(
        children: [
          CustomSectionHeader(
            title: AppStrings.aboutUs,
            subTitle: AppStrings.wellcomTo,
          ),
          const SizedBox(height: AppSpace.mainSpace),

          // ************ about information
          Text(
            AppStrings.temporErateAtClita,
            style: AppTextStyle.nunitoSans16LightBlackBold,
            softWrap: true,
          ),
          const SizedBox(height: AppSpace.mainSpace),
          Text(
            AppStrings.temporErate,
            style: AppTextStyle.nunitoSans16LightBlackBold,
            softWrap: true,
          ),
          SizedBox(height: AppSpace.mainSpace),
          //
          SkillsAboutWidget()
        ],
      ),
    );
  }
}
