import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/container_shimmer_widget.dart';
import 'package:bright/features/instructor/models/instructor_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomInstructorItem extends StatelessWidget {
  const CustomInstructorItem({
    super.key,
    required this.instructorItem,
  });

  final InstructorItem instructorItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigate(
        context,
        RouteKey.instructorDetailsView,
        extra: instructorItem,
      ),
      child: Container(
        margin: const EdgeInsets.all(AppSpace.padding),
        color: AppColors.primaryHighLight,
        child: Column(
          children: [
            // instructor image
            CachedNetworkImage(
              imageUrl: instructorItem.imageCover,
              height: AppSpace.size2,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const ContainerShimmerWidget(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(height: AppSpace.main),

            // instructor name
            Text(
              instructorItem.displayName,
              style: AppTextStyle.nunitoSans22LightBlackBold,
            ),

            // instructor job
            Text(
              instructorItem.jobTitle,
              style: AppTextStyle.nunitoSans14Grey800,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
