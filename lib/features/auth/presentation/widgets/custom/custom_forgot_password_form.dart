import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormFieldWidget(
            text: AppStrings.email,
            prefixIcon: Icon(Icons.email_outlined),
          ),
          SizedBox(height: AppSpace.meduimSpace2),
          // ************** send verify email to reset password ****************
          MaterialButtonWidget(
            onPressed: () {},
            text: AppStrings.sendEmail,
          ),
        ],
      ),
    );
  }
}
