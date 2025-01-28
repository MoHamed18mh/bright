class AuthState {}

final class AuthInitial extends AuthState {}

// ************* password text field state ************************************
final class ChangeObscurePasswordState extends AuthState {}

// ************* login states **************************************************
final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {
  final String displayName;

  LoginSuccessState({required this.displayName});
}

final class LoginFailureState extends AuthState {
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}
// *****************************************************************************

// ************* register states ***********************************************
final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {
  final String message;

  RegisterSuccessState({required this.message});
}

final class RegisterFailureState extends AuthState {
  final String errorMessage;

  RegisterFailureState({required this.errorMessage});
}
// *****************************************************************************

// ************* Confirm states ***********************************************
final class ConfirmLoadingState extends AuthState {}

final class ConfirmSuccessState extends AuthState {
  final String message;

  ConfirmSuccessState({required this.message});
}

final class ConfirmFailureState extends AuthState {
  final String errorMessage;

  ConfirmFailureState({required this.errorMessage});
}
// *****************************************************************************
