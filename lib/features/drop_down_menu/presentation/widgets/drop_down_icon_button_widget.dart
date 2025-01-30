import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/features/drop_down_menu/cubit/drop_down_cubit.dart';
import 'package:bright/features/drop_down_menu/cubit/drop_down_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownIconButtonWidget extends StatelessWidget {
  const DropDownIconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropDownCubit, DropDownState>(
      builder: (context, state) {
        return InkWell(
          onTap: () => context.read<DropDownCubit>().changeMnueVisibility(),
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              border: Border.all(
                color: (state is MenuIsVisible)
                    ? AppColors.primaryColor
                    : Colors.grey,
                width: (state is MenuIsVisible) ? 4 : 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(
              Icons.menu,
              color: AppColors.primaryColor,
              size: 28,
            ),
          ),
        );
      },
    );
  }
}
