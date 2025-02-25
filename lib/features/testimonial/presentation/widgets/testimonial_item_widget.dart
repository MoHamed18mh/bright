import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class TestimonialItem extends StatelessWidget {
  const TestimonialItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpace.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // stucent image
          const CircleAvatar(
            backgroundImage: AssetImage(Assets.assetsImagesTestimonial1),
            radius: AppSpace.meduim1,
          ),
          const SizedBox(height: AppSpace.main),

          // student name
          Text(
            AppStrings.clientName,
            style: AppTextStyle.nunitoSans16LightBlackBold,
          ),
          const SizedBox(height: AppSpace.main),

          // student say
          Container(
            padding: const EdgeInsets.all(AppSpace.main),
            color: AppColors.primaryColor,
            child: const Text(
              AppStrings.temporErate,
              style: AppTextStyle.nunitoSans15WhiteBlod,
            ),
          ),
        ],
      ),
    );
  }
}
