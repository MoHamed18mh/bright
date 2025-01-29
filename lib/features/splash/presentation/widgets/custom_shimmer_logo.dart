import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerLogo extends StatelessWidget {
  const CustomShimmerLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Shimmer.fromColors(
        baseColor: AppColors.primaryColor,
        highlightColor: Colors.white,
        child: Image.asset(
          Assets.assetsImagesLogo,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
