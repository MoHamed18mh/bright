import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ContactItemWidget extends StatelessWidget {
  const ContactItemWidget(
      {super.key,
      required this.title,
      required this.suTitle,
      required this.iconData});

  final String title;
  final String suTitle;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
      child: Row(
        children: [
          Container(
            color: AppColors.primaryColor,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(right: AppSpace.paddingSpace),
            child: Icon(
              iconData,
              color: Colors.white,
              size: AppSpace.mainSpace,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.notoSerif20PrimaryBold,
              ),
              Text(
                suTitle,
                style: AppTextStyle.nunitoSans16LightBlackBold,
              ),
            ],
          )
        ],
      ),
    );
  }
}