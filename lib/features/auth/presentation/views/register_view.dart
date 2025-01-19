import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/app_header_widget.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/core/widgets/text_button_widget.dart';
import 'package:bright/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.smallSpace),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: AppSpace.maxSpace)),
            SliverToBoxAdapter(child: AppHeaderWidget()),
            SliverToBoxAdapter(child: SizedBox(height: AppSpace.maxSpace / 2)),
            SliverToBoxAdapter(child: CustomRegisterForm()),
            SliverToBoxAdapter(
              child: TextButtonWidget(
                alignment: Alignment.center,
                onPressed: () => navigateReplacement(context, '/LoginView'),
                text1: AppStrings.alreadyHaveAccount,
                text2: AppStrings.signIn,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomRegisterForm extends StatelessWidget {
  const CustomRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldWidget(
          text: AppStrings.firstName,
          prefixIcon: Icon(Icons.person_outline),
        ),
        const SizedBox(height: AppSpace.mainSpace),
        TextFormFieldWidget(
          text: AppStrings.lastName,
          prefixIcon: Icon(Icons.person_outline),
        ),
        const SizedBox(height: AppSpace.mainSpace),
        TextFormFieldWidget(
          text: AppStrings.email,
          prefixIcon: Icon(Icons.email_outlined),
        ),
        const SizedBox(height: AppSpace.mainSpace),
        TextFormFieldWidget(
          text: AppStrings.password,
          prefixIcon: Icon(Icons.lock_open_outlined),
          suffixIcon: Icon(Icons.visibility_outlined),
        ),
        const SizedBox(height: AppSpace.mainSpace),
        TextFormFieldWidget(
          text: AppStrings.confirmPassword,
          prefixIcon: Icon(Icons.lock_open_outlined),
          suffixIcon: Icon(Icons.visibility_outlined),
        ),
        const SizedBox(height: AppSpace.mainSpace * 2.5),
        MaterialButtonWidget(onPressed: () {}, text: AppStrings.register)
      ],
    );
  }
}
