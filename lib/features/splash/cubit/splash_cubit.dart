import 'package:bright/core/database/cache_helper.dart';
import 'package:bright/core/database/cache_key.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bright/features/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  // The timer starts when you launch the application and moves to the appropriate screen after 4 seconds
  void splashViewTimer(Map<String, String> queryParameters) async {
    await Future.delayed(
      const Duration(seconds: 4),
      () async {
        // Trying to get deepLinkPath from queryParameters.
        final String? deepLinkPath = queryParameters[RouteKey.deepLinkPath];

        // If deepLinkPath exists, a new URI is constructed and passed to the appropriate screen.
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

        // Check for userId in the cache to determine if the user is logged in.
        bool isUserIdExists =
            getIt<CacheHelper>().containsKey(key: CacheKey.userId);

        if (isUserIdExists) {
          emit(SplashNavigateToHomeView());
        } else {
          // Check if the Boarding screen has been visited before.
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
}
