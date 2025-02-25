import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_assets.dart';

class ButtonModel {
  final String imagePath;
  final String route;

  ButtonModel({required this.imagePath, required this.route});
}

Map<String, ButtonModel> buttonsData = {
  'Courses': ButtonModel(
    imagePath: Assets.assetsImagesCourse1,
    route: RouteKey.courseView,
  ),
  'Instructors': ButtonModel(
    imagePath: Assets.assetsImagesTeam1,
    route: RouteKey.instructorView,
  ),
  'Testimonial': ButtonModel(
    imagePath: Assets.assetsImagesTestimonial1,
    route: RouteKey.testimonialView,
  ),
  'Contact': ButtonModel(
    imagePath: Assets.assetsImagesContactus,
    route: RouteKey.contactView,
  ),
};
