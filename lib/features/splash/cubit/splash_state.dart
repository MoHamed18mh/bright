class SplashState {}

final class SplashInitial extends SplashState {}

// *************** navigate states *********************************************
final class SplashNavigateToBoarding extends SplashState {}

final class SplashNavigateToLogin extends SplashState {}

final class SplashNavigateToHome extends SplashState {}

// *************** Confirm states **********************************************
final class ConfirmSuccessState extends SplashState {
  final String message;

  ConfirmSuccessState({required this.message});
}

final class ConfirmFailureState extends SplashState {
  final String errorMessage;

  ConfirmFailureState({required this.errorMessage});
}
// *****************************************************************************
