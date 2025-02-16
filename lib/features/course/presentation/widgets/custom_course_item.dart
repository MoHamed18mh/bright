import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/container_shimmer_widget.dart';
import 'package:bright/features/course/models/course_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCourseItem extends StatelessWidget {
  const CustomCourseItem({super.key, required this.courseItem});

  final CourseItem courseItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpace.paddingSpace),
      color: AppColors.primaryHighLight,
      child: Column(
        children: [
          // ********************* image
          CachedNetworkImage(
            imageUrl: courseItem.pictureUrl,
            height: AppSpace.size1,
            width: double.infinity,
            memCacheHeight: 250,
            fit: BoxFit.cover,
            placeholder: (context, url) => ContainerShimmerWidget(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          const SizedBox(height: AppSpace.mainSpace),

          // ********************** price
          Text(
            '${courseItem.price}\$',
            style: AppTextStyle.nunitoSans26LightBlackBold,
          ),
          const SizedBox(height: AppSpace.smallSpace),

          // ********************** course name
          Text(
            courseItem.name,
            style: AppTextStyle.nunitoSans22LightBlackBold,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpace.smallSpace),

          // *********************** insturctor name
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
    );
  }
}
