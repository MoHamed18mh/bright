import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget(
      {super.key, required this.sectionName, required this.sectionId});

  final String sectionName;
  final int sectionId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigate(
        context,
        RouteKey.videosView,
        extra: {'sectionId': sectionId, 'sectionName': sectionName},
      ),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSpace.small1),
          padding: const EdgeInsets.symmetric(horizontal: AppSpace.small2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(
                Icons.play_arrow,
                size: 18,
                color: AppColors.primaryColor,
              ),
              const SizedBox(width: 3),
              Text(
                sectionName,
                style: AppTextStyle.nunitoSans14Grey800,
              ),
            ],
          )),
    );
  }
}
