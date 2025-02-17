import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/widgets/container_shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InstructorImageWidget extends StatelessWidget {
  const InstructorImageWidget({
    super.key,
    required this.imageCover,
  });

  final String imageCover;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageCover,
          fit: BoxFit.cover,
          height: AppSpace.maxSpace4,
          width: AppSpace.maxSpace3,
          placeholder: (context, url) => ContainerShimmerWidget(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
