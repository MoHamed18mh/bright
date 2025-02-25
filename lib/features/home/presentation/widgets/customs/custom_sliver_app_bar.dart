import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/widgets/app_name_widget.dart';
import 'package:bright/features/home/presentation/widgets/app_bar_logo_widget.dart';
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
        margin: const EdgeInsets.only(left: AppSpace.small2),
        child: const AppBarLogoWidget(),
      ),
      titleSpacing: AppSpace.small2, // spase between leading and title
      title: const AppNameWidget(
        fontSize: 25,
        alignment: Alignment.centerLeft,
      ),
      actions: const [ProfileButtonWidget()],

      backgroundColor: Colors.white,
      floating: true,

      // to greate the size from bottom
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: SizedBox(height: 10),
      ),
    );
  }
}
