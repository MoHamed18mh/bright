import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/boarding/cubit/boarding_cubit.dart';
import 'package:bright/features/boarding/cubit/boarding_state.dart';
import 'package:bright/features/boarding/models/boarding_model.dart';
import 'package:bright/features/boarding/prsentation/widgets/boarding_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBoardingBody extends StatelessWidget {
  const CustomBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final boardingCubit = context.read<BoardingCubit>();

    return BlocBuilder<BoardingCubit, BoardingState>(
      builder: (context, state) {
        return SizedBox(
          height: AppSpace.size4,
          child: PageView.builder(
            controller: boardingCubit.pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) => boardingCubit.updateCurrentIndex(index),
            itemCount: boardingData.length,
            itemBuilder: (context, index) {
              return BoardingItemWidget(index: index);
            },
          ),
        );
      },
    );
  }
}
