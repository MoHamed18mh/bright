import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/back_button_widget.dart';
import 'package:bright/features/profile/presentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.padding),
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(leading: BackButtonWidget()),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpace.meduim2)),

          // details screen
          SliverToBoxAdapter(
              child: ProfileItem(
            iconData: Icons.badge_outlined,
            itemTitle: AppStrings.myDetails,
            onTap: () => navigate(context, RouteKey.myDetailsView),
          )),

          // my courses screen
          const SliverToBoxAdapter(
              child: ProfileItem(
            iconData: Icons.favorite_border,
            itemTitle: AppStrings.myCourses,
          )),

          // payment screen
          SliverToBoxAdapter(
              child: ProfileItem(
            iconData: Icons.payment,
            itemTitle: AppStrings.payment,
            onTap: () => navigate(context, RouteKey.paymentView),
          )),

          // settings screen
          SliverToBoxAdapter(
              child: ProfileItem(
            iconData: Icons.settings,
            itemTitle: AppStrings.settings,
            onTap: () => navigate(context, RouteKey.settingsView),
          )),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpace.max3)),
        ],
      ),
    ));
  }
}
