import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CourseDescriptionWidget extends StatelessWidget {
  const CourseDescriptionWidget({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.padding),
      child: Text(
        description,
        style: AppTextStyle.nunitoSans16LightBlackBold,
      ),
    );
  }
}
