import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerText extends StatelessWidget {
  const CustomShimmerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primaryColor,
      highlightColor: Colors.white,
      child: Text(
        AppStrings.appName,
        style: AppTextStyle.notoSerif37PrimaryBold,
      ),
    );
  }
}