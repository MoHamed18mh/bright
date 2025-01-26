import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class CustomRegisterForm extends StatelessWidget {
  const CustomRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First Name field
        TextFormFieldWidget(
          text: AppStrings.firstName,
          prefixIcon: Icon(Icons.person_outline),
        ),
        const SizedBox(height: AppSpace.mainSpace),
        // last Name field
        TextFormFieldWidget(
          text: AppStrings.lastName,
          prefixIcon: Icon(Icons.person_outline),
        ),
        const SizedBox(height: AppSpace.mainSpace),
        // Email field
        TextFormFieldWidget(
          text: AppStrings.email,
          prefixIcon: Icon(Icons.email_outlined),
        ),
        const SizedBox(height: AppSpace.mainSpace),
        // Phone field
        TextFormFieldWidget(
          text: AppStrings.phoneNumber,
          prefixIcon: Icon(Icons.phone_outlined),
        ),
        const SizedBox(height: AppSpace.mainSpace),
        // password field
        TextFormFieldWidget(
          text: AppStrings.password,
          prefixIcon: Icon(Icons.lock_open_outlined),
          suffixIcon: Icon(Icons.visibility_outlined),
        ),
        const SizedBox(height: AppSpace.mainSpace),
        // confirm password field
        TextFormFieldWidget(
          text: AppStrings.confirmPassword,
          prefixIcon: Icon(Icons.lock_open_outlined),
          suffixIcon: Icon(Icons.visibility_outlined),
        ),
        const SizedBox(height: AppSpace.meduimSpace2),
        // register button
        MaterialButtonWidget(onPressed: () {}, text: AppStrings.register)
      ],
    );
  }
}
