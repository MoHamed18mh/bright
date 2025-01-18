import 'package:bright/core/database/cache_helper.dart';
import 'package:bright/core/functions/navigation.dart';
import 'package:bright/features/boarding/cubit/boarding_state.dart';
import 'package:bright/features/boarding/data/model/boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardingCubit extends Cubit<BoardingState> {
  BoardingCubit() : super(BoardingInitial());

  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  void updateCurrentIndex(int index) {
    currentIndex = index;
    emit(BoardingIndexUpdated(index));
  }

  void nextBoardingView(context) {
    if (currentIndex == boardingData.length - 1) {
      navigateToLogin(context);
    } else {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void navigateToLogin(BuildContext context) {
    CacheHelper().saveData(key: 'isBoardingVisited', value: true);
    navigateReplacement(context, '/LoginView');
    emit(BoardingCompleted());
  }
}
