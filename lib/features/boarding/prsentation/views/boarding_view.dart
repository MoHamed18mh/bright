import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/core/widgets/text_button_widget.dart';
import 'package:bright/features/boarding/cubit/boarding_cubit.dart';
import 'package:bright/core/widgets/app_name_widget.dart';
import 'package:bright/features/boarding/cubit/boarding_state.dart';
import 'package:bright/features/boarding/prsentation/widgets/customs/custom_boarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardingView extends StatelessWidget {
  const BoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final boardingCubit = context.read<BoardingCubit>();

    return BlocListener<BoardingCubit, BoardingState>(
      listener: (context, state) {
        if (state is BoardingCompleted) {
          navigateReplacement(context, RouteKey.loginView);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpace.padding),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpace.meduim1)),

              // skip button
              SliverToBoxAdapter(
                child: TextButtonWidget(
                  alignment: Alignment.centerRight,
                  onPressed: () => boardingCubit.navigateToLogin(),
                  text1: AppStrings.skip,
                  fontSize: 20,
                ),
              ),
              const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpace.padding)),

              const SliverToBoxAdapter(child: AppNameWidget()),
              const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpace.meduim1)),

              // the body of the screen
              const SliverToBoxAdapter(child: CustomBoardingBody()),
              const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpace.small2)),

              // next button
              SliverToBoxAdapter(
                child: MaterialButtonWidget(
                  onPressed: () {
                    boardingCubit.nextBoardingView();
                  },
                  text: AppStrings.next,
                ),
              ),
              const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpace.padding)),
            ],
          ),
        ),
      ),
    );
  }
}
