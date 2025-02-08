import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/course/models/category_model.dart';
import 'package:flutter/material.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.categoryData,
  });
  final CategoryData categoryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpace.paddingSpace),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.assetsImagesCat1),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //
          Container(
            padding: EdgeInsets.all(AppSpace.smallSpace),
            height: AppSpace.maxSpace1,
            width: AppSpace.maxSpace4,
            color: Colors.white,
            alignment: Alignment.center,
            child: Text(
              categoryData.name,
              style: AppTextStyle.nunitoSans16LightBlackBold,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
