import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/app_name_widget.dart';
import 'package:bright/core/widgets/text_button_widget.dart';
import 'package:bright/features/auth/presentation/widgets/customs/custom_register_form.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.padding),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: AppSpace.meduim1)),
            const SliverToBoxAdapter(child: AppNameWidget()),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpace.meduim1)),

            // the body of the register screen
            const SliverToBoxAdapter(child: CustomRegisterForm()),

            // text button for go to loginView screen
            SliverToBoxAdapter(
              child: TextButtonWidget(
                alignment: Alignment.center,
                onPressed: () =>
                    navigateReplacement(context, RouteKey.loginView),
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
