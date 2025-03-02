import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/course/cubit/course_cubit.dart';
import 'package:bright/features/course/cubit/course_state.dart';
import 'package:bright/features/course/presentation/widgets/course_item_widget.dart';
import 'package:bright/features/course/presentation/widgets/custom/custom_course_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCoursesList extends StatelessWidget {
  const CustomCoursesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: AppSpace.size7,
            mainAxisExtent: AppSpace.size6,
          ),
          itemBuilder: (context, index) {
            if (state is CourseSuccess) {
              return CourseItemWidget(
                courseItem: state.courseModel.courseData.courseItem[index],
              );
            } else {
              return const CustomCourseShimmer();
            }
          },
          itemCount: (state is CourseSuccess)
              ? state.courseModel.courseData.courseItem.length
              : 2,
        );
      },
    );
  }
}
