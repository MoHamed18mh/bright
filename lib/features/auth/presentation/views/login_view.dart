import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/functions/show_toast.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/features/auth/presentation/widgets/auth_head_widget.dart';
import 'package:bright/core/widgets/text_button_widget.dart';
import 'package:bright/features/auth/cubit/auth_cubit.dart';
import 'package:bright/features/auth/cubit/auth_state.dart';
import 'package:bright/features/auth/presentation/widgets/custom/custom_login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ConfirmSuccessState) {
          showToast(msg: state.message);
        } else if (state is ConfirmFailureState) {
          showToast(msg: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: (state is ConfirmLoadingState)
              ? Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpace.paddingSpace),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                          child: const SizedBox(height: AppSpace.maxSpace3)),
                      SliverToBoxAdapter(child: AuthHeadWidget()),
                      SliverToBoxAdapter(
                          child: SizedBox(height: AppSpace.maxSpace2)),

                      // ********** the body of the login screen
                      SliverToBoxAdapter(child: CustomLoginForm()),

                      // ********** text button for go to login screen
                      SliverToBoxAdapter(
                        child: TextButtonWidget(
                          alignment: Alignment.center,
                          onPressed: () => navigateReplacement(
                              context, RouteKey.registerView),
                          text1: AppStrings.dontHaveAccount,
                          text2: AppStrings.signUp,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
