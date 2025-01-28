import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/features/auth/presentation/widgets/text_form_field_password_widget.dart';
import 'package:flutter/material.dart';

class CustomNewPasswordForm extends StatelessWidget {
  const CustomNewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormFieldPasswordWidget(text: AppStrings.password),
          SizedBox(height: AppSpace.mainSpace),
          TextFormFieldPasswordWidget(text: AppStrings.confirmPassword),
          SizedBox(height: AppSpace.meduimSpace2),
          // *********** button for create new password ************************
          MaterialButtonWidget(
            onPressed: () {},
            text: AppStrings.createNewPassword,
          ),
        ],
      ),
    );
  }
}
