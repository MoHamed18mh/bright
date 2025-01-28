import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/features/auth/presentation/widgets/custom/custom_new_password_form.dart';
import 'package:bright/features/auth/presentation/widgets/forgot_password_title.dart';
import 'package:flutter/material.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpace.paddingSpace),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: AppSpace.maxSpace2)),
          SliverToBoxAdapter(
            child: ForgotPasswordTitle(
              text1: AppStrings.newPassword,
              text2: AppStrings.yourNewPassword,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpace.meduimSpace2)),
          // *************** fields and button of New password screen **********
          SliverToBoxAdapter(child: CustomNewPasswordForm()),
        ],
      ),
    ));
  }
}

