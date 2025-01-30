import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/drop_down_menu/cubit/drop_down_cubit.dart';
import 'package:bright/features/drop_down_menu/cubit/drop_down_state.dart';
import 'package:bright/features/drop_down_menu/models/drop_down_menu_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dorpDownCubit = context.read<DropDownCubit>();

    return BlocBuilder<DropDownCubit, DropDownState>(
      builder: (context, state) {
        return AnimatedContainer(
          color: Colors.white,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,

          // should call MenuIsVisible to make menu closed when app is start
          height: (state is MenuIsVisible) ? 280 : 0,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: menuHeaders.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  dorpDownCubit.setCurrentScreen(index);
                  dorpDownCubit.changeMnueVisibility();
                },

                // if (crrentScreen == index) return true
                selected: dorpDownCubit.currrentScrren == index,
                selectedColor: AppColors.primaryColor,

                titleTextStyle: AppTextStyle.nunitoSans16LightBlackBold,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: AppSpace.mainSpace),
                title: Text(menuHeaders[index]),
              );
            },
          ),
        );
      },
    );
  }
}
