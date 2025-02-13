import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/instructor/models/instructor_model.dart';
import 'package:flutter/material.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({
    super.key,
    required this.instructorItem,
  });

  final InstructorItem instructorItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContactItem(text: instructorItem.email, iconData: Icons.email),
        const SizedBox(height: AppSpace.smallSpace),
        ContactItem(text: instructorItem.mobile, iconData: Icons.phone)
      ],
    );
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.text,
    required this.iconData,
  });

  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: AppColors.primaryColor,
        ),
        const SizedBox(width: AppSpace.smallSpace),
        Text(
          text,
          style: AppTextStyle.nunitoSans16LightBlackBold,
        ),
      ],
    );
  }
}
