import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/features/splash/cubit/splash_cubit.dart';
import 'package:bright/features/splash/cubit/splash_state.dart';
import 'package:bright/features/splash/presentation/widgets/custom_shimmer_logo.dart';
import 'package:bright/features/splash/presentation/widgets/custom_shimmer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashNavigateToDropDownView) {
          navigateReplacement(context, RouteKey.dropDownView);
        } else if (state is SplashNavigateToBoarding) {
          navigateReplacement(context, RouteKey.boardingView);
        } else if (state is SplashNavigateToLogin) {
          navigateReplacement(context, RouteKey.loginView);
        } else if (state is SplashNavigateToLoginWithUri) {
          // pass new uri using extra to loginView goRouter
          navigateReplacement(context, RouteKey.loginView, extra: state.uri);
        } else if (state is SplashNavigateToResetPasswordWithUri) {
          // pass new uri using extra to resetPasswordView goRouter
          navigateReplacement(context, RouteKey.resetPasswordView,
              extra: state.uri);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomShimmerLogo(),
              SizedBox(height: AppSpace.mainSpace),
              CustomShimmerText(),
            ],
          ),
        ),
      ),
    );
  }
}
