import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/features/contact/presentation/widgets/contact_item_widget.dart';
import 'package:flutter/material.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ContactItemWidget(
            title: AppStrings.office,
            suTitle: AppStrings.tanta,
            iconData: Icons.place,
          ),
          const SizedBox(height: AppSpace.smallSpace),
          ContactItemWidget(
            title: AppStrings.mobile,
            suTitle: AppStrings.mobileNumbe,
            iconData: Icons.phone,
          ),
          const SizedBox(height: AppSpace.smallSpace),
          ContactItemWidget(
            title: AppStrings.email,
            suTitle: AppStrings.emailExample,
            iconData: Icons.email_rounded,
          ),
        ],
      ),
    );
  }
}
