import 'package:bright/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static final notoSerif37PrimaryBold = TextStyle(
      fontFamily: 'NotoSerif',
      fontSize: 37,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor);
  static final nunitoSans22PrimaryBold = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor);
}
