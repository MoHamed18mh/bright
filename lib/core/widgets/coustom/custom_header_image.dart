import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/back_icon_button_widget.dart';
import 'package:flutter/material.dart';

class CustomHeaderImage extends StatelessWidget {
  const CustomHeaderImage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpace.itemsHeight1,
      child: Stack(
        children: [
          Image.asset(
            Assets.assetsImagesCarousel1,
            height: AppSpace.itemsHeight1,
            fit: BoxFit.cover,
          ),
          //
          Container(
            color: AppColors.darkHighLight.withAlpha(130),
            child: Center(
              child: Text(
                title,
                style: AppTextStyle.notoSerif38WhiteBlod,
              ),
            ),
          ),
          Positioned(
            top: AppSpace.meduimSpace1,
            child: BackIconButtonWidget(),
          ),
        ],
      ),
    );
  }
}
