import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:flutter/material.dart';

class ProfileButtonWidget extends StatelessWidget {
  const ProfileButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigate(context, RouteKey.profileView),
      child: Container(
        margin: EdgeInsets.only(right: AppSpace.smallSpace),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.person_2_outlined,
          color: AppColors.primaryColor,
          size: AppSpace.meduimSpace1,
        ),
      ),
    );
  }
}
