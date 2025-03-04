import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/back_button_widget.dart';
import 'package:bright/features/profile/presentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpace.padding),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(leading: BackButtonWidget()),
          SliverToBoxAdapter(child: SizedBox(height: AppSpace.meduim2)),
          SliverToBoxAdapter(
              child: ProfileItem(
                  iconData: Icons.badge_outlined,
                  itemTitle: AppStrings.myDetails)),
          SliverToBoxAdapter(
              child: ProfileItem(
                  iconData: Icons.favorite_border,
                  itemTitle: AppStrings.favorites)),
          SliverToBoxAdapter(
              child: ProfileItem(
                  iconData: Icons.payment, itemTitle: AppStrings.payment)),
          SliverToBoxAdapter(
              child:
                  ProfileItem(iconData: Icons.settings, itemTitle: 'Settings')),
          SliverToBoxAdapter(child: SizedBox(height: AppSpace.max3)),
        ],
      ),
    ));
  }
}
