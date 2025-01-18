import 'package:bright/core/database/cache_helper.dart';
import 'package:bright/core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bright/features/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void splachViewTimer() async {
    await Future.delayed(
      Duration(seconds: 4),
      () {
        bool isBoardingVisited =
            getIt<CacheHelper>().getData(key: 'isBoardingVisited') ?? false;

        if (isBoardingVisited) {
          emit(SplashNavigateToLogin());
        } else {
          emit(SplashNavigateToBoarding());
        }
      },
    );
  }
}
