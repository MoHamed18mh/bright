import 'package:bright/core/database/cache_helper.dart';
import 'package:bright/core/database/cache_key.dart';
import 'package:bright/core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bright/features/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  String? deepEmail;
  String? deepToken;

  // ***** start when app is launch and go to the next screen after 4 seconds **
  void splashViewTimer() async {
    await Future.delayed(
      Duration(seconds: 4),
      () async {
        // check if userId exists in the cache
        bool isUserIdExists =
            await getIt<CacheHelper>().containsKey(key: CacheKey.userId);

        if (isUserIdExists) {
          emit(SplashNavigateToHome());
        } else {
          // get the value of the 'isBoardingVisited' from the database and make it 'false' if not found
          bool isBoardingVisited =
              getIt<CacheHelper>().getData(key: CacheKey.isBoardingVisited) ??
                  false;

          if (isBoardingVisited) {
            emit(SplashNavigateToLogin());
          } else {
            emit(SplashNavigateToBoarding());
          }
        }
      },
    );
  }
  // ***************************************************************************
}
