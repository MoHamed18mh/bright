import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/custom/custom_image_head.dart';
import 'package:bright/core/widgets/custom/custom_part_title.dart';
import 'package:bright/features/instructor/presentation/widgets/customs/custom_instructor_items.dart';
import 'package:flutter/material.dart';

class InstructorView extends StatelessWidget {
  const InstructorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomImageHead(
              title: AppStrings.instructors,
              imagePath: Assets.assetsImagesTeam1,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomPartTitle(
              title: AppStrings.instructors,
              subTitle: AppStrings.expertInstructors,
            ),
          ),
          CustomInstructorItems(),
          SliverToBoxAdapter(child: SizedBox(height: AppSpace.meduim2)),
        ],
      ),
    );
  }
}
