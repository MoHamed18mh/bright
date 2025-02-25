import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:flutter/material.dart';

class LeadingIconWidget extends StatelessWidget {
  const LeadingIconWidget({
    super.key,
    required this.iconData,
  });

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.only(right: AppSpace.padding),
      child: Icon(
        iconData,
        color: Colors.white,
        size: AppSpace.main,
      ),
    );
  }
}
