import 'package:bright/core/database/cache_helper.dart';
import 'package:bright/core/database/cache_key.dart';
import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/functions/show_toast.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/services/service_locator.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/back_button_widget.dart';
import 'package:bright/features/profile/cubit/profile_cubit.dart';
import 'package:bright/features/profile/cubit/profile_state.dart';
import 'package:bright/features/profile/presentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is DeleteAccountSuccess) {
          getIt<CacheHelper>().removeData(key: CacheKey.token);
          getIt<CacheHelper>().removeData(key: CacheKey.userId);
          navigateReplacement(context, RouteKey.loginView);
        } else if (state is DeleteAccountFailure) {
          showToast(msg: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpace.padding),
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(leading: BackButtonWidget()),
              const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpace.meduim2)),

              // details screen
              SliverToBoxAdapter(
                  child: ProfileItem(
                iconData: Icons.badge_outlined,
                itemTitle: AppStrings.myDetails,
                onTap: () => navigate(context, RouteKey.myDetailsView),
              )),

              // my courses screen
              SliverToBoxAdapter(
                  child: ProfileItem(
                iconData: Icons.favorite_border,
                itemTitle: AppStrings.myCourses,
                onTap: () => navigate(context, RouteKey.cartView),
              )),

              // payment screen
              SliverToBoxAdapter(
                  child: ProfileItem(
                iconData: Icons.payment,
                itemTitle: AppStrings.payment,
                onTap: () => navigate(context, RouteKey.paymentView),
              )),

              // log out button
              SliverToBoxAdapter(
                  child: ProfileItem(
                iconData: Icons.logout_rounded,
                itemTitle: AppStrings.logOut,
                onTap: () {
                  getIt<CacheHelper>().removeData(key: CacheKey.token);
                  getIt<CacheHelper>().removeData(key: CacheKey.userId);
                  navigateReplacement(context, RouteKey.loginView);
                },
              )),

              // delete account button
              SliverToBoxAdapter(
                  child: ProfileItem(
                iconData: (state is DeleteAccountLoading)
                    ? Icons.autorenew
                    : Icons.delete,
                itemTitle: AppStrings.deleteAccount,
                onTap: () {
                  context.read<ProfileCubit>().deleteAccount();
                },
              )),
              const SliverToBoxAdapter(child: SizedBox(height: AppSpace.max3)),
            ],
          ),
        ));
      },
    );
  }
}
