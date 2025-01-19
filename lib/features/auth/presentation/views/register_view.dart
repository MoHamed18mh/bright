import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/app_header_widget.dart';
import 'package:bright/core/widgets/text_button_widget.dart';
import 'package:bright/features/auth/presentation/widgets/custom_register_form.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: AppSpace.maxSpace1)),
            SliverToBoxAdapter(child: AppHeaderWidget()),
            SliverToBoxAdapter(child: SizedBox(height: AppSpace.meduimSpace1)),
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
