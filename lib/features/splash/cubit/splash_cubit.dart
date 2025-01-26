import 'package:bright/core/database/cache_helper.dart';
import 'package:bright/core/database/cache_key.dart';
import 'package:bright/core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bright/features/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  // start when app is launch and go to the next screen affter 4 seconds
  void splashViewTimer() async {
    await Future.delayed(
      Duration(seconds: 4),
      () {
        // get the value of the 'isBoardingVisited' form the database and make it 'false' if is not found
        bool isBoardingVisited =
            getIt<CacheHelper>().getData(key: CacheKey.isBoardingVisited) ??
                false;

        if (isBoardingVisited) {
          emit(SplashNavigateToLogin());
        } else {
          emit(SplashNavigateToBoarding());
        }
      },
    );
  }
}
