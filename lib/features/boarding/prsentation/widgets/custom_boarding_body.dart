import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/boarding/cubit/boarding_cubit.dart';
import 'package:bright/features/boarding/cubit/boarding_state.dart';
import 'package:bright/features/boarding/data/model/boarding_model.dart';
import 'package:bright/features/boarding/prsentation/widgets/boarding_body_title_widget.dart';
import 'package:bright/features/boarding/prsentation/widgets/smooth_page_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBoardingBody extends StatelessWidget {
  const CustomBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardingCubit, BoardingState>(
      builder: (context, state) {
        BoardingCubit boardingCubit = BlocProvider.of<BoardingCubit>(context);
        return SizedBox(
          height: 400,
          child: PageView.builder(
            controller: boardingCubit.pageController,
            onPageChanged: (index) => boardingCubit.updateCurrentIndex(index),
            itemCount: boardingData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    boardingData[index].imagePath,
                    height: 250,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: AppSpace.mainSpace),
                  SmoothPageIndicatorWidget(),
                  SizedBox(height: AppSpace.mainSpace * 1.3),
                  BoardingBodyTitleWidget(index: index),
                  Text(
                    boardingData[index].subTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.nunitoSans16grey,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
