import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/back_icon_button_widget.dart';
import 'package:bright/features/auth/presentation/widgets/custom/custom_forgot_password_form.dart';
import 'package:bright/features/auth/presentation/widgets/forgot_password_title.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: AppSpace.maxSpace1)),
            //*************** go back for the previous screen ******************
            SliverToBoxAdapter(child: BackIconButtonWidget()),

            SliverToBoxAdapter(child: SizedBox(height: AppSpace.meduimSpace1)),
            SliverToBoxAdapter(
              child: ForgotPasswordTitle(
                text1: AppStrings.enterEmail,
                text2: AppStrings.willSendMessage,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: AppSpace.meduimSpace1)),
            // *************** fields and button of forgot screen **************
            SliverToBoxAdapter(child: CustomForgotPasswordForm()),
          ],
        ),
      ),
    );
  }
}
