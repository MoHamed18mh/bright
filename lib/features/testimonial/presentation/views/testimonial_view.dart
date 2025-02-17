import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/coustom/custom_header_image.dart';
import 'package:bright/core/widgets/coustom/custom_section_header.dart';
import 'package:bright/features/testimonial/presentation/widgets/custom_testimonial.dart';
import 'package:flutter/material.dart';

class TestimonialView extends StatelessWidget {
  const TestimonialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomHeaderImage(
              title: AppStrings.testimonial,
              imagePath: Assets.assetsImagesTestimonial1,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomSectionHeader(
              title: AppStrings.testimonial,
              subTitle: AppStrings.ourStudentsSay,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                CustomTestimonial(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
