import 'package:bright/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class AboutModel {
  final String subTitle;
  final IconData iconData;

  AboutModel({required this.subTitle, required this.iconData});
}

Map<String, AboutModel> aboutServices = {
  AppStrings.skilldeInstructors: AboutModel(
    subTitle: AppStrings.diamElitrKasd,
    iconData: Icons.school,
  ),
  AppStrings.onlineClasses: AboutModel(
    subTitle: AppStrings.diamElitrKasd,
    iconData: Icons.language_rounded,
  ),
  AppStrings.homeProjects: AboutModel(
    subTitle: AppStrings.diamElitrKasd,
    iconData: Icons.home_rounded,
  ),
  AppStrings.bookLibrary: AboutModel(
    subTitle: AppStrings.diamElitrKasd,
    iconData: Icons.menu_book_outlined,
  ),
};

List<String> skills = [
  AppStrings.skilldeInstructors,
  AppStrings.onlineClasses,
  AppStrings.internationalCertificate,
];
