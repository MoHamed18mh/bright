import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_style.dart';

class ProfileItem extends StatelessWidget {
  final String iconName;
  final String itemName;

  const ProfileItem(
      {super.key, required this.iconName, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 40,
          thickness: 1,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 24),
              child: ImageIcon(AssetImage('assets/images/$iconName.png')),
            ),
            Text(itemName, style: AppTextStyle.nunitoSans22LightBlackBold),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 28,
            )
          ],
        ),
      ],
    );
  }
}
