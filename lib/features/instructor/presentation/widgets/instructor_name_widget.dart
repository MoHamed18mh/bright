import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/instructor/models/instructor_model.dart';
import 'package:flutter/material.dart';

class InstructorNameWidget extends StatelessWidget {
  const InstructorNameWidget({
    super.key,
    required this.instructorItem,
  });

  final InstructorItem instructorItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          instructorItem.displayName,
          style: AppTextStyle.nunitoSans22LightBlackBold,
        ),
        Text(
          instructorItem.jobTitle,
          style: AppTextStyle.nunitoSans16LightBlackBold,
        ),
      ],
    );
  }
}
