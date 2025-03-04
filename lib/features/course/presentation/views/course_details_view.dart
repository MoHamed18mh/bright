import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/features/course/cubit/course_cubit.dart';
import 'package:bright/features/course/cubit/course_state.dart';
import 'package:bright/features/course/models/course_model.dart';
import 'package:bright/features/course/presentation/widgets/course_price_widget.dart';
import 'package:bright/features/course/presentation/widgets/custom/custom_section_image.dart';
import 'package:bright/features/course/presentation/widgets/custom/custom_sections_list.dart';
import 'package:bright/features/course/presentation/widgets/section_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key, required this.courseItem});

  final CourseItem courseItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return Scaffold(
          // favorite button
          floatingActionButton: Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: AppColors.primaryColor,
                size: 55,
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              // image
              SliverToBoxAdapter(
                  child: CustomSectionImage(courseItem: courseItem)),
              const SliverToBoxAdapter(child: SizedBox(height: AppSpace.main)),

              // course description
              SliverToBoxAdapter(
                  child: CourseDescriptionWidget(
                      description: courseItem.description)),
              const SliverToBoxAdapter(
                  child: Divider(
                indent: 70,
                endIndent: 70,
              )),
              const SliverToBoxAdapter(child: SizedBox(height: AppSpace.main)),

              // section list
              const CustomSectionsList(),
              const SliverToBoxAdapter(
                child: SizedBox(height: AppSpace.meduim2),
              ),

              // course price
              SliverToBoxAdapter(
                  child: CoursePriceWidget(price: courseItem.price)),
              const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpace.small2)),

              // // button add to cart
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: AppSpace.padding),
              //     child: MaterialButtonWidget(
              //         onPressed: () {}, text: AppStrings.addToCart),
              //   ),
              // ),
              // const SliverToBoxAdapter(
              //     child: SizedBox(height: AppSpace.small2)),

              // button buy
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSpace.padding),
                  child: MaterialButtonWidget(
                      onPressed: () {}, text: AppStrings.buyNow),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
