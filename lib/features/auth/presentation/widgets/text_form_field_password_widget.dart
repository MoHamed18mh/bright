import 'package:bright/core/utils/app_colors.dart';
import 'package:bright/core/utils/app_text_style.dart';
import 'package:bright/features/auth/cubit/auth_cubit.dart';
import 'package:bright/features/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFormFieldPasswordWidget extends StatelessWidget {
  const TextFormFieldPasswordWidget({
    super.key,
    required this.text,
    this.validator,
    this.controller,
  });
  final String text;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return TextFormField(
          style: AppTextStyle.nunitoSans16LightBlackBold,
          controller: controller,
          validator: validator,
          obscureText: authCubit.obscurePasswordValue,
          cursorColor: AppColors.lightBlack,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_open_outlined),
            prefixIconColor: AppColors.primaryColor,
            hintText: text,
            hintStyle: AppTextStyle.nunitoSans13Grey700,
            suffixIcon: suffixIcon(context),
            suffixIconColor: AppColors.primaryColor,
            border: outLineInputBorder(),
            enabledBorder: outLineInputBorder(),
            focusedBorder: outLineInputBorder(),
            errorBorder: outLineInputBorder(),
          ),
        );
      },
    );
  }

  IconButton suffixIcon(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    return IconButton(
      onPressed: () => authCubit.changeObscurePasswordValue(),
      icon: authCubit.obscurePasswordValue
          ? Icon(Icons.visibility_outlined)
          : Icon(Icons.visibility_off_outlined),
    );
  }

  OutlineInputBorder outLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }
}
