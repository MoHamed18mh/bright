import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/container_shimmer_widget.dart';
import 'package:bright/features/course/models/course_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CourseItemWidget extends StatelessWidget {
  const CourseItemWidget({super.key, required this.courseItem});

  final CourseItem courseItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigate(context, RouteKey.courseDetailsView, extra: courseItem);
      },
      child: Container(
        margin: const EdgeInsets.all(AppSpace.padding),
        color: AppColors.primaryHighLight,
        child: Column(
          children: [
            //  image
            CachedNetworkImage(
              imageUrl: courseItem.pictureUrl,
              height: AppSpace.size1,
              width: double.infinity,
              memCacheHeight: 230,
              fit: BoxFit.cover,
              placeholder: (context, url) => const ContainerShimmerWidget(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(height: AppSpace.main),

            //  price
            Text(
              '${courseItem.price} \$',
              style: AppTextStyle.nunitoSans26LightBlackBold,
            ),
            const SizedBox(height: AppSpace.small2),

            //  course name
            Text(
              courseItem.name,
              style: AppTextStyle.nunitoSans22LightBlackBold,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpace.small2),

            //  insturctor name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, color: AppColors.primaryColor),
                Text(
                  courseItem.instructorName,
                  style: AppTextStyle.nunitoSans16LightBlackBold,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
