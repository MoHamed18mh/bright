import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/functions/show_toast.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/features/auth/cubit/auth_cubit.dart';
import 'package:bright/features/auth/cubit/auth_state.dart';
import 'package:bright/features/auth/presentation/widgets/text_form_field_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomResetPasswordForm extends StatelessWidget {
  const CustomResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.read<AuthCubit>();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          showToast(msg: state.message);
          navigateReplacement(context, RouteKey.loginView);
        } else if (state is ResetPasswordFailure) {
          showToast(msg: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.resetPasswordKey,
          child: Column(
            children: [
              //  reset password field
              TextFormFieldPasswordWidget(
                text: AppStrings.password,
                controller: authCubit.resetPasswordController,
              ),
              const SizedBox(height: AppSpace.main),

              //  reset confirm password field
              TextFormFieldPasswordWidget(
                text: AppStrings.confirmPassword,
                controller: authCubit.resetConfirmPasswordController,
              ),
              const SizedBox(height: AppSpace.meduim2),

              //  button for create new password
              (state is ResetPasswordLoading)
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : MaterialButtonWidget(
                      onPressed: () {
                        if (authCubit.resetPasswordKey.currentState!
                            .validate()) {
                          authCubit.resetPassword();
                        }
                      },
                      text: AppStrings.createNewPassword,
                    ),
            ],
          ),
        );
      },
    );
  }
}
