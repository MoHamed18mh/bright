import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/features/auth/presentation/widgets/custom/custom_reset_password_form.dart';
import 'package:bright/features/auth/presentation/widgets/forgot_password_title.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: const SizedBox(height: AppSpace.maxSpace2)),

          SliverToBoxAdapter(
            child: ForgotPasswordTitle(
              text1: AppStrings.newPassword,
              text2: AppStrings.yourNewPassword,
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: AppSpace.meduimSpace2)),

          // *************** fields and button of reset password screen 
          SliverToBoxAdapter(child: CustomResetPasswordForm()),
        ],
      ),
    ));
  }
}
