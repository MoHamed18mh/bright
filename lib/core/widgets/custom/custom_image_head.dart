import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

class CustomImageHead extends StatelessWidget {
  const CustomImageHead({
    super.key,
    required this.title,
    required this.imagePath,
  });

  final String title, imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpace.size3,
      margin: const EdgeInsets.only(bottom: AppSpace.max2),
      child: Stack(
        children: [
          // background of head
          Image.asset(
            imagePath,
            height: AppSpace.size3,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: AppColors.darkHighLight.withAlpha(130),
            child: Center(
              child: Text(
                title,
                style: AppTextStyle.notoSerif38WhiteBlod,
              ),
            ),
          ),
          const Positioned(
            top: AppSpace.meduim1,
            child: BackButtonWidget(),
          ),
        ],
      ),
    );
  }
}
