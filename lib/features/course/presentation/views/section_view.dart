import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/features/course/cubit/course_cubit.dart';
import 'package:bright/features/course/cubit/course_state.dart';
import 'package:bright/features/course/models/course_model.dart';
import 'package:bright/features/course/presentation/widgets/course_price_widget.dart';
import 'package:bright/features/course/presentation/widgets/custom/custom_section_image.dart';
import 'package:bright/features/course/presentation/widgets/section_chip_widget.dart';
import 'package:bright/features/course/presentation/widgets/section_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionView extends StatelessWidget {
  const SectionView({super.key, required this.courseItem});

  final CourseItem courseItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: CustomSectionImage(courseItem: courseItem)),
              SliverToBoxAdapter(
                  child: const SizedBox(height: AppSpace.mainSpace)),
              //
              SliverToBoxAdapter(
                  child: SectionDescriptionWidget(
                      description: courseItem.description)),
              //
              SliverToBoxAdapter(
                  child: Divider(
                indent: 70,
                endIndent: 70,
              )),
              SliverToBoxAdapter(
                  child: const SizedBox(height: AppSpace.mainSpace)),
              //
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (state is SectionSuccessState) {
                      return SectionChipeWidget(
                          sectionModel: state.sectionModel);
                    } else {
                      return const SizedBox(height: AppSpace.meduimSpace1);
                    }
                  },
                  childCount: 1,
                ),
              ),
              SliverToBoxAdapter(
                  child: const SizedBox(height: AppSpace.mainSpace)),
              //
              SliverToBoxAdapter(
                  child: CoursePriceWidget(price: courseItem.price)),
              SliverToBoxAdapter(
                  child: const SizedBox(height: AppSpace.smallSpace)),
              //
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpace.paddingSpace),
                  child: MaterialButtonWidget(
                      onPressed: () {}, text: AppStrings.addToCart),
                ),
              ),
              SliverToBoxAdapter(
                  child: const SizedBox(height: AppSpace.smallSpace)),
              //
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpace.paddingSpace),
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
