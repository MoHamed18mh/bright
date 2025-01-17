import 'package:bright/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static final notoSerif38PrimaryBold = TextStyle(
    fontFamily: 'NotoSerif',
    fontSize: 38,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static final notoSerif22PrimaryBold = TextStyle(
    fontFamily: 'NotoSerif',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static final nunitoSans20LightBlackBold = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.lightBlack,
  );
  static final nunitoSans16grey = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 14,
    color: Colors.grey[700],
  );
}
