import 'package:bright/core/repositories/auth_repo.dart';
import 'package:bright/features/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  // get auth repo
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

  //n******************* change the value of obscurePasswordValue **************
  void changeObscurePasswordValue() {
    if (obscurePasswordValue) {
      obscurePasswordValue = false;
    } else {
      obscurePasswordValue = true;
    }
    emit(ChangeObscurePasswordState());
  }
  // ***************************************************************************

  // ******** check if text form field is empty for validate *******************
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }
  // ***************************************************************************

  // *********************** register methodes *********************************
  // ****************** regisger
  Future register() async {
    emit(RegisterLoadingState());
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
          emit(RegisterFailureState(errorMessage: errorMessage.toString())),
      (messege) => emit(RegisterSuccessState(message: messege)),
    );
  }

  // ****************** confirm Email
  Future<void> confirmEmail(
      {required String email, required String token}) async {
    emit(ConfirmLoadingState());
    final response = await authRepo.confirmEmail(email: email, token: token);
    response.fold(
      (errorMessage) => emit(ConfirmFailureState(errorMessage: errorMessage)),
      (message) => emit(ConfirmSuccessState(message: message)),
    );
  }
  // ***************************************************************************

  // *********************** login method **************************************
  Future login() async {
    emit(LoginLoadingState());
    final response = await authRepo.login(
      email: loginEmailController.text,
      password: loginPasswordController.text,
    );
    response.fold(
      (errorMessage) => emit(LoginFailureState(errorMessage: errorMessage)),
      (loginModel) =>
          emit(LoginSuccessState(displayName: loginModel.user.displayName)),
    );
  }
  // ***************************************************************************
}
