import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/widgets/back_button_widget.dart';
import 'package:bright/features/instructor/models/instructor_model.dart';
import 'package:bright/features/instructor/presentation/widgets/call_info_widget.dart';
import 'package:bright/features/instructor/presentation/widgets/instructor_description_widget.dart';
import 'package:bright/features/instructor/presentation/widgets/instructor_image_widget.dart';
import 'package:bright/features/instructor/presentation/widgets/instructor_name_widget.dart';
import 'package:flutter/material.dart';

class InstructorDetailsView extends StatelessWidget {
  const InstructorDetailsView({super.key, required this.instructorItem});

  final InstructorItem instructorItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.padding),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: AppSpace.main)),
            const SliverToBoxAdapter(child: BackButtonWidget()),

            //  image
            SliverToBoxAdapter(
                child: InstructorImageWidget(
                    imageCover: instructorItem.imageCover)),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpace.small2)),

            //  name and job
            SliverToBoxAdapter(
                child: InstructorNameWidget(instructorItem: instructorItem)),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpace.main)),

            //  description
            SliverToBoxAdapter(
                child: InstructorDescriptionWidget(
                    text: instructorItem.qualifications)),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpace.meduim1)),

            // contact information
            SliverToBoxAdapter(
              child: CallInfoWidget(instructorItem: instructorItem),
            )
          ],
        ),
      ),
    );
  }
}
