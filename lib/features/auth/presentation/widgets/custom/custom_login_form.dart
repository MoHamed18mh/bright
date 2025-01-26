import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/core/widgets/text_button_widget.dart';
import 'package:bright/features/auth/cubit/auth_cubit.dart';
import 'package:bright/features/auth/cubit/auth_state.dart';
import 'package:bright/features/auth/presentation/widgets/text_form_field_password_widget.dart';
import 'package:bright/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        // read from AuthCubit
        AuthCubit authCubit = context.read<AuthCubit>();
        return Form(
          key: authCubit.loginKey,
          child: Column(
            children: [
              // email field
              TextFormFieldWidget(
                text: AppStrings.email,
                prefixIcon: Icon(Icons.email_outlined),
                validator: authCubit.validator,
                controller: authCubit.loginEmailController,
              ),
              const SizedBox(height: AppSpace.mainSpace),
              // password field
              TextFormFieldPasswrodWidget(
                text: AppStrings.password,
                prefixIcon: Icon(Icons.lock_open_outlined),
                validator: authCubit.validator,
                controller: authCubit.loginPasswordController,
              ),
              // text button for go to forgotPasswordView screen
              TextButtonWidget(
                alignment: Alignment.centerRight,
                onPressed: () {},
                text1: AppStrings.forgotPassword,
                fontSize: 13,
              ),
              const SizedBox(height: AppSpace.maxSpace1),
              // login button
              MaterialButtonWidget(
                onPressed: () {
                  authCubit.loginKey.currentState!.validate();
                },
                text: AppStrings.login,
              ),
            ],
          ),
        );
      },
    );
  }
}
