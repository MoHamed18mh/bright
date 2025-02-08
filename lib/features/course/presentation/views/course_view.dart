import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/container_shimmer_widget.dart';
import 'package:bright/core/widgets/coustom/custom_header_image.dart';
import 'package:bright/core/widgets/coustom/custom_section_header.dart';
import 'package:bright/features/course/cubit/course_cubit.dart';
import 'package:bright/features/course/cubit/course_state.dart';
import 'package:bright/features/course/presentation/widgets/coutom_course_item.dart';
import 'package:bright/features/course/presentation/widgets/custom_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CustomHeaderImage(
                  title: AppStrings.courses,
                  imagePath: Assets.assetsImagesCourse1,
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(height: AppSpace.maxSpace2),
              ),

              // ******************* categorey Section
              SliverToBoxAdapter(
                child: CustomSectionHeader(
                  title: AppStrings.categories,
                  subTitle: AppStrings.coursesCategories,
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(height: AppSpace.meduimSpace2),
              ),

              // ******************** category items
              SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: AppSpace.size6,
                  mainAxisExtent: AppSpace.size1,
                ),
                itemBuilder: (BuildContext contex, int index) {
                  if (state is CategorySuccessState) {
                    return CustomCategoryItem(
                      categoryData: state.categoryModel.categoryData[index],
                    );
                  } else {
                    return ContainerShimmerWidget(
                      edgeInsets: EdgeInsets.all(AppSpace.paddingSpace),
                    );
                  }
                },
                itemCount: state is CategorySuccessState
                    ? state.categoryModel.categoryData.length
                    : 3,
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpace.maxSpace1)),
              // ***************************

              // ********************** courses section
              SliverToBoxAdapter(
                child: CustomSectionHeader(
                  title: AppStrings.courses,
                  subTitle: AppStrings.popularCourses,
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(height: AppSpace.meduimSpace2),
              ),

              // ******************* courses items
              SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: AppSpace.size6,
                  mainAxisExtent: AppSpace.size5,
                ),
                itemBuilder: (BuildContext contex, int index) {
                  if (state is CourseSuccessState) {
                    return CustomCourseItem(
                      courseItems:
                          state.courseModel.courseData.courseItems[index],
                    );
                  } else {
                    return ContainerShimmerWidget(
                      edgeInsets: EdgeInsets.all(AppSpace.paddingSpace),
                    );
                  }
                },
                itemCount: state is CourseSuccessState
                    ? state.courseModel.courseData.courseItems.length
                    : 3,
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpace.maxSpace1)),
              // ***************************
            ],
          ),
        );
      },
    );
  }
}

