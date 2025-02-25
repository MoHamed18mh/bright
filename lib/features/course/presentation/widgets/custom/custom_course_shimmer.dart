import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/widgets/container_shimmer_widget.dart';
import 'package:flutter/material.dart';

class CustomCourseShimmer extends StatelessWidget {
  const CustomCourseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpace.padding),
      color: Colors.grey.shade200,
      child: const Column(
        children: [
          ContainerShimmerWidget(
            height: AppSpace.size1,
            width: double.infinity,
          ),
          SizedBox(height: AppSpace.main),
          ContainerShimmerWidget(
            width: AppSpace.max2,
            height: AppSpace.small2,
          ),
          SizedBox(height: AppSpace.small2),
          ContainerShimmerWidget(width: 220),
          SizedBox(height: AppSpace.small2),
          ContainerShimmerWidget(width: 200),
        ],
      ),
    );
  }
}
