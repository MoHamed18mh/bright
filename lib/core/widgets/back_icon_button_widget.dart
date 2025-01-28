import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BackIconButtonWidget extends StatelessWidget {
  const BackIconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () => navigatePop(context),
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
