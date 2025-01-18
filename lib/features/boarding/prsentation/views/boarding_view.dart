import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/core/widgets/text_button_widget.dart';
import 'package:bright/features/boarding/cubit/boarding_cubit.dart';
import 'package:bright/core/widgets/app_header_widget.dart';
import 'package:bright/features/boarding/prsentation/widgets/custom_boarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardingView extends StatelessWidget {
  const BoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.smallSpace),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: AppSpace.mainSpace)),
            SliverToBoxAdapter(
              child: TextButtonWidget(
                alignment: Alignment.centerRight,
                onPressed: () =>
                    context.read<BoardingCubit>().navigateToLogin(context),
                text1: AppStrings.skip,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: AppSpace.mainSpace)),
            SliverToBoxAdapter(child: AppHeaderWidget()),
            SliverToBoxAdapter(child: SizedBox(height: AppSpace.maxSpace / 2)),
            SliverToBoxAdapter(child: CustomBoardingBody()),
            SliverToBoxAdapter(child: SizedBox(height: AppSpace.mainSpace)),
            SliverToBoxAdapter(
              child: MaterialButtonWidget(
                onPressed: () {
                  context.read<BoardingCubit>().nextBoardingView(context);
                },
                text: AppStrings.next,
              ),
            )
          ],
        ),
      ),
    );
  }
}
