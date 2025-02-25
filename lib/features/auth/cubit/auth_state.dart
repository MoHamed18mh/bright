class AuthState {}

final class AuthInitial extends AuthState {}

//  password text field state
final class ChangeObscurePassword extends AuthState {}

//  login states
final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final String displayName;
  LoginSuccess({required this.displayName});
}

final class LoginFailure extends AuthState {
  final String errorMessage;
  LoginFailure({required this.errorMessage});
}

//  register states
final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  final String message;
  RegisterSuccess({required this.message});
}

final class RegisterFailure extends AuthState {
  final String errorMessage;
  RegisterFailure({required this.errorMessage});
}

//  Confirm states
final class ConfirmLoading extends AuthState {}

final class ConfirmSuccess extends AuthState {
  final String message;
  ConfirmSuccess({required this.message});
}

final class ConfirmFailure extends AuthState {
  final String errorMessage;
  ConfirmFailure({required this.errorMessage});
}

//  ForgotPassword states
final class ForgotPasswordLoading extends AuthState {}

final class ForgotPasswordSuccess extends AuthState {
  final String message;
  ForgotPasswordSuccess({required this.message});
}

final class ForgotPasswordFailure extends AuthState {
  final String errorMessage;
  ForgotPasswordFailure({required this.errorMessage});
}

//  ResetPassword states
final class ResetPasswordLoading extends AuthState {}

final class ResetPasswordSuccess extends AuthState {
  final String message;
  ResetPasswordSuccess({required this.message});
}

final class ResetPasswordFailure extends AuthState {
  final String errorMessage;
  ResetPasswordFailure({required this.errorMessage});
}
