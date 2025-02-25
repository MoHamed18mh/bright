import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/widgets/container_shimmer_widget.dart';
import 'package:flutter/material.dart';

class CustomInstructorShimmer extends StatelessWidget {
  const CustomInstructorShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpace.padding),
      color: Colors.grey.shade200,
      child: const Column(
        children: [
          ContainerShimmerWidget(
            height: AppSpace.size2,
            width: double.infinity,
          ),
          SizedBox(height: AppSpace.main),
          ContainerShimmerWidget(width: 150),
          SizedBox(height: AppSpace.small2),
          ContainerShimmerWidget(width: 210),
        ],
      ),
    );
  }
}
