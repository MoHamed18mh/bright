class AuthState {}

final class AuthInitial extends AuthState {}

final class ChangeObscurePasswordState extends AuthState {}

final class LoginLoadinState extends AuthState {}

final class LoginSuccessState extends AuthState {
  final String displayName;

  LoginSuccessState({required this.displayName});
}

final class LoginFailureState extends AuthState {
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}
