import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class InstructorDescriptionWidget extends StatelessWidget {
  const InstructorDescriptionWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.nunitoSans14Grey800,
    );
  }
}
