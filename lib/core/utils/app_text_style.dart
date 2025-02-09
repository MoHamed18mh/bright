import 'package:bright/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static final notoSerif38PrimaryBold = TextStyle(
    fontFamily: 'NotoSerif',
    fontSize: 38,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static final notoSerif20PrimaryBold = TextStyle(
    fontFamily: 'NotoSerif',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static final notoSerif25PrimaryBold = TextStyle(
    fontFamily: 'NotoSerif',
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static final nunitoSans22LightBlackBold = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.lightBlack,
  );
  static final nunitoSans26LightBlackBold = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.lightBlack,
  );

  static final nunitoSans16LightBlackBold = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.lightBlack,
  );
  static final nunitoSans13Grey700 = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 13,
    color: Colors.grey[700],
  );
  static final nunitoSans14Grey800 = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 14,
    color: Colors.grey[900],
  );
  static final notoSerif38WhiteBlod = TextStyle(
    fontFamily: 'NotoSerif',
    fontSize: 38,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
  static final notoSerif30WhiteBlod = TextStyle(
    fontFamily: 'NotoSerif',
    fontSize: 30,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
  static final notoSerif15WhiteBlod = TextStyle(
    fontFamily: 'NotoSerif',
    fontSize: 15,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
}
