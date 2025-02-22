import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/widgets/container_shimmer_widget.dart';
import 'package:flutter/material.dart';

class CustomCourseShimmer extends StatelessWidget {
  const CustomCourseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpace.paddingSpace),
      color: Colors.grey.shade200,
      child: Column(
        children: [
          ContainerShimmerWidget(
            height: AppSpace.size1,
            width: double.infinity,
          ),
          const SizedBox(height: AppSpace.mainSpace),
          ContainerShimmerWidget(
            width: 130,
            height: 35,
          ),
          const SizedBox(height: AppSpace.smallSpace),
          ContainerShimmerWidget(width: 220),
          const SizedBox(height: AppSpace.smallSpace),
          ContainerShimmerWidget(width: 200),
        ],
      ),
    );
  }
}