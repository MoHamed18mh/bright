import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/drop_down_menu/cubit/drop_down_cubit.dart';
import 'package:bright/features/drop_down_menu/cubit/drop_down_state.dart';
import 'package:bright/features/drop_down_menu/models/drop_down_menu_data.dart';
import 'package:bright/features/drop_down_menu/presentation/widgets/custom/custom_drop_down_menu.dart';
import 'package:bright/features/drop_down_menu/presentation/widgets/custom/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownView extends StatelessWidget {
  const DropDownView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropDownCubit, DropDownState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
                sliver: CustomSliverAppBar(),
              ),
              SliverToBoxAdapter(child: CustomDropDownMenu()),
              SliverFillRemaining(
                child: menuBodys[context.watch<DropDownCubit>().currrentScrren],
              ),
            ],
          ),
        );
      },
    );
  }
}
