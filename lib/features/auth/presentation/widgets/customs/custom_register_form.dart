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
        if (state is RegisterSuccessState) {
          showToast(msg: state.message);
          navigateReplacement(context, RouteKey.loginView);
        } else if (state is RegisterFailureState) {
          showToast(msg: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.registerKey,
          child: Column(
            children: [
              // ************** First Name field 
              TextFormFieldWidget(
                text: AppStrings.firstName,
                prefixIcon: Icon(Icons.person_outline),
                validator: authCubit.validator,
                controller: authCubit.registerFirstNameController,
              ),
              const SizedBox(height: AppSpace.mainSpace),

              // ************** last Name field 
              TextFormFieldWidget(
                text: AppStrings.lastName,
                prefixIcon: Icon(Icons.person_outline),
                validator: authCubit.validator,
                controller: authCubit.registerLastNameController,
              ),
              const SizedBox(height: AppSpace.mainSpace),

              // ************** Email field 
              TextFormFieldWidget(
                text: AppStrings.email,
                prefixIcon: Icon(Icons.email_outlined),
                validator: authCubit.validator,
                controller: authCubit.registerEmailController,
              ),
              const SizedBox(height: AppSpace.mainSpace),

              // ************** Phone field 
              TextFormFieldWidget(
                text: AppStrings.phoneNumber,
                prefixIcon: Icon(Icons.phone_outlined),
                validator: authCubit.validator,
                controller: authCubit.registerMobileController,
              ),
              const SizedBox(height: AppSpace.mainSpace),

              // ************** password field
              TextFormFieldPasswordWidget(
                text: AppStrings.password,
                validator: authCubit.validator,
                controller: authCubit.registerPasswordController,
              ),
              const SizedBox(height: AppSpace.mainSpace),

              // ************** confirm password field
              TextFormFieldPasswordWidget(
                text: AppStrings.confirmPassword,
                validator: authCubit.validator,
                controller: authCubit.registerConfirmPasswordController,
              ),
              const SizedBox(height: AppSpace.meduimSpace2),

              // ************** register button
              (state is RegisterLoadingState)
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
