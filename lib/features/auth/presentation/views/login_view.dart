import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/functions/show_toast.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/app_name_widget.dart';
import 'package:bright/core/widgets/text_button_widget.dart';
import 'package:bright/features/auth/cubit/auth_cubit.dart';
import 'package:bright/features/auth/cubit/auth_state.dart';
import 'package:bright/features/auth/presentation/widgets/customs/custom_login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ConfirmSuccess) {
          showToast(msg: state.message);
        } else if (state is ConfirmFailure) {
          showToast(msg: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: (state is ConfirmLoading)
              ? Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    left: AppSpace.padding,
                    right: AppSpace.padding,
                    top: AppSpace.max3,
                  ),
                  child: CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(child: AppNameWidget()),
                      const SliverToBoxAdapter(
                          child: SizedBox(height: AppSpace.max1)),

                      // the body of the login screen
                      const SliverToBoxAdapter(child: CustomLoginForm()),

                      // button go register screen
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
