import 'package:bright/core/repositories/auth_repo.dart';
import 'package:bright/features/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  //
  final AuthRepo authRepo;

  // text form field password obscure
  bool obscurePasswordValue = true;

  // login keys
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  // register keys
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController registerFirstNameController = TextEditingController();
  TextEditingController registerLastNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerMobileController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmPasswordController =
      TextEditingController();

  // forgot password key
  GlobalKey<FormState> forgotPasswordKey = GlobalKey<FormState>();
  TextEditingController forgotPassEmailController = TextEditingController();

  // reset password key
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  TextEditingController resetPasswordController = TextEditingController();
  TextEditingController resetConfirmPasswordController =
      TextEditingController();

  // data from deep link
  String? deepEmail;
  String? deepToken;

  //  change the value of obscurePasswordValue
  void changeObscurePasswordValue() {
    obscurePasswordValue = !obscurePasswordValue;
    emit(ChangeObscurePassword());
  }

  //  register and confirm methodes
  //  regisger
  Future<void> register() async {
    emit(RegisterLoading());
    final response = await authRepo.register(
      firstName: registerFirstNameController.text,
      lastName: registerLastNameController.text,
      email: registerEmailController.text,
      mobile: registerMobileController.text,
      password: registerPasswordController.text,
      confirmPassword: registerConfirmPasswordController.text,
    );
    response.fold(
      (errorMessage) =>
          emit(RegisterFailure(errorMessage: errorMessage.toString())),
      (messege) => emit(RegisterSuccess(message: messege)),
    );
  }

  //  confirm Email
  Future<void> confirmEmail(
      {required String email, required String token}) async {
    emit(ConfirmLoading());
    final response = await authRepo.confirmEmail(email: email, token: token);
    response.fold(
      (errorMessage) => emit(ConfirmFailure(errorMessage: errorMessage)),
      (message) => emit(ConfirmSuccess(message: message)),
    );
  }

  //  login method
  Future<void> login() async {
    emit(LoginLoading());
    final response = await authRepo.login(
      email: loginEmailController.text,
      password: loginPasswordController.text,
    );
    response.fold(
      (errorMessage) => emit(LoginFailure(errorMessage: errorMessage)),
      (loginModel) =>
          emit(LoginSuccess(displayName: loginModel.user.displayName)),
    );
  }

  //  forgot password and reset  method
  //  forgot password
  Future<void> forgotPassword() async {
    emit(ForgotPasswordLoading());
    final response =
        await authRepo.forgotPassword(email: forgotPassEmailController.text);
    response.fold(
      (errorMessage) => emit(ForgotPasswordFailure(errorMessage: errorMessage)),
      (message) => emit(ForgotPasswordSuccess(message: message)),
    );
  }

  //  get email and token from deep link
  void getEmailAndToken({required String email, required String token}) {
    deepEmail = email;
    deepToken = token;
  }

  //  reset password
  Future<void> resetPassword() async {
    emit(ResetPasswordLoading());
    final response = await authRepo.resetPassword(
      email: deepEmail!,
      token: deepToken!,
      password: resetPasswordController.text,
      confirmPassword: resetConfirmPasswordController.text,
    );
    response.fold(
      (errorMessage) => emit(ResetPasswordFailure(errorMessage: errorMessage)),
      (message) => emit(ResetPasswordSuccess(message: message)),
    );
  }
}
