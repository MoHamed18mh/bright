import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/boarding/cubit/boarding_cubit.dart';
import 'package:bright/features/boarding/models/boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardingTitleWidget extends StatelessWidget {
  const BoardingTitleWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: boardingData[index].title,
            style: AppTextStyle.nunitoSans20LightBlackBold,
          ),
          if (context.read<BoardingCubit>().currentIndex !=
              boardingData.length - 1)
            TextSpan(
              text: AppStrings.appName,
              style: AppTextStyle.notoSerif22PrimaryBold,
            ),
        ],
      ),
    );
  }
}
