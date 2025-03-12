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
import 'package:bright/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRegisterForm extends StatelessWidget {
  const CustomRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showToast(msg: state.message);
          navigateReplacement(context, RouteKey.loginView);
        } else if (state is RegisterFailure) {
          showToast(msg: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.registerKey,
          child: Column(
            children: [
              //  First Name 
              TextFormFieldWidget(
                text: AppStrings.firstName,
                prefixIcon: const Icon(Icons.person_outline),
                controller: authCubit.registerFirstNameController,
              ),
              const SizedBox(height: AppSpace.main),

              //  last Name 
              TextFormFieldWidget(
                text: AppStrings.lastName,
                prefixIcon: const Icon(Icons.person_outline),
                // validator: authCubit.validator,
                controller: authCubit.registerLastNameController,
              ),
              const SizedBox(height: AppSpace.main),

              //  Email 
              TextFormFieldWidget(
                text: AppStrings.email,
                prefixIcon: const Icon(Icons.email_outlined),
                controller: authCubit.registerEmailController,
              ),
              const SizedBox(height: AppSpace.main),

              //  Phone number
              TextFormFieldWidget(
                text: AppStrings.phoneNumber,
                prefixIcon: const Icon(Icons.phone_outlined),
                controller: authCubit.registerMobileController,
              ),
              const SizedBox(height: AppSpace.main),

              //  password 
              TextFormFieldPasswordWidget(
                text: AppStrings.password,
                controller: authCubit.registerPasswordController,
              ),
              const SizedBox(height: AppSpace.main),

              //  confirm password 
              TextFormFieldPasswordWidget(
                text: AppStrings.confirmPassword,
                controller: authCubit.registerConfirmPasswordController,
              ),
              const SizedBox(height: AppSpace.meduim2),

              //  register button
              (state is RegisterLoading)
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : MaterialButtonWidget(
                      onPressed: () {
                        if (authCubit.registerKey.currentState!.validate()) {
                          authCubit.register();
                        }
                      },
                      text: AppStrings.register,
                    ),
            ],
          ),
        );
      },
    );
  }
}
