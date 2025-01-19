import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_strings.dart';

class BoardingModel {
  final String imagePath;
  final String title;
  final String subTitle;

  BoardingModel(
      {required this.imagePath, required this.title, required this.subTitle});
}

List<BoardingModel> boardingData = [
  BoardingModel(
    imagePath: Assets.assetsImagesBoarding1,
    title: AppStrings.welcomeTo,
    subTitle: AppStrings.discoverWorldOfKnowledge,
  ),
  BoardingModel(
    imagePath: Assets.assetsImagesBoarding2,
    title: AppStrings.learnFrom,
    subTitle: AppStrings.accessHighQuality,
  ),
];
