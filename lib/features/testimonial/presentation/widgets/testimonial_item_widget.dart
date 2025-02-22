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
      margin: EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(Assets.assetsImagesTestimonial1),
            radius: AppSpace.mainSpace,
          ),
          const SizedBox(height: AppSpace.mainSpace),
          //
          Text(
            AppStrings.clientName,
            style: AppTextStyle.nunitoSans16LightBlackBold,
          ),
          const SizedBox(height: AppSpace.mainSpace),
          //
          Container(
            padding: const EdgeInsets.all(AppSpace.mainSpace),
            color: AppColors.primaryColor,
            child: Text(
              AppStrings.temporErate,
              style: AppTextStyle.nunitoSans15WhiteBlod,
            ),
          ),
        ],
      ),
    );
  }
}
