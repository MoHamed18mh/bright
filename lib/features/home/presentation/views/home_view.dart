import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/home/presentation/widgets/customs/custom_about.dart';
import 'package:bright/features/home/presentation/widgets/customs/custom_sliver_app_bar.dart';
import 'package:bright/features/home/presentation/widgets/customs/custom_image_buttons.dart';
import 'package:bright/features/home/presentation/widgets/customs/custom_service.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(), // app bar
          CustomImageButtons(),
          SliverToBoxAdapter(child: const SizedBox(height: AppSpace.maxSpace1)),
          CustomService(),
          SliverToBoxAdapter(child: const SizedBox(height: AppSpace.maxSpace1)),
          CustomAbout(),
        ],
      ),
    );
  }
}
