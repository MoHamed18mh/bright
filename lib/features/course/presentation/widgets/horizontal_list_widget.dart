import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/course/models/section_model.dart';
import 'package:bright/features/course/presentation/widgets/chip_widget.dart';
import 'package:flutter/material.dart';

class HorizontalListWidget extends StatelessWidget {
  const HorizontalListWidget({super.key, required this.sectionModel});

  final SectionModel sectionModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpace.meduim1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sectionModel.sectionData.length,
        itemBuilder: (context, index) {
          return ChipWidget(
            sectionName: sectionModel.sectionData[index].name,
            sectionId: sectionModel.sectionData[index].id,
          );
        },
      ),
    );
  }
}
