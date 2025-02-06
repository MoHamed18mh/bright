import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/home/model/home_model.dart';
import 'package:bright/core/widgets/coustom/custom_sliver_app_bar.dart';
import 'package:bright/features/home/presentation/widgets/customs/custom_section_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(), // app bar
          //
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: AppSpace.maxSpace4,
              mainAxisExtent: AppSpace.maxSpace5,
              crossAxisSpacing: AppSpace.smallSpace,
              mainAxisSpacing: AppSpace.smallSpace,
            ),
            itemBuilder: (context, index) {
              String key = homeData.keys.elementAt(index);
              HomeModel homeModel = homeData[key]!;
              return CustomSectionButton(
                imagePath: homeModel.imagePath,
                title: key,
                path: homeModel.route,
              );
            },
            itemCount: homeData.length,
          ),
          //
          
        ],
      ),
    );
  }
}
