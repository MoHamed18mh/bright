import 'package:bright/core/api/dio_consumer.dart';
import 'package:bright/core/api/end_point.dart';
import 'package:bright/core/functions/handle_deep_link.dart';
import 'package:bright/core/repositories/auth_repo.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/features/auth/cubit/auth_cubit.dart';
import 'package:bright/features/auth/presentation/views/login_view.dart';
import 'package:bright/features/auth/presentation/views/register_view.dart';
import 'package:bright/features/boarding/cubit/boarding_cubit.dart';
import 'package:bright/features/boarding/prsentation/views/boarding_view.dart';
import 'package:bright/features/home/presentation/views/home_view.dart';
import 'package:bright/features/splash/cubit/splash_cubit.dart';
import 'package:bright/features/splash/presentation/views/splash_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  // ************** set start screen *******************************************
  initialLocation: RouteKey.launch,
  // *********** Redirect deep links while retaining the data sent with it *****
  redirect: (context, state) {
    final String? deepLinkPath = handleDeepLink(state.uri.path);
    if (deepLinkPath != null) {
      return Uri(
        path: deepLinkPath,
        queryParameters: state.uri.queryParameters,
      ).toString();
    } else {
      return null;
    }
  },
  //
  routes: [
    GoRoute(
      path: RouteKey.launch,
      builder: (context, state) {
        // ****************** get data from deep link **************************
        final String? email = state.uri.queryParameters[ApiKey.email];
        final String? token = state.uri.queryParameters[ApiKey.token];

        final SplashCubit splashCubit =
            SplashCubit(AuthRepo(api: DioConsumer(dio: Dio())));

        // ********** if email or token is not unll call confirmEmail **********
        if (email != null && token != null) {
          splashCubit.getEmailAndTokenFromDeepLink(email: email, token: token);
        }
        splashCubit.splashViewTimer();

        return BlocProvider(
          create: (context) => splashCubit,
          child: SplashView(),
        );
      },
    ),
    //
    GoRoute(
      path: RouteKey.boardingView,
      builder: (context, state) => BlocProvider(
        create: (context) => BoardingCubit(),
        child: BoardingView(),
      ),
    ),
    //
    GoRoute(
      path: RouteKey.loginView,
      builder: (context, state) {
        return BlocProvider(
          create: (context) =>
              AuthCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
          child: LoginView(),
        );
      },
    ),
    //
    GoRoute(
      path: RouteKey.registerView,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
        child: RegisterView(),
      ),
    ),
    //
    GoRoute(
      path: RouteKey.homeView,
      builder: (context, state) => HomeView(),
    ),
    //
  ],
);
