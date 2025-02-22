import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class SectionDescriptionWidget extends StatelessWidget {
  const SectionDescriptionWidget({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
      child: Text(
        description,
        style: AppTextStyle.nunitoSans16LightBlackBold,
      ),
    );
  }
}