import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/widgets/container_shimmer_widget.dart';
import 'package:flutter/material.dart';

class CustomInstructorShimmer extends StatelessWidget {
  const CustomInstructorShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpace.paddingSpace),
      height: AppSpace.size5,
      color: Colors.grey.shade200,
      child: Column(
        children: [
          ContainerShimmerWidget(height: AppSpace.size2),
          const SizedBox(height: AppSpace.mainSpace),
          ContainerShimmerWidget(width: 150),
          const SizedBox(height: AppSpace.smallSpace),
          ContainerShimmerWidget(width: 210),
        ],
      ),
    );
  }
}
