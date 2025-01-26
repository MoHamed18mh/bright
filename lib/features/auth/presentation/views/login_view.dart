import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/app_header_widget.dart';
import 'package:bright/core/widgets/text_button_widget.dart';
import 'package:bright/features/auth/presentation/widgets/custom/custom_login_form.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: AppSpace.maxSpace3)),
          SliverToBoxAdapter(child: AppHeaderWidget()),
          SliverToBoxAdapter(child: SizedBox(height: AppSpace.maxSpace2)),
          // the body of the login screen
          SliverToBoxAdapter(child: CustomLoginForm()),
          // text button for go to login screen
          SliverToBoxAdapter(
            child: TextButtonWidget(
              alignment: Alignment.center,
              onPressed: () => navigateReplacement(context, RouteKey.registerView),
              text1: AppStrings.dontHaveAccount,
              text2: AppStrings.signUp,
              fontSize: 16,
            ),
          )
        ],
      ),
    ));
  }
}
