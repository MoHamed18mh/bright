import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_strings.dart';

class HomeModel {
  final String imagePath;
  final String route;

  HomeModel({required this.imagePath, required this.route});
}

Map<String, HomeModel> homeData = {
  AppStrings.courses: HomeModel(
    imagePath: Assets.assetsImagesCourse1,
    route: RouteKey.courseView,
  ),
  AppStrings.instructors: HomeModel(
    imagePath: Assets.assetsImagesTeam1,
    route: RouteKey.instructorView,
  ),
  AppStrings.testimonial: HomeModel(
    imagePath: Assets.assetsImagesTestimonial1,
    route: RouteKey.testimonialView,
  ),
  AppStrings.contact: HomeModel(
    imagePath: Assets.assetsImagesContactus,
    route: RouteKey.contactView,
  ),
};