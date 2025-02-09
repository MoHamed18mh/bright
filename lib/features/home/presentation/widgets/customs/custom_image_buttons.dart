import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/home/model/home_model.dart';
import 'package:bright/features/home/presentation/widgets/button_image_widget.dart';
import 'package:flutter/material.dart';

class CustomImageButtons extends StatelessWidget {
  const CustomImageButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: AppSpace.size1,
        mainAxisExtent: AppSpace.size1,
        crossAxisSpacing: AppSpace.smallSpace,
        mainAxisSpacing: AppSpace.smallSpace,
      ),
      itemBuilder: (context, index) {
        String title = homeData.keys.elementAt(index);
        HomeModel homeModel = homeData[title]!;
        //
        return ButtonImageWidget(
          imagePath: homeModel.imagePath,
          title: title,
          path: homeModel.route,
        );
      },
      itemCount: homeData.length,
    );
  }
}
