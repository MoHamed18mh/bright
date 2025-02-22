import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/widgets/back_icon_button_widget.dart';
import 'package:bright/features/instructor/models/instructor_model.dart';
import 'package:bright/features/instructor/presentation/widgets/contact_info_widget.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: const SizedBox(height: AppSpace.mainSpace)),
            SliverToBoxAdapter(child: BackButtonWidget()),
            //
            SliverToBoxAdapter(
                child: InstructorImageWidget(
                    imageCover: instructorItem.imageCover)),
            SliverToBoxAdapter(
                child: const SizedBox(height: AppSpace.smallSpace)),
            //
            SliverToBoxAdapter(
                child: InstructorNameWidget(instructorItem: instructorItem)),
            SliverToBoxAdapter(
                child: const SizedBox(height: AppSpace.mainSpace)),
            //
            SliverToBoxAdapter(
                child: InstructorDescriptionWidget(
                    text: instructorItem.qualifications)),
            SliverToBoxAdapter(
                child: const SizedBox(height: AppSpace.meduimSpace1)),
            //
            SliverToBoxAdapter(
              child: ContactInfoWidget(instructorItem: instructorItem),
            )
          ],
        ),
      ),
    );
  }
}
