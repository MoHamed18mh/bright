import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/core/widgets/back_icon_button_widget.dart';
import 'package:flutter/material.dart';

class CustomHeaderImage extends StatelessWidget {
  const CustomHeaderImage(
      {super.key, required this.title, required this.imagePath});
  final String title, imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpace.size4,
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            height: AppSpace.size4,
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
