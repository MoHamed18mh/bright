import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/coustom/custom_header_image.dart';
import 'package:bright/core/widgets/coustom/custom_section_header.dart';
import 'package:bright/features/course/cubit/course_cubit.dart';
import 'package:bright/features/course/cubit/course_state.dart';
import 'package:bright/features/course/presentation/widgets/custom_course_item.dart';
import 'package:bright/features/course/presentation/widgets/custom_course_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<CourseCubit>().getCourses();
            },
            child: CustomScrollView(
              slivers: [
                // Header image
                SliverToBoxAdapter(
                  child: CustomHeaderImage(
                    title: AppStrings.courses,
                    imagePath: Assets.assetsImagesCourse1,
                  ),
                ),

                // Section header
                SliverToBoxAdapter(
                  child: CustomSectionHeader(
                    title: AppStrings.courses,
                    subTitle: AppStrings.popularCourses,
                  ),
                ),

                // Course items
                SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: AppSpace.size6,
                    mainAxisExtent: AppSpace.size5,
                  ),
                  itemBuilder: (context, index) => (state is CourseSuccessState)
                      ? CustomCourseItem(
                          courseItem:
                              state.courseModel.courseData.courseItem[index])
                      : CustomCourseShimmer(),
                  itemCount: (state is CourseSuccessState)
                      ? state.courseModel.courseData.courseItem.length
                      : 2,
                ),
                SliverToBoxAdapter(
                  child: const SizedBox(height: AppSpace.meduimSpace2),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
