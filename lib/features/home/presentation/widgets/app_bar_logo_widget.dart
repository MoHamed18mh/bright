import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:flutter/material.dart';

class AppBarLogoWidget extends StatelessWidget {
  const AppBarLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.assetsImagesLogo,
      height: AppSpace.meduim1,
      color: AppColors.primaryColor,
    );
  }
}
