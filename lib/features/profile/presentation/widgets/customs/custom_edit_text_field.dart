import 'package:bright/core/functions/navigation.dart';
import 'package:bright/core/functions/show_toast.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_space.dart';
import 'package:bright/core/utils/app_strings.dart';
import 'package:bright/core/widgets/material_button_widget.dart';
import 'package:bright/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:bright/features/profile/cubit/profile_cubit.dart';
import 'package:bright/features/profile/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomEditTextField extends StatelessWidget {
  const CustomEditTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is EditUserSuccess) {
          showToast(msg: state.message);
          navigateReplacement(context, RouteKey.myDetailsView);
        } else if (state is EditUserFailure) {
          showToast(msg: state.errorMessage.toString());
        }
      },
      builder: (context, state) {
        return Form(
          key: profileCubit.editKey,
          child: Column(
            children: [
              // edit first name
              TextFormFieldWidget(
                text: AppStrings.firstName,
                controller: profileCubit.editFirstNameController,
              ),
              const SizedBox(height: AppSpace.padding),

              // edit last name
              TextFormFieldWidget(
                text: AppStrings.lastName,
                controller: profileCubit.editLastNameController,
              ),
              const SizedBox(height: AppSpace.padding),

              // edit phone number
              TextFormFieldWidget(
                text: AppStrings.phoneNumber,
                controller: profileCubit.editMobileController,
              ),
              const SizedBox(height: AppSpace.max1),

              // edit button
              (state is EditUserLoading)
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : MaterialButtonWidget(
                      onPressed: () {
                       if (profileCubit.editKey.currentState!.validate()) {
                          profileCubit.editUser();
                        }
                      },
                      text: AppStrings.edit)
            ],
          ),
        );
      },
    );
  }
}
