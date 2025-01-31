import 'package:bright/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContainerShimmerWidget extends StatelessWidget {
  const ContainerShimmerWidget({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 20,
      width: width,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: AppColors.white,
        child: Container(
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
