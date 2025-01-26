import 'package:bright/core/routes/route_key.dart';
import 'package:bright/features/auth/presentation/views/login_view.dart';
import 'package:bright/features/auth/presentation/views/register_view.dart';
import 'package:bright/features/boarding/cubit/boarding_cubit.dart';
import 'package:bright/features/boarding/prsentation/views/boarding_view.dart';
import 'package:bright/features/splash/cubit/splash_cubit.dart';
import 'package:bright/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouteKey.launch,
      builder: (context, state) => BlocProvider(
        create: (context) => SplashCubit()
          ..splashViewTimer(), // start splashViewTimer when screen is launch
        child: SplashView(),
      ),
    ),
    GoRoute(
      path: RouteKey.boardingView,
      builder: (context, state) => BlocProvider(
        create: (context) => BoardingCubit(),
        child: BoardingView(),
      ),
    ),
    GoRoute(
      path: RouteKey.loginView,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: RouteKey.registerView,
      builder: (context, state) => RegisterView(),
    ),
  ],
);
