import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/back_button_widget.dart';
import 'package:bright/features/course/models/course_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomSectionImage extends StatelessWidget {
  const CustomSectionImage({super.key, required this.courseItem});

  final CourseItem courseItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: courseItem.pictureUrl,
          height: AppSpace.max5,
          width: double.infinity,
          fit: BoxFit.cover,
          memCacheHeight: 230,
        ),
        Container(
          width: double.infinity,
          height: AppSpace.max5,
          padding: const EdgeInsets.all(AppSpace.padding),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                AppColors.darkHighLight,
                AppColors.darkHighLight.withAlpha(60),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseItem.name,
                style: AppTextStyle.notoSerif25WhiteBlod,
              ),
              Text(
                courseItem.instructorName,
                style: AppTextStyle.nunitoSans15WhiteBlod,
              ),
            ],
          ),
        ),
        const Positioned(
          top: AppSpace.main,
          child: BackButtonWidget(),
        )
      ],
    );
  }
}
