import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/instructor/models/data_model.dart';
import 'package:flutter/material.dart';

class CustomInstructorItem extends StatelessWidget {
  const CustomInstructorItem({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpace.paddingSpace),
      height: AppSpace.size5,
      color: AppColors.primaryHighLight,
      //
      child: Column(
        children: [
          Image.network(
            itemModel.imageCover,
            height: AppSpace.size2,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: AppSpace.mainSpace),
          //
          Text(
            itemModel.displayName,
            style: AppTextStyle.nunitoSans22LightBlackBold,
          ),
          //
          Text(
            itemModel.jobTitle,
            style: AppTextStyle.nunitoSans14Grey800,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
