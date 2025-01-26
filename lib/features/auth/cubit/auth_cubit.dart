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
  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmPasswordController =
      TextEditingController();

  // change the value of obscurePasswordValue
  void changeObscurePasswordValue() {
    if (obscurePasswordValue) {
      obscurePasswordValue = false;
    } else {
      obscurePasswordValue = true;
    }
    emit(ChangeObscurePasswordState());
  }

  // check if text form field is empty
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  // login function
  Future login() async {
    emit(LoginLoadinState());
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
}
