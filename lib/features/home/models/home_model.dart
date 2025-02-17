import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_strings.dart';

class ButtonModel {
  final String imagePath;
  final String route;

  ButtonModel({required this.imagePath, required this.route});
}

Map<String, ButtonModel> buttonsData = {
  AppStrings.courses: ButtonModel(
    imagePath: Assets.assetsImagesCourse1,
    route: RouteKey.courseView,
  ),
  AppStrings.instructors: ButtonModel(
    imagePath: Assets.assetsImagesTeam1,
    route: RouteKey.instructorView,
  ),
  AppStrings.testimonial: ButtonModel(
    imagePath: Assets.assetsImagesTestimonial1,
    route: RouteKey.testimonialView,
  ),
  AppStrings.contact: ButtonModel(
    imagePath: Assets.assetsImagesContactus,
    route: RouteKey.contactView,
  ),
};
