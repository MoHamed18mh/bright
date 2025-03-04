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
    return Container(
      margin: const EdgeInsets.only(right: AppSpace.small2),
      child: InkWell(
        onTap: () => navigate(context, RouteKey.profileView),
        child: Icon(
          Icons.settings,
          color: AppColors.primaryColor,
          size: AppSpace.meduim1,
        ),
      ),
    );
  }
}
