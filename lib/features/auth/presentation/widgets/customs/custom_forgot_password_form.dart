import 'package:bright/core/functions/show_toast.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/features/auth/cubit/auth_cubit.dart';
import 'package:bright/features/auth/cubit/auth_state.dart';
import 'package:bright/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.read<AuthCubit>();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          showToast(msg: state.message);
        } else if (state is ForgotPasswordFailure) {
          showToast(msg: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.forgotPasswordKey,
          child: Column(
            children: [
              //  forgot password email field
              TextFormFieldWidget(
                text: AppStrings.email,
                prefixIcon: const Icon(Icons.email_outlined),
                controller: authCubit.forgotPassEmailController,
              ),
              const SizedBox(height: AppSpace.meduim2),

              //  button send verify email for reset password
              (state is ForgotPasswordLoading)
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : MaterialButtonWidget(
                      onPressed: () {
                        if (authCubit.forgotPasswordKey.currentState!
                            .validate()) {
                          authCubit.forgotPassword();
                        }
                      },
                      text: AppStrings.sendEmail,
                    ),
            ],
          ),
        );
      },
    );
  }
}
