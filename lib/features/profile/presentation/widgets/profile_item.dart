import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {super.key, required this.iconData, required this.itemTitle, this.onTap});

  final IconData iconData;
  final String itemTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                iconData,
                color: AppColors.lightBlack,
              ),
              const SizedBox(width: AppSpace.small2),
              Text(itemTitle, style: AppTextStyle.nunitoSans18LightBlackBold),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.lightBlack,
                size: 20,
              )
            ],
          ),
          const Divider(
            height: AppSpace.meduim1,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
