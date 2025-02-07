import 'package:bright/core/utils/app_assets.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/home/presentation/widgets/about_us_info_widget.dart';
import 'package:flutter/material.dart';

class CustomAbout extends StatelessWidget {
  const CustomAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: AppSpace.size6,
        mainAxisSpacing: AppSpace.mainSpace,
        crossAxisSpacing: AppSpace.mainSpace,
        childAspectRatio: 1,
      ),
      delegate: SliverChildListDelegate(
        [
          Image.asset(
            Assets.assetsImagesAbout,
            height: AppSpace.size4,
            fit: BoxFit.cover,
          ),
          AboutUsInfoWidget(),
        ],
      ),
    );
  }
}
