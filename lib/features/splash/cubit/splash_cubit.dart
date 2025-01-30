import 'package:bright/core/database/cache_helper.dart';
import 'package:bright/core/database/cache_key.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bright/features/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  // ***** start when app is launch and go to the next screen after 4 seconds
  void splashViewTimer(Map<String, String> queryParameters) async {
    await Future.delayed(
      Duration(seconds: 4),
      () async {
        // get deepLinkPath from queryParameters
        final String? deepLinkPath = queryParameters[RouteKey.deepLinkPath];

        // build new uri to contain the path of next screen
        if (deepLinkPath != null) {
          Uri uri = Uri(
            path: deepLinkPath, // set accual path of deep link
            queryParameters: queryParameters,
          );

          // navigate to next screen and pass the new uri
          if (uri.path == RouteKey.loginView) {
            emit(SplashNavigateToLoginWithUri(uri: uri));
          } else if (uri.path == RouteKey.resetPasswordView) {
            emit(SplashNavigateToResetPasswordWithUri(uri: uri));
          }
          return;
        }

        // check if userId exists in the cache then user is login
        bool isUserIdExists =
            await getIt<CacheHelper>().containsKey(key: CacheKey.userId);

        if (isUserIdExists) {
          emit(SplashNavigateToDropDownView());
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
