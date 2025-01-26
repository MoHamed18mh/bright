import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/core/widgets/text_button_widget.dart';
import 'package:bright/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // email field
          TextFormFieldWidget(
            text: AppStrings.email,
            prefixIcon: Icon(Icons.email_outlined),
          ),
          const SizedBox(height: AppSpace.mainSpace),
          // password field
          TextFormFieldWidget(
            text: AppStrings.password,
            prefixIcon: Icon(Icons.lock_open_outlined),
            suffixIcon: Icon(Icons.visibility_outlined),
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
            onPressed: () {},
            text: AppStrings.login,
          ),
        ],
      ),
    );
  }
}
