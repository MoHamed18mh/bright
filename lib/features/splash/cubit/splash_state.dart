class SplashState {}

final class SplashInitial extends SplashState {}

// *************** navigate states *********************************************
final class SplashNavigateToBoarding extends SplashState {}

final class SplashNavigateToLogin extends SplashState {}

final class SplashNavigateToLoginWithUri extends SplashState {
  final Uri uri;

  SplashNavigateToLoginWithUri({required this.uri});
}

final class SplashNavigateToResetPasswordWithUri extends SplashState {
  final Uri uri;

  SplashNavigateToResetPasswordWithUri({required this.uri});
}

final class SplashNavigateToHomeView extends SplashState {}
