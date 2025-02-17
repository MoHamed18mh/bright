import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/contact/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactInfoItemWidget extends StatelessWidget {
  const ContactInfoItemWidget({
    super.key,
    required this.title,
    required this.contactModel,
  });

  final String title;
  final ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
      margin: const EdgeInsets.only(bottom: AppSpace.smallSpace),
      child: Row(
        children: [
          Container(
            color: AppColors.primaryColor,
            padding: const EdgeInsets.all(13),
            margin: const EdgeInsets.only(right: AppSpace.paddingSpace),
            child: Icon(
              contactModel.iconData,
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
                contactModel.subTitle,
                style: AppTextStyle.nunitoSans16LightBlackBold,
              ),
            ],
          )
        ],
      ),
    );
  }
}
