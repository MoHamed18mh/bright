import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/widgets/app_bar_logo_widget.dart';
import 'package:bright/core/widgets/app_bar_title_widget.dart';
import 'package:bright/features/home/presentation/widgets/profile_button_widget.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: AppBarLogoWidget(),
      ),
      titleSpacing: AppSpace.smallSpace, // spase between leading and title
      title: AppBarTitleWidget(),
      actions: [
        ProfileButtonWidget()
      ],
      backgroundColor: Colors.white,
      //pinned: true,
      floating: true,

      // to greate the size from bottom
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: const SizedBox(height: 10),
      ),
    );
  }
}

