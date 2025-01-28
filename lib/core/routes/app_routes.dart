import 'package:bright/core/api/dio_consumer.dart';
import 'package:bright/core/api/end_point.dart';
import 'package:bright/core/functions/handle_deep_link.dart';
import 'package:bright/core/repositories/auth_repo.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/features/auth/cubit/auth_cubit.dart';
import 'package:bright/features/auth/presentation/views/forgot_password_view.dart';
import 'package:bright/features/auth/presentation/views/login_view.dart';
import 'package:bright/features/auth/presentation/views/reset_password_view.dart';
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
    // handel deep link with goRouter paths
    final String? deepLinkPath = handleDeepLink(state.uri.path);

    // build new deep link for open app with splashView
    if (deepLinkPath != null) {
      return Uri(
        path: RouteKey.launch, // set lanunc path to open app on splash view
        queryParameters: {
          RouteKey.deepLinkPath:
              deepLinkPath, // save handled deepLinkPath in queryParameters
          ...state.uri.queryParameters, // set all other value with out changes
        },
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
        return BlocProvider(
          create: (context) =>
              // send query parameters to splashCubit with splashViewTimer
              // to navigate to the next screen after splash
              SplashCubit()..splashViewTimer(state.uri.queryParameters),
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
        // *********** reseive new uri from splash
        final Uri? uri = state.extra as Uri?;
        final String? deepEmail = uri?.queryParameters[ApiKey.email];
        final String? deepToken = uri?.queryParameters[ApiKey.token];

        final AuthCubit authCubit =
            AuthCubit(AuthRepo(api: DioConsumer(dio: Dio())));

        if (deepEmail != null && deepToken != null) {
          authCubit.confirmEmail(email: deepEmail, token: deepToken);
        }
        return BlocProvider(
          create: (context) => authCubit,
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
      path: RouteKey.forgotPasswordView,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
        child: ForgotPasswordView(),
      ),
    ),
    //
    GoRoute(
        path: RouteKey.resetPasswordView,
        builder: (context, state) {

          // receive new uri form splash
          final Uri? uri = state.extra as Uri?;
          final String? deepEmail = uri?.queryParameters[ApiKey.email];
          final String? deepToken = uri?.queryParameters[ApiKey.token];

          final AuthCubit authCubit =
              AuthCubit(AuthRepo(api: DioConsumer(dio: Dio())));

              // ************* send deepEmail and deepToken to Auth cubit
          if (deepEmail != null && deepToken != null) {
            authCubit.getEmailAndToken(email: deepEmail, token: deepToken);
          }

          return BlocProvider(
            create: (context) => authCubit,
            child: ResetPasswordView(),
          );
        }),
    //
    GoRoute(
      path: RouteKey.homeView,
      builder: (context, state) => HomeView(),
    ),
    //
  ],
);
