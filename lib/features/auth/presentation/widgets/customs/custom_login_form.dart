import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/functions/show_toast.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_colors.dart';
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
    AuthCubit authCubit = context.read<AuthCubit>();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showToast(msg: '${AppStrings.wellcom} ${state.displayName}');
          navigateReplacement(context, RouteKey.homeView);
        } else if (state is LoginFailure) {
          showToast(msg: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.loginKey,
          child: Column(
            children: [
              //  email field
              TextFormFieldWidget(
                text: AppStrings.email,
                prefixIcon: const Icon(Icons.email_outlined),
                controller: authCubit.loginEmailController,
              ),
              const SizedBox(height: AppSpace.main),

              //  password field
              TextFormFieldPasswordWidget(
                text: AppStrings.password,
                controller: authCubit.loginPasswordController,
              ),

              //  button go to forgot password screen
              TextButtonWidget(
                alignment: Alignment.centerRight,
                onPressed: () => navigate(context, RouteKey.forgotPasswordView),
                text1: AppStrings.forgotPassword,
                fontSize: 13,
              ),
              const SizedBox(height: AppSpace.max1),

              //  login button
              (state is LoginLoading)
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : MaterialButtonWidget(
                      onPressed: () {
                        if (authCubit.loginKey.currentState!.validate()) {
                          authCubit.login();
                        }
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
