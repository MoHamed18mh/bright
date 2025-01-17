import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/features/boarding/cubit/boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndicatorWidget extends StatelessWidget {
  const SmoothPageIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: BlocProvider.of<BoardingCubit>(context).pageController,
      count: 2,
      effect: ExpandingDotsEffect(
        dotHeight: 8,
        dotWidth: 14,
        activeDotColor: AppColors.primaryColor,
      ),
    );
  }
}