import 'package:bright/core/database/cache_helper.dart';
import 'package:bright/core/database/cache_key.dart';
import 'package:bright/core/services/service_locator.dart';
import 'package:bright/features/boarding/cubit/boarding_state.dart';
import 'package:bright/features/boarding/models/boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardingCubit extends Cubit<BoardingState> {
  BoardingCubit() : super(BoardingInitial());

  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  // change the index of the pageView
  void updateCurrentIndex(int index) {
    currentIndex = index;
  }

  // go the next page in boarding
  void nextBoardingView() {
    if (currentIndex == boardingData.length - 1) {
      navigateToLogin();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // affter finish boarding save value that isBoardingVisited and go to LoginView screen
  void navigateToLogin() {
    getIt<CacheHelper>().saveData(key: CacheKey.isBoardingVisited, value: true);
    emit(BoardingCompleted());
  }
}
