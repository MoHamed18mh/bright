import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/core/widgets/text_button_widget.dart';
import 'package:bright/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class CustomLoginFormField extends StatelessWidget {
  const CustomLoginFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormFieldWidget(
            text: AppStrings.email,
            prefixIcon: Icon(Icons.email_outlined),
          ),
          const SizedBox(height: AppSpace.mainSpace),
          TextFormFieldWidget(
            text: AppStrings.password,
            prefixIcon: Icon(Icons.lock_outline),
            suffixIcon: Icon(Icons.visibility_outlined),
          ),
          TextButtonWidget(
            alignment: Alignment.centerRight,
            onPressed: () {},
            text1: AppStrings.forgotPassword,
            fontSize: 14,
          ),
          const SizedBox(height: AppSpace.mainSpace * 4),
          MaterialButtonWidget(onPressed: () {}, text: AppStrings.login)
        ],
      ),
    );
  }
}
