import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/custom/custom_image_head.dart';
import 'package:bright/core/widgets/custom/custom_part_title.dart';
import 'package:bright/features/testimonial/presentation/widgets/custom_testimonial.dart';
import 'package:flutter/material.dart';

class TestimonialView extends StatelessWidget {
  const TestimonialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CustomImageHead(
              title: AppStrings.testimonial,
              imagePath: Assets.assetsImagesTestimonial1,
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomPartTitle(
              title: AppStrings.testimonial,
              subTitle: AppStrings.ourStudentsSay,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const CustomTestimonial(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
