import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/contact/models/contact_model.dart';
import 'package:bright/features/contact/presentation/widgets/leading_icon_widget.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.padding),
      margin: const EdgeInsets.only(bottom: AppSpace.small2),
      child: Row(
        children: [
          LeadingIconWidget(iconData: contactModel.iconData),
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

