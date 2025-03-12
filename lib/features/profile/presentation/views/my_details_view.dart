import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/profile/cubit/profile_cubit.dart';
import 'package:bright/features/profile/cubit/profile_state.dart';
import 'package:bright/features/profile/presentation/widgets/my_details_app_bar_widget.dart';
import 'package:bright/features/profile/presentation/widgets/user_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDetailsView extends StatelessWidget {
  const MyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          body: (state is GetUserSuccess)
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSpace.padding),
                  child: CustomScrollView(
                    slivers: [
                      const MyDetailsAppBarWidget(),

                      // user image
                      SliverToBoxAdapter(
                          child: UserImageWidget(
                        imageUrl: state.profileModel.profileData.imageCover,
                      )),
                      const SliverToBoxAdapter(
                          child: SizedBox(height: AppSpace.meduim2)),

                      // user name
                      SliverToBoxAdapter(
                        child: Text(
                          state.profileModel.profileData.displayName,
                          style: AppTextStyle.notoSerif22LightBlackBold,
                        ),
                      ),
                      const SliverToBoxAdapter(
                          child: SizedBox(height: AppSpace.meduim1)),

                      // user email
                      SliverToBoxAdapter(
                        child: Text(
                          state.profileModel.profileData.email,
                          style: AppTextStyle.notoSerif22LightBlackBold,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SliverToBoxAdapter(
                          child: SizedBox(height: AppSpace.meduim1)),

                      // user phone number
                      SliverToBoxAdapter(
                        child: Text(
                          state.profileModel.profileData.mobile,
                          style: AppTextStyle.notoSerif22LightBlackBold,
                        ),
                      ),
                    ],
                  ),
                )
              : (state is GetUserFailure)
                  ? Center(
                      child: Text(state.errorMessage),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
        );
      },
    );
  }
}
