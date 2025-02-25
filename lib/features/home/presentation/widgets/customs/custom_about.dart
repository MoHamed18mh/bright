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
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: AppSpace.size7,
        mainAxisSpacing: AppSpace.main,
        crossAxisSpacing: AppSpace.main,
        childAspectRatio: .75,
      ),
      delegate: SliverChildListDelegate(
        [
          Image.asset(
            Assets.assetsImagesAbout,
            height: AppSpace.size4,
            fit: BoxFit.cover,
          ),
          const AboutUsInfoWidget(),
        ],
      ),
    );
  }
}
