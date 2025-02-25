import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/instructor/cubit/instructor_cubit.dart';
import 'package:bright/features/instructor/cubit/instructor_state.dart';
import 'package:bright/features/instructor/presentation/widgets/customs/custom_instructor_shimmer.dart';
import 'package:bright/features/instructor/presentation/widgets/instructor_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomInstructorItems extends StatelessWidget {
  const CustomInstructorItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstructorCubit, InstructorState>(
      builder: (context, state) {
        return SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: AppSpace.size6,
              mainAxisExtent: AppSpace.size6),
          itemBuilder: (context, index) {
            if (state is InstructorSuccess) {
              return CustomInstructorItem(
                  instructorItem: state
                      .instructorModel.instructorData.instructorItem[index]);
            } else {
              return const CustomInstructorShimmer();
            }
          },
          itemCount: (state is InstructorSuccess)
              ? state.instructorModel.instructorData.instructorItem.length
              : 2,
        );
      },
    );
  }
}
