import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/home/models/home_model.dart';
import 'package:flutter/material.dart';

class ButtonImageWidget extends StatelessWidget {
  const ButtonImageWidget({
    super.key,
    required this.title, required this.buttonModel,
  });

  final String title;
  final ButtonModel buttonModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigate(context, buttonModel.route),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(buttonModel.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: AppColors.darkHighLight.withAlpha(130),
            alignment: Alignment.center,
            child: Text(
              title,
              style: AppTextStyle.notoSerif30WhiteBlod,
            ),
          )
        ],
      ),
    );
  }
}
