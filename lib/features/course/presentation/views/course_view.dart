import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/custom/custom_image_head.dart';
import 'package:bright/core/widgets/custom/custom_part_title.dart';
import 'package:bright/features/course/presentation/widgets/custom/custom_courses_list.dart';
import 'package:flutter/material.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomImageHead(
              title: AppStrings.courses,
              imagePath: Assets.assetsImagesCourse1,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomPartTitle(
              title: AppStrings.courses,
              subTitle: AppStrings.popularCourses,
            ),
          ),
          CustomCoursesList(),
          SliverToBoxAdapter(
            child: SizedBox(height: AppSpace.meduim2),
          ),
        ],
      ),
    );
  }
}
