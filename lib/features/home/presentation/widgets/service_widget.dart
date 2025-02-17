import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/home/models/about_model.dart';
import 'package:flutter/material.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({
    super.key,
    required this.title,
    required this.aboutModel,
  });

  final String title;
  final AboutModel aboutModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpace.paddingSpace),
      padding: const EdgeInsets.all(AppSpace.mainSpace),
      color: AppColors.primaryHighLight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            aboutModel.iconData,
            size: 60,
            color: AppColors.primaryColor,
          ),
          const SizedBox(height: AppSpace.mainSpace),
          //
          Text(
            title,
            style: AppTextStyle.nunitoSans22LightBlackBold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpace.mainSpace),
          Text(
            aboutModel.subTitle,
            softWrap: true,
            textAlign: TextAlign.center,
            style: AppTextStyle.nunitoSans16LightBlackBold,
          ),
        ],
      ),
    );
  }
}
